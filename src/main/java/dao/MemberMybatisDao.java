package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Member;

@Repository
public class MemberMybatisDao {
	@Autowired
	SqlSessionTemplate session;

	private static final String ns = "member.";
	private Map map = new HashMap();

//	박성주 =====================================================================================================
	public int insertMember(Member mem) {
		int num = session.insert(ns + "insertMember", mem);

		return num;
	}

	public Member selectOne(String member_id) {

		Member member = session.selectOne(ns + "selectOne", member_id);

		return member;
	}
	
	public int deleteMember(String member_id) {

		int num = session.update(ns + "deleteMember", member_id);

		return num;
	}

	public List<Member> selectAll() {
		List<Member> list = session.selectList(ns + "memberList");
		return list;
	}

	public int memberCount() {

		int boardCount = session.selectOne(ns + "memberCount");
		return boardCount;
	}

	public List<Member> adminMemberList(int pageInt, int limit) {
		map.clear();
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt * limit));

		List<Member> list = session.selectList(ns + "adminMemberList", map);
		return list;
	}

	public int boardCountMemberSearch(String value) {
		int boardCount = session.selectOne(ns + "boardCountMemberSearch", value);
		return boardCount;
	}

	public List<Member> boardListMemberSearch(String value, int pageInt, int limit) {
		map.clear();
		map.put("value", value);
		map.put("start", ((pageInt - 1) * limit) + 1);
		map.put("end", (pageInt * limit));

		List<Member> list = session.selectList(ns + "boardListMemberSearch", map);
		return list;
	}
	
	//id,pw찾기
   public Member findId(String member_name, String member_email1, String member_email2) {
	      Map map = new HashMap();
	      map.put("member_name", member_name);
	      map.put("member_email1", member_email1);
	      map.put("member_email2", member_email2);

	      Member mem = session.selectOne(ns + "findId", map);

	      return mem;
	   }

   public Member findPw(String member_id, String member_name, String member_email1, String member_email2) {
      Map map = new HashMap();
      map.put("member_id", member_id);
      map.put("member_name", member_name);
      map.put("member_email1", member_email1);
      map.put("member_email2", member_email2);

      Member mem = session.selectOne(ns + "findPw", map);

      return mem;
   }


//	박서현 =====================================================================================================
	
	public int updateMember(Member mem) {

		int num = session.update(ns + "updateMember", mem);

		return num;
	}

	public int changePass(String member_id, String member_pw) {

		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);

		int num = session.update(ns + "changePass", map);

		return num;
	}
	



}
