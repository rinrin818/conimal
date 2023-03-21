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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardMybatisDao;

import model.Board;

@Controller
@RequestMapping("/board/")
public class CsController {
	@Autowired
	BoardMybatisDao bd;
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

	// 이예린
	// ================================================================================================
	@RequestMapping("serviceOne")
	public String serviceOne() {
		// 100개 order by 최근 num desc
		int limit = 10; // 한 page당 게시물 갯수

		// boardid 파라미터로 넘어왔을때만 session에 저장한다.
		if (request.getParameter("boardid") != null) {
			session.setAttribute("pageNum", "1"); // boardid 수정시에 pageNum을 1로 하여야 함
			session.setAttribute("boardid", request.getParameter("boardid"));
		}

		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null) {
			boardid = "1";
		}

		// pageNum이 파라미터로 넘어 왔을때만 session에 저장한다.
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null){
			pageNum = "1";
		}
		int pageInt = Integer.parseInt(pageNum); // 현재 page

		String boardName = "";
		switch (boardid) {
			case "1":
				boardName = "QnA";
				break;
			case "2":
				boardName = "이벤트";
				break;
			case "3":
				boardName = "공지사항";
				break;
		}

		int boardCount = bd.boardCount(boardid);
		List<Board> list = bd.boardList(boardid, pageInt, limit);

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
		int boardNum = boardCount - (pageInt - 1) * limit; // 숫자정렬

		m.addAttribute("boardCount", boardCount);
		m.addAttribute("boardName", boardName);
		m.addAttribute("list", list);
		m.addAttribute("boardid", boardid);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("boardNum", boardNum); // 숫자정렬

		return "/cs/serviceOne";
	}

	@RequestMapping("serviceOneInfo")
	public String serviceOneInfo(int num) {
		Board board = bd.boardOne(num);
		bd.readCountUp(num); // 조회수 증가
		m.addAttribute("board", board);
		return "/cs/serviceOneInfo";
	}

	@RequestMapping("serviceOnePro") // 문의하기 정보 꾸러미
	public String serviceOnePro(@RequestParam("file2") MultipartFile multipartFile, Board board) {
		// 저장 path확인
		String path = request.getServletContext().getRealPath("/") + "view/cs/img/";
		String filename = "";

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

		board.setFile1(filename);

		String msg = "등록 실패";
		String url = "/board/serviceOneForm";

		String boardid = (String) session.getAttribute("boardid"); // 1.공지사항 2:자유게시팜 3:QnA
		if (boardid == null) {
			boardid = "1";
		}
		board.setBoardid(boardid);

		int num = bd.insertBoard(board);
		if (num > 0) {
			msg = "등록 성공";
			url = "/board/serviceOne";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("serviceOneForm") // 문의하기 작성
	public String serviceOneForm() {
		return "/cs/serviceOneForm";
	}

	@RequestMapping("serviceUpdatePro") // 글수정 정보 꾸러미
	public String serviceUpdatePro(@RequestParam("f") MultipartFile multipartFile, Board board) {
		Board dbboard = bd.boardOne(board.getNum());
		m.addAttribute("board", board);

		String path = request.getServletContext().getRealPath("/") + "view/cs/img/";

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			String filename = multipartFile.getOriginalFilename();
			board.setFile1(filename);

			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			board.setFile1(dbboard.getFile1());
		}

		String msg = "아이디를 확인해주세요.";
		String url = "/board/serviceOne?num=" + board.getNum();
		System.out.println(board.getName() + ":" + session.getAttribute("member_id"));
		if (dbboard.getName().equals(session.getAttribute("member_id"))
				|| "admin".equals(session.getAttribute("member_id")))
			if (bd.boardUpdate(board) > 0) {
				msg = "수정 완료.";
				url = "/board/serviceOneInfo?num=" + board.getNum();
			} else {
				msg = "수정 실패.";
			}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/alert";
	}

	// 글수정 작성
	@RequestMapping("serviceUpdateForm")
	public String serviceUpdateForm(int num) {
		Board board = bd.boardOne(num);
		m.addAttribute("board", board);
		
		return "/cs/serviceUpdateForm";
	}

	// 글삭제 알림
	@RequestMapping("serviceDeletePro") // 글삭제 정보 꾸러미
	public String serviceDeletePro(int num) {
		Board board = bd.boardOne(num);
		String msg = "삭제 되었습니다";
		String url = "/board/serviceOne";
		if (board.getName().equals(session.getAttribute("member_id")) || "admin".equals(session.getAttribute("member_id"))) {
			bd.boardDelete(num);
		} else {
			msg = "아이디를 확인해주세요.";
			url = "/board/serviceOne?num=" + num;
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	@RequestMapping("serviceDeleteForm") // 글삭제
	public String serviceDeleteForm(int num) {
		m.addAttribute("num", num);
		
		return "/cs/serviceDeleteForm";
	}

	@RequestMapping("serviceReplyForm") // 관리자 답글쓰기
	public String serviceReplyForm(int num) {
		Board board = bd.boardOne(num);
		m.addAttribute("board", board);
		
		return "/cs/serviceReplyForm";
	}

	@RequestMapping("serviceReplyPro")
	public String replyPro(@RequestParam("f") MultipartFile multipartFile, Board board) {
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null) {
			boardid = "1";
		}

		String path = request.getServletContext().getRealPath("/") + "view/cs/img/";

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			String filename = multipartFile.getOriginalFilename();

			try {
				multipartFile.transferTo(file);
				board.setFile1(filename);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			board.setFile1("");
		}
		board.setBoardid(boardid);

		String msg = "답변 등록시 오류 발생";
		String url = "/board/serviceReplyForm?num=" + board.getNum();

		bd.refstepAdd(board.getRef(), board.getRefstep());

		board.setRef(board.getRef()); // 원조 새글 ref
		board.setReflevel(board.getReflevel() + 1); // 기준글 reflevel+1
		board.setRefstep(board.getRefstep() + 1); // print순서

		if (bd.insertReply(board) > 0) {
			msg = "답변 등록 완료";
			url = "/board/serviceOne";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/alert";
	}

	// 박성주
	// ================================================================================================
	@RequestMapping("serviceOneMember")
	public String serviceOneMember() {
		// 100개 order by 최근 num desc
		int limit = 10; // 한 page당 게시물 갯수

		// boardid 파라미터로 넘어왔을때만 session에 저장한다.
		if (request.getParameter("name") != null) {
			session.setAttribute("pageNum", "1"); // boardid 수정시에 pageNum을 1로 하여야 함

			session.setAttribute("name", request.getParameter("name"));
		}

		String name = (String) session.getAttribute("name");

		// pageNum이 파라미터로 넘어 왔을때만 session에 저장한다.
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		int pageInt = Integer.parseInt(pageNum); // 현재 page

		int boardCount = bd.boardCountMember(name);
		List<Board> list = bd.boardListMember(name, pageInt, limit);

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
		m.addAttribute("name", name);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("maxPage", maxPage);

		return "/cs/serviceOneMember";
	}
}
