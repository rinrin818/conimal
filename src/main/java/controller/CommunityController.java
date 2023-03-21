package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.CommunityMybatisDao;
import dao.MemberMybatisDao;
import model.Community;
import model.Member;
import model.ComReply;

@Controller
@RequestMapping("/community/")
public class CommunityController {

	@Autowired
	CommunityMybatisDao communitydao;

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

	@RequestMapping("communityAllNew")
	public String communityAllNew() {

		// 100개 order by 최근 num desc
		int limit = 10; // 한 page당 게시물 갯수

		session.setAttribute("pageNum", "1"); // boardid 수정시에 pageNum을 1로 하여야 함

		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";

		// pageNum이 파라미터로 넘어 왔을때만 session에 저장한다.
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageInt = Integer.parseInt(pageNum); // 현재 page

		String boardName = "최신글";
		String boardContent = "새 글을 모아서 보여드립니다.";
		
		
		int boardCount = communitydao.boardCountNew();
		List<Community> list = communitydao.boardListNew(pageInt, limit);
	
		int bottomLine = 3; // 하단의 page 표시 수
		/*
		 * pageInt
		 * 
		 * 1 : 1,2,3 2 : 1,2,3 3 : 1,2,3 4 : 4,5,6 ...
		 */
		int startPage = ((pageInt - 1) / bottomLine) * bottomLine + 1;
		int endPage = startPage + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1); // 총 page수
		int boardNum = boardCount - (pageInt - 1) * limit;

