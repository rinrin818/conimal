package model;

import java.util.Date;

public class ComReply {
	int community_idx;
	int repleidk;
	String msg;
	String member_id;
    Date regdate;
    
	public int getCommunity_idx() {
		return community_idx;
	}
	public void setCommunity_idx(int community_idx) {
		this.community_idx = community_idx;
	}
	public int getRepleidk() {
		return repleidk;
	}
	public void setRepleidk(int repleidk) {
		this.repleidk = repleidk;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ComReply [community_idx=" + community_idx + ", repleidk=" + repleidk + ", msg=" + msg + ", member_id="
				+ member_id + ", regdate=" + regdate + "]";
	}
	
	

}
