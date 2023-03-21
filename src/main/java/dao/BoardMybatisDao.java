package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board;
import model.Member;

@Repository
public class BoardMybatisDao {

	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "board.";
	private Map map = new HashMap();
	
//	이예린 =====================================================================================================
	public int insertBoard(Board board) {
		int num = session.insert(ns + "insertBoard", board);
		return num;
	}

	public int boardCount(String boardid) {
		int boardCount = session.selectOne(ns + "boardCount", boardid);
		return boardCount;
	}

	public List<Board> boardList(String boardid, int pageInt, int limit) {
		/*
		 * 1 page : 1~3 2 page : 4~6 3 page : 7~9 ... n page : (page-1)*limit+1 ~
		 * page*limit
		 */
		map.clear();
		map.put("boardid", boardid);
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt * limit));

		List<Board> list = session.selectList(ns + "boardList", map);
		return list;
	}
	
	public void readCountUp(int num) { //조회수증가
		session.update(ns + "readCountUp", num);
		
	}
	

	public Board boardOne(int num) {
		Board board = session.selectOne(ns + "boardOne", num);
		return board;
	}

	public void refstepAdd(int ref, int refstep) {
		map.clear();
		map.put("ref", ref);
		map.put("refstep", refstep);

		session.update(ns + "refstepAdd", map);
	}

	public int insertReply(Board board) {
		int num = session.insert(ns + "insertReply", board);
		return num;
	}

	public int boardDelete(int num) {

		int count = session.insert(ns + "boardDelete", num);
		return count;
	}

	public int boardUpdate(Board board) {
		int num = session.update(ns + "boardUpdate", board);
		
		return num;
	}
	
//	박성주 =====================================================================================================

	public int boardCountMember(String name) {

		int boardCount = session.selectOne(ns + "boardCountMember", name);
		return boardCount;
	}

	public List<Board> boardListMember(String name, int pageInt, int limit) {
		map.clear();
		map.put("name", name);
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt * limit));

		List<Board> list = session.selectList(ns + "boardListMember", map);
		return list;
	}


	

}