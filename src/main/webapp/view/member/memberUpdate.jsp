<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<script>
function win_upload() {
	var op = "Width=500, height=150, left=50, top=150";
	open("${pageContext.request.contextPath}/member/pictureimgForm","",op);
}
</script>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/mycss.css" rel="stylesheet"/>
<title>프로필</title>
</head>
<body>
	<div class="mytop">
	<a href="<%=request.getContextPath()%>/member/memberInfo"><img style="height: 50px; padding-right:20px;" src="${ pageContext.request.contextPath}/resources/img/paw-black-shape.png">마이페이지</a>
</div>
	<div class="mymain">
	<ul>
		<li><div class="mylist_title"> 마이페이지</div></li>
		<li><a class="myselect" href="<%=request.getContextPath()%>/member/memberInfo">프로필</a></li>
		<li><a href="<%=request.getContextPath()%>/member/memberPwUpdate">비밀번호 변경</a></li>
		
		<li><div class="mylist_title">나의 활동</div></li>
		<li><a href="${pageContext.request.contextPath}/community/communityAllMember?member_nickname_fk=${member.member_id}"><img class="mylist_icon" src="${pageContext.request.contextPath}/resources/img/content3.png">내가 쓴 글</a></li>
		<li><a href="${pageContext.request.contextPath}/community/communityAllMemberReply?member_id=${member.member_id}"><img class="mylist_icon" src="${pageContext.request.contextPath}/resources/img/comment3.png">내가 쓴 댓글</a></li>
		
		<li><div class="mylist_title"><a href="${pageContext.request.contextPath}/board/serviceOneMember?name=${member.member_id}"><img class="mylist_icon" src="${pageContext.request.contextPath}/resources/img/question2.png">나의 문의</a></div></li>
		
		<li><div class="mylist_title"><a href="${ pageContext.request.contextPath }/board/serviceOne?boardid=3">고객센터</a></div></li>
		<li><a href="<%=request.getContextPath()%>/member/memberDelete"><div class="mylist_title"><img class="mylist_icon" src="${pageContext.request.contextPath}/resources/img/settings.png">회원탈퇴</div></a></li>
	</ul>
		
		
		<!-- ======================프로필======================== -->
		<div class="mysubject">
			<div class="mysubject_title">
				<img src="${pageContext.request.contextPath}/resources/img/arrow2.png" height="10px"> 
				<p class="mysubject_title_name">나의 프로필 수정</p>
			</div>
		
		<form action="<%=request.getContextPath()%>/member/memberUpdatePro" method="post" name="f">
			<input type="hidden" name="member_picture" value="${member.member_picture}">
			<div class="myprofile">
			<table>
				<tr>
					<td rowspan="4" valign="top" width="120px" style="text-align:center">
					<img class="mypicture" src="<%=request.getContextPath()%>/view/member/picture/${member.member_picture}" style="margin-top:20px; text-align:center" width="100" id="pic"></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td> ${member.member_name}</td>
				</tr>
				<tr>
					<td>ID</td>
					<td> ${member.member_id}</td>
				</tr>
				<tr>
					<td>NICKNAME</td>
					<td><input class="myinput" type="text" name="member_nickname" value="${member.member_nickname}"></td>
				</tr>
				<tr>
					<td rowspan="2" valign="middle" width="120px" style="text-align:center"><a class="btn warning" style="padding:5px;" href="javascript:win_upload()">사진등록</a></td>
					<td>E-mail</td>
					<td><input class="myinput" type="text" name="member_email1" value="${member.member_email1}">@
						<input class="myinput" type="text" name="member_email2" value="${member.member_email2}"></td>
				</tr>
				<tr>
					<td>PHONE</td>
					<td><input class="myinput" type="text" name="member_phone" value="${member.member_phone}"></td>
				</tr>
				<tr>
					<td rowspan="3">&nbsp;</td>
					<td>GENDER</td>
					<td> ${member.member_gender == 1 ? "여" : "남"}</td>
				</tr>
				
				<tr>
					<td>BIRTHDAY</td>
					<td><input class="myinput" type="text" name="member_birthdate" value="${member.member_birthdate}"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td class="mytext"><input class="myinput" style="margin-right:10px" type="password" name="member_pw">*회원정보 수정 시 필수 입력</td>
				</tr>
				<tr align="right">
					<td colspan="2">
					<input class="service-save-btn" style="margin-top:10px; margin-left:30px;" type="submit" value="저장">
					</td>
				</tr>
				

			</table>
			</div>
		</form>
		</div>
	</div>
	
	
</body>
</html>