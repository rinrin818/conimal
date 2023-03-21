<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
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
		<li><a href="<%=request.getContextPath()%>/member/memberInfo">프로필</a></li>
		<li><a class="myselect" href="<%=request.getContextPath()%>/member/memberPwUpdate">비밀번호 변경</a></li>
		
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
			<p class="mysubject_title_name">비밀번호 변경</p>
		</div>
	
	<form action="<%=request.getContextPath()%>/member/memberPwPro" method="post" onsubmit = "return passChk(this)">
		<p>
			<label>현재 비밀번호</label> 
			<input class="myinput" type="password" 	name="member_pw">
		</p>
		<p>
			<label>변경 비밀번호</label> 
			<input class="myinput" type="password" 	name="chgpass1">
		</p>
		<p>
			<label>변경 비밀번호 재입력</label> 
			<input class="myinput" type="password" 	name="chgpass2">
		</p>
		<p>
			<input class="service-save-btn" style="margin:10px" type="submit" value="비밀번호 변경">
		</p>
	</form>
		
		
		
		
		
		
	</div> <!-- subject 비밀번호변경부분 -->
</div>
	
	
</body>
</html>