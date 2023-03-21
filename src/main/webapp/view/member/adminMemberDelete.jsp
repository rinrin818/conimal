<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>s
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet"/>
<title>프로필</title>
</head>
<body>

    <div style="display: flex; align-items: center; justify-content: center;">
		<h2 style="font-size: 1.8vw; margin-right: 1vw;">관리자</h2>
		
	</div>
<div class="mymain">
	<ul>
        <li><div class="mylist_title"> 관리자페이지</div></li>
        <li style="margin: 20px 0;"><a class="myselect"  href="adminPage.html">회원관리</a>
        </li>
        
        
        
    </ul>
		
		
		<!-- ======================프로필======================== -->
	<div class="mysubject">
		<div class="mysubject_title">
			<img src="${pageContext.request.contextPath}/resources/img/arrow2.png" height="10px"> 
			<p class="mysubject_title_name">회원강제탈퇴</p>
		</div>
	
	<form action="${pageContext.request.contextPath}/member/adminMemberDeletePro?member_id=${member.member_id }" method="post">
		<p>
			<input type="hidden" value="${member.member_id }">
			<p>강제 탈퇴 시키겠습니까?</p> 
			<input class="myinput" type="hidden" 	name="member_pw" value="${member.member_pw }">
		</p>
		<p>
			<input class="myin_btn" type="submit" value="확인">
		</p>
	</form>
		
		
		
		
		
		
	</div> <!-- subject 비밀번호변경부분 -->
</div>
	
</body>
</html>