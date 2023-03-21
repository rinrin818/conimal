package model;

import java.util.Date;

public class Community {
	private int community_idx;
	private int member_idx_fk;
	private String member_nickname_fk;
	private String community_title;
	private String community_content;
	private String community_file;
	private Date community_regdate;
	private int community_hit;
	private String reply_idx;
	private int reply_level;
	private int reply_step;
	private String boardid;

    
	public int getCommunity_idx() {
		return community_idx;
	}
	public void setCommunity_idx(int community_idx) {
		this.community_idx = community_idx;
	}
	public int getMember_idx_fk() {
		return member_idx_fk;
	}
	public void setMember_idx_fk(int member_idx_fk) {
		this.member_idx_fk = member_idx_fk;
	}
	public String getMember_nickname_fk() {
		return member_nickname_fk;
	}
	public void setMember_nickname_fk(String member_nickname_fk) {
		this.member_nickname_fk = member_nickname_fk;
	}
	public String getCommunity_title() {
		return community_title;
	}
	public void setCommunity_title(String community_title) {
		this.community_title = community_title;
	}
	public String getCommunity_content() {
		return community_content;
	}
	public void setCommunity_content(String community_content) {
		this.community_content = community_content;
	}
	public String getCommunity_file() {
		return community_file;
	}
	public void setCommunity_file(String community_file) {
		this.community_file = community_file;
	}
	public Date getCommunity_regdate() {
		return community_regdate;
	}
	public void setCommunity_regdate(Date community_regdate) {
		this.community_regdate = community_regdate;
	}
	public int getCommunity_hit() {
		return community_hit;
	}
	public void setCommunity_hit(int community_hit) {
		this.community_hit = community_hit;
	}
	public String getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(String reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getReply_level() {
		return reply_level;
	}
	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}
	public int getReply_step() {
		return reply_step;
	}
	public void setReply_step(int reply_step) {
		this.reply_step = reply_step;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	@Override
	public String toString() {
		return "Community [community_idx=" + community_idx + ", member_idx_fk=" + member_idx_fk
				+ ", member_nickname_fk=" + member_nickname_fk + ", community_title=" + community_title
				+ ", community_content=" + community_content + ", community_file=" + community_file
				+ ", community_regdate=" + community_regdate + ", community_hit=" + community_hit + ", reply_idx="
				+ reply_idx + ", reply_level=" + reply_level + ", reply_step=" + reply_step + ", boardid=" + boardid
				+ "]";
	}


}