		if (maxPage < endPage)
			endPage = maxPage;
		m.addAttribute("boardCount", boardCount);
		m.addAttribute("boardName", boardName);
		m.addAttribute("boardContent", boardContent);
		m.addAttribute("list", list);
		System.out.println(list);
		m.addAttribute("boardid", boardid);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("boardNum", boardNum);
		return "/community/communityAll";
	}
	
	@RequestMapping("communityAll")
	public String communityAll() {

		// 100개 order by 최근 num desc
		int limit = 10; // 한 page당 게시물 갯수

		// boardid 파라미터로 넘어왔을때만 session에 저장한다.
		if (request.getParameter("boardid") != null) {
			session.setAttribute("pageNum", "1"); // boardid 수정시에 pageNum을 1로 하여야 함
			session.setAttribute("boardid", request.getParameter("boardid"));
		}

		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";

		// pageNum이 파라미터로 넘어 왔을때만 session에 저장한다.
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageInt = Integer.parseInt(pageNum); // 현재 page

		String boardName = "";
		String boardContent = "";
		switch (boardid) {
		case "1":
			boardName = "최신글";
			boardContent = "새 글을 모아서 보여드립니다.";
			break;
		case "2":
			boardName = "자유게시판";
			boardContent = "자유롭게 얘기할 수 있는 공간입니다.";
			break;
		case "3":
			boardName = "강아지";
			boardContent = "강아지 모아서 보여드립니다.";
			break;
		case "4":
			boardName = "고양이";
			boardContent = "고양이 모아서 보여드립니다.";
			break;
		case "5":
			boardName = "특수동물";
			boardContent = "특수동물 모아서 보여드립니다.";
			break;
		case "6":
			boardName = "정보공유";
			boardContent = "정보공유를 얘기할 수 있는 공간입니다.";
			break;
		case "7":
			boardName = "질문해요";
			boardContent = "궁금한 점을 물어보세요.";
			break;
		}
		
		int boardCount = communitydao.boardCount(boardid);
		List<Community> list = communitydao.boardList(boardid, pageInt, limit);
	
		int bottomLine = 3; // 하단의 page 표시 수
		/*
		 * pageInt
		 * 
		 * 1 : 1,2,3 2 : 1,2,3 3 : 1,2,3 4 : 4,5,6 ...
		 */
		int startPage = ((pageInt - 1) / bottomLine) * bottomLine + 1;
		int endPage = startPage + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1); // 총 page수
		int boardNum = boardCount - (pageInt - 1) * limit;

		if (maxPage < endPage)
			endPage = maxPage;
		m.addAttribute("boardCount", boardCount);
		m.addAttribute("boardName", boardName);
		m.addAttribute("boardContent", boardContent);
		m.addAttribute("list", list);
		System.out.println(list);
		m.addAttribute("boardid", boardid);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("boardNum", boardNum);
		return "/community/communityAll";
	}
	
	
	@RequestMapping("communityInfo")
	public String communityInfo(int community_idx) {
		Community board = communitydao.boardOne(community_idx);
		List<ComReply> repList = communitydao.replyAll(community_idx);
		communitydao.readCountUp(community_idx);
		m.addAttribute("board", board);
		m.addAttribute("repList", repList);
		System.out.println(board + "===============");

		return "/community/communityInfo";
	}


	@RequestMapping("community_Form")
	public String community_Form() {

		return "/community/communityForm";
	}

	@PostMapping("communityPro")
	public String communityPro(@RequestParam("file1") MultipartFile multipartFile, Community community) {
		// 저장 path확인
		String path = request.getServletContext().getRealPath("/") + "view/community/img/";
		String filename = "";

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();

			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		community.setCommunity_file(filename);
		System.out.println(filename);

		String msg = "게시물 등록 실패";
		String url = "/community/communityForm";

		String boardid = (String) session.getAttribute("boardid"); // 1.최신글 2:인기글 3:자유게시판
		if (boardid == null) {
			boardid = "1";
		}

		System.out.println(community);

		int num = communitydao.insertcommunity(community);
		if (num > 0) {
			msg = "게시물 등록 성공";
			url = "/community/communityAll?boardid=" + boardid;
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("replyPro")
	public String replyPro(String msg, int community_idx) {
		String member_id = (String) session.getAttribute("member_id");
		System.out.println(msg + ":" + community_idx);
		communitydao.insertReply(community_idx, msg, member_id);

		return "redirect:/community/communityInfo?community_idx=" + community_idx;
	}

	@RequestMapping("community_UpdateForm")
	public String community_form(int community_idx) {
		Community board = communitydao.boardOne(community_idx);
		m.addAttribute("board", board);

		return "/community/communityUpdateForm";
	}

	@RequestMapping("community_UpdatePro")
	public String community_UpdatePro(Community community) {
		System.out.println(community);
		String msg = "수정 하였습니다 ";
		String url = "/community/communityInfo?community_idx=" + community.getCommunity_idx();

		if (communitydao.boardUpdate(community) == 0) {
			msg = "수정 x ";
			url = "/community/community_UpdateForm?community_idx=" + community.getCommunity_idx();
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";

	}

	@RequestMapping("community_del")
	public String communityDeletePro(int community_idx) {
		String msg = "삭제 불가 입니다 ";
		String url = "/community/communityAll";
		Community board = communitydao.boardOne(community_idx);
		String name = (String) session.getAttribute("member_id");

		if (board.getMember_nickname_fk().equals(name)) {
			if (communitydao.communityDelete(community_idx) > 0) {
				msg = "삭제 되었습니다 ";
			}
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/alert";
	}

	// 박성주
	// ===============================================================================================
	@RequestMapping("communityAllMember")
	public String communityAllMember() {
		// 100개 order by 최근 num desc
		int limit = 10; // 한 page당 게시물 갯수

		// boardid 파라미터로 넘어왔을때만 session에 저장한다.
		if (request.getParameter("member_nickname_fk") != null) {
			session.setAttribute("pageNum", "1"); // boardid 수정시에 pageNum을 1로 하여야 함

			session.setAttribute("member_nickname_fk", request.getParameter("member_nickname_fk"));
		}

		String member_nickname_fk = (String) session.getAttribute("member_nickname_fk");

		// pageNum이 파라미터로 넘어 왔을때만 session에 저장한다.
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("member_nickname_fk"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageInt = Integer.parseInt(pageNum); // 현재 page

		int boardCount = communitydao.boardCountMember(member_nickname_fk);
		List<Community> list = communitydao.boardListMember(member_nickname_fk, pageInt, limit);

		int bottomLine = 3; // 하단의 page 표시 수
		/*
		 * pageInt
		 * 
		 * 1 : 1,2,3 2 : 1,2,3 3 : 1,2,3 4 : 4,5,6 ...
		 */
		int startPage = ((pageInt - 1) / bottomLine) * bottomLine + 1;
		int endPage = startPage + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1); // 총 page수

		if (maxPage < endPage)
			endPage = maxPage;

		m.addAttribute("boardCount", boardCount);
		m.addAttribute("list", list);
		m.addAttribute("member_nickname_fk", member_nickname_fk);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);

		return "/community/communityAllMember";
	}
	
	@RequestMapping("communityAllMemberReply")
    public String communityAllMemberReply(String member_id) {
       List<ComReply> repList = communitydao.replyAllMember(member_id);
       m.addAttribute("repList", repList);

       return "/community/communityAllMemberReply";
    }

}
