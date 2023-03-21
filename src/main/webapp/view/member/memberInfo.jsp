<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath}/resources/css/mycss.css?"  type="text/css" rel="stylesheet"/>
		<title>프로필</title>
	</head>
	<body>
		<div class="mytop">
			<a href="<%=request.getContextPath()%>/member/memberInfo"><img class="my-logoImg" src="${ pageContext.request.contextPath}/resources/img/paw-black-shape.png">마이페이지</a>
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
				<p class="mysubject_title_name">나의 프로필</p>
			</div>
		
			<div class="myprofile">
	
					<%-- <img src="${pageContext.request.contextPath}/view/member/picture/${member.picture}" width="100" height="120" id="pic"> --%>
	
				<table>
					<tr>
						<td rowspan="4" valign="top" width="120px" style="text-align:center">
						<img class="mypicture" src="<%=request.getContextPath()%>/view/member/picture/${member.member_picture}" style="margin-top:20px; text-align:center" width="100" id="pic"></td>
					</tr>
					<tr>
						<td class="mytable_list">NAME</td>
						<td>: ${member.member_name}</td>
					</tr>
					<tr>
						<td class="mytable_list">ID</td>
						<td>: ${member.member_id}</td>
					</tr>
					<tr>
						<td class="mytable_list">NICKNAME</td>
						<td>: ${member.member_nickname}</td>
					</tr>
					<tr>
						<td rowspan="2">&nbsp;</td>
						<td class="mytable_list">E-mail</td>
						<td>: ${member.member_email1} @ ${member.member_email2}</td>
					</tr>
					<tr>
						<td class="mytable_list">PHONE</td>
						<td>: ${member.member_phone}</td>
					</tr>
					<tr>
						<td rowspan="2" width="12px">&nbsp;</td>
						<td class="mytable_list">GENDER</td>
						<td>: ${member.member_gender == 1 ? "여" : "남"}</td>
					</tr>
					<tr>
						<td class="mytable_list">BIRTHDAY</td>
						<td>: ${member.member_birthdate}</td>
					</tr>
					<tr align="right">
						<td colspan="2">
						<button class="service-save-btn" style="margin:10px" type="button" onclick="location.href='<%=request.getContextPath()%>/member/memberUpdate' "> 프로필수정 </button>
						</td>
					</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>