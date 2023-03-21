package model;

import java.util.Date;

public class Member {
	private String member_idx;
	private String member_id;
	private String member_pw;
	private String member_picture;
	private String member_name;
	private String member_nickname;
	private String member_email1;
	private String member_email2;
	private String member_phone;
	private int member_gender;
	private String member_birthdate;
	private Date member_joindate;


	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_picture() {
		return member_picture;
	}
	public void setMember_picture(String member_picture) {
		this.member_picture = member_picture;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_email1() {
		return member_email1;
	}
	public void setMember_email1(String member_email1) {
		this.member_email1 = member_email1;
	}
	public String getMember_email2() {
		return member_email2;
	}
	public void setMember_email2(String member_email2) {
		this.member_email2 = member_email2;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public int getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(int member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_birthdate() {
		return member_birthdate;
	}
	public void setMember_birthdate(String member_birthdate) {
		this.member_birthdate = member_birthdate;
	}
	public Date getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}
	@Override
	public String toString() {
		return "Member [member_idx=" + member_idx + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_picture=" + member_picture + ", member_name=" + member_name + ", member_nickname="
				+ member_nickname + ", member_email1=" + member_email1 + ", member_email2=" + member_email2
				+ ", member_phone=" + member_phone + ", member_gender=" + member_gender + ", member_birthdate="
				+ member_birthdate + ", member_joindate=" + member_joindate + "]";
	}
}
