package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.MemberMybatisDao;
import model.Member;

//http://localhost:8080/jspPro/member/index

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	MemberMybatisDao memberdao;
	Model m;
	HttpSession session;
	HttpServletRequest request;

	// 초기화 작업, 객체 초기화시에 사용
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}

	@RequestMapping("alert")
	public String alert(String member_id) {
		String msg = "로그인 하세요.";
		String url = "/member/login";

		if (member_id.equals("admin")) {
			msg = "자료 확인 불가합니다.";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("index")
	public String index() {
		m.addAttribute("name", "/member/*");

		return "/index";
	}

	// 박서현
	// ================================================================================================
	@RequestMapping("memberInfo")
	public String memberInfo() {
		String login = (String) session.getAttribute("member_id");
		Member mem = memberdao.selectOne(login);
		m.addAttribute("member", mem);

		return "/member/memberInfo"; // joinForm copy
	}

	@RequestMapping("memberUpdate")
	public String memberUpdate() {
		String login = (String) session.getAttribute("member_id");
		Member mem = memberdao.selectOne(login);
		m.addAttribute("member", mem);

		return "/member/memberUpdate"; // joinForm copy
	}

	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(Member member) throws Exception {
		String login = (String) session.getAttribute("member_id");
		member.setMember_id(login);

		String msg = "회원 자료가 없습니다.";
		String url = "/member/loginForm";

		Member oldmember = memberdao.selectOne(login);// 저장되어있는 회원자료 읽는다.
		if (oldmember != null) {
			if (oldmember.getMember_pw().equals(member.getMember_pw())) {
				int num = memberdao.updateMember(member);// 비밀번호 확인
				if (num > 0) {
					msg = member.getMember_id() + "님의 정보 수정이 되었습니다";
					url = "/member/memberInfo";
				} else {
					msg = "정보 수정이 실패 했습니다";
					url = "/member/memberUpdate";
				}

			} else {
				msg = "비밀번호가 틀렸습니다";
				url = "/member/memberUpdate";
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("memberPwUpdate")
	public String memberPwUpdate() throws Exception {
		return "/member/memberPwUpdate";
	}

	@RequestMapping("memberPwPro")
	public String memberPwPro(String member_pw, String chgpass1, String chgpass2) throws Exception {

		String login = (String) session.getAttribute("member_id");

		String msg = "비밀번호가 틀렸습니다.";
		String url = "/member/memberPwUpdate";

		Member member = memberdao.selectOne(login);
		if (member.getMember_pw().equals(member_pw)) { // password 확인
			
			if (chgpass1.equals(chgpass2)) {
				int num = memberdao.changePass(login, chgpass1);
				if (num > 0) {
					msg = member.getMember_id() + "님이 비밀번호가 변경 되었습니다";
					url = "/member/memberInfo";
				} else {
					msg = "비밀번호가 변경이 실패 했습니다";
					url = "/member/memberPwUpdate";
				}
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}

	// 박성주
	// ================================================================================================
	@GetMapping("join")
	public String join() {
		return "/member/join";
	}

	@PostMapping("joinPro")
	public String joinPro(Member member) throws Exception {
		int count = memberdao.insertMember(member);

		String msg = "";
		String url = "";

		if (count > 0) {
			msg = member.getMember_id() + "님의 가입이 완료 되었습니다";
			url = "/member/login";
		} else {
			msg = "회원가입이 실패 했습니다";
			url = "/member/join";

		}
		// 자료 보내기
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}

	@GetMapping("login")
	public String login() {
		return "/member/login";
	}

	@RequestMapping("loginPro")
	public String loginPro(String member_id, String member_pw, String member_nickname) {
		String msg = "아이디를 확인하세요";
		String url = "/member/login";

		Member mem = memberdao.selectOne(member_id);

		if (mem != null) {
			if (member_pw.equals(mem.getMember_pw())) {
				request.getSession().setAttribute("member_id", member_id);
				msg = mem.getMember_id() + "님이 로그인 하였습니다";
				url = "/member/index";
			} else {
				msg = "비밀번호를 확인 하세요";
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("logout")
	public String logout() {
		String login = (String) session.getAttribute("member_id");
		session.invalidate(); // logout

		String msg = login + "님이 로그아웃 되었습니다";
		String url = "/member/login";

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("memberDelete")
	public String memberDelete() {
		return "/member/memberDelete";
	}

	@RequestMapping("memberDeletePro")
	public String memberDeletePro(String member_pw) throws Exception {
		String login = (String) session.getAttribute("member_id");

		String msg = "비밀번호가 틀렸습니다";
		String url = "/member/memberDelete";

		Member member = memberdao.selectOne(login);
		if (member.getMember_pw().equals(member_pw)) { // password 확인
			int num = memberdao.deleteMember(login);
			if (num > 0) {
				msg = member.getMember_id() + "님이 탈퇴 처리되었습니다";
				session.invalidate(); // logout
				url = "/member/login";
			} else {
				msg = "회원탈퇴가 실패 했습니다";
				url = "/member/memberDelete";
			}

		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("adminPage")
	public String adminPage() {
//		   List<Member> list = memberdao.selectAll();
//			m.addAttribute("list", list);
//			

		// 100개 order by 최근 num desc
		int limit = 10; // 한 page당 게시물 갯수

		session.setAttribute("pageNum", "1"); // boardid 수정시에 pageNum을 1로 하여야 함

		// pageNum이 파라미터로 넘어 왔을때만 session에 저장한다.
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		int pageInt = Integer.parseInt(pageNum); // 현재 page

		int boardCount = memberdao.memberCount();
		List<Member> list = memberdao.adminMemberList(pageInt, limit);

		int bottomLine = 3; // 하단의 page 표시 수
		/*
		 * pageInt
		 * 
		 * 1 : 1,2,3 2 : 1,2,3 3 : 1,2,3 4 : 4,5,6 ...
		 */
		int startPage = ((pageInt - 1) / bottomLine) * bottomLine + 1;
		int endPage = startPage + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1); // 총 page수

		if (maxPage < endPage){
			endPage = maxPage;
		}
        int boardNum = pageInt; // 숫자정렬

		m.addAttribute("boardCount", boardCount);
		m.addAttribute("list", list);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);
        m.addAttribute("boardNum", boardNum);

		return "/member/adminPage";
	}

	@RequestMapping("adminPageInfo")
	public String adminPageInfo(String member_id) {
		Member mem = memberdao.selectOne(member_id);
		m.addAttribute("member", mem);

		return "/member/adminPageInfo";
	}

	@RequestMapping("adminMemberDelete")
	public String adminMemberDelete(String member_id) {
		Member mem = memberdao.selectOne(member_id);
		m.addAttribute("member", mem);

		return "/member/adminMemberDelete";
	}

	@RequestMapping("adminMemberDeletePro")
	public String adminMemberDeletePro(String member_id, String member_pw) {
		String msg = "회원탈퇴가 실패 했습니다";
		String url = "/member/adminMemberDelete?member_id=" + member_id;
		Member member = memberdao.selectOne(member_id);
		int num = memberdao.deleteMember(member_id);

		if (num > 0) {
			msg = member.getMember_id() + "님이 탈퇴 처리되었습니다";
			url = "/member/adminPage";
		} else {
			msg = "회원탈퇴가 실패 했습니다";
			url = "/member/adminMemberDelete?member_id=" + member_id;
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("adminMemberSearch")
	public String adminMemberSearch() {
		// 100개 order by 최근 num desc
		int limit = 10; // 한 page당 게시물 갯수

		session.setAttribute("pageNum", "1"); // boardid 수정시에 pageNum을 1로 하여야 함

		// boardid 파라미터로 넘어왔을때만 session에 저장한다.
		if (request.getParameter("value") != null) {

			session.setAttribute("value", request.getParameter("value"));
		}

		String value = (String) session.getAttribute("value");

		// pageNum이 파라미터로 넘어 왔을때만 session에 저장한다.
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageInt = Integer.parseInt(pageNum); // 현재 page

		int boardCount = memberdao.boardCountMemberSearch(value);
		List<Member> list = memberdao.boardListMemberSearch(value, pageInt, limit);

		int bottomLine = 3; // 하단의 page 표시 수
		/*
		 * pageInt
		 * 
		 * 1 : 1,2,3 2 : 1,2,3 3 : 1,2,3 4 : 4,5,6 ...
		 */
		int startPage = ((pageInt - 1) / bottomLine) * bottomLine + 1;
		int endPage = startPage + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1); // 총 page수

		if (maxPage < endPage){
			endPage = maxPage;
		}

		m.addAttribute("boardCount", boardCount);
		m.addAttribute("list", list);
		m.addAttribute("value", value);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);

		return "/member/adminMemberSearch";
	}

	// 파일업로드
	@RequestMapping("pictureimgForm")
	public String pictureimgForm() {
		return "/member/pictureimgForm";
	}

	@RequestMapping("picturePro")
	public String picturePro(@RequestParam("picture") MultipartFile multipartFile) {
		String path = request.getServletContext().getRealPath("/") + "view/member/picture/";
		String filename = null;

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();

			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		m.addAttribute("filename", filename);
		
		return "/member/picturePro";
	}

	//id,pw찾기
	   @RequestMapping("memberFind")
	   public String memberFind() {
	      return "/member/memberFind";
	   }

	   @RequestMapping("memberFindId")
	   public String memberFindId() {
	      return "/member/memberFindId";
	   }
	   
	   @RequestMapping("findIdPro")
	   public String findIdPro(String member_name, String member_email1, String member_email2) {
	      String msg = "입력 정보를 확인하세요";
	      String url = "window.history.back()";

	      Member mem = memberdao.findId(member_name, member_email1, member_email2);

	      if (mem != null) {
	            if (member_name.equals(mem.getMember_name()) && member_email1.equals(mem.getMember_email1()) && member_email2.equals(mem.getMember_email2())) {
	               msg = "회원님의 아이디는 " + mem.getMember_id() + " 입니다.";
	               url = "self.close();";
	            } else {
	               msg = "입력 정보를 확인 하세요";
	            }
	      }

	      m.addAttribute("msg", msg);
	      m.addAttribute("url", url);

	      return "/member/findPro";
	   }
	   
	   @RequestMapping("memberFindPw")
	   public String memberFindPw() {
	      return "/member/memberFindPw";
	   }
	   
	   @RequestMapping("findPwPro")
	   public String findPwPro(String member_id, String member_name, String member_email1, String member_email2) {
	      String msg = "입력 정보를 확인하세요";
	      String url = "window.history.back()";

	      Member mem = memberdao.findPw(member_id, member_name, member_email1, member_email2);

	      if (mem != null) {
	         if (member_id.equals(mem.getMember_id()) && member_name.equals(mem.getMember_name()) && member_email1.equals(mem.getMember_email1()) && member_email2.equals(mem.getMember_email2())) {
	            msg = "회원님의 비밀번호는 " + mem.getMember_pw() + " 입니다.";
	            url = "self.close();";
	         } else {
	            msg = "입력 정보를 확인 하세요";
	         }
	      }

	      m.addAttribute("msg", msg);
	      m.addAttribute("url", url);

	      return "/member/findPro";
	   }
	// @RequestMapping("test")
	// public String test() {	
	// 	return "/member/NewFile";
	// }
} // end of controller