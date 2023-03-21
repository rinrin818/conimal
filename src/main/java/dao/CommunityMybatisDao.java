package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ComReply;
import model.Community;

@Repository
public class CommunityMybatisDao {

	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "community.";
	private Map map = new HashMap();

	public int boardCount(String boardid) {
		int boardCount = session.selectOne(ns + "boardCount", boardid);
		return boardCount;
	}

	public List<Community> boardList(String boardid, int pageInt, int limit) {
		map.clear();
		map.put("boardid", boardid);
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt * limit));

		List<Community> list = session.selectList(ns + "boardList", map);

		return list;
	}

	public Community boardOne(int community_idx) {
		Community board = session.selectOne(ns + "boardOne", community_idx);
		return board;
	}

	public int boardUpdate(Community community) {
		int num = session.update(ns + "boardUpdate", community);
		return num;
	}

	public int insertcommunity(Community community) {
		int num = session.insert(ns + "insertcommunity", community);
		return num;
	}

	public int communityDelete(int community_idx) {
		int count = session.update(ns + "communityDelete", community_idx);
		return count;
	}

	public void readCountUp(int community_idx) {
		session.update(ns + "readCountUp", community_idx);
	}

	public int insertReply(int community_idx, String msg, String member_id) {
		map.clear();
		map.put("msg", msg);
		map.put("community_idx", community_idx);
		map.put("member_id", member_id);

		return session.insert(ns + "insertReply", map);

	}

	public List<ComReply> replyAll(int community_idx) {
		return session.selectList(ns + "replyAll", community_idx);
	}

	public int boardCountMember(String member_nickname_fk) {
		int boardCount = session.selectOne(ns + "boardCountMember", member_nickname_fk);
		return boardCount;
	}

	public List<Community> boardListMember(String member_nickname_fk, int pageInt, int limit) {
		map.clear();
		map.put("member_nickname_fk", member_nickname_fk);
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt * limit));

		List<Community> list = session.selectList(ns + "boardListMember", map);
		return list;
	}

	public int boardCountNew() {
		int boardCount = session.selectOne(ns + "boardCountNew");
		return boardCount;
	}

	public List<Community> boardListNew(int pageInt, int limit) {
		map.clear();
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt * limit));

		List<Community> list = session.selectList(ns + "boardListNew", map);

		return list;
	}
	
	public List<ComReply> replyAllMember(String member_id) {
	    return session.selectList(ns + "replyAllMember", member_id);
	}


}
