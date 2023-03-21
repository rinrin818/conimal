<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${ pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/>
</head>
<body>
	<form action="${pageContext.request.contextPath}/member/findPwPro">
		아이디 <input type="text" name="member_id"> <br>
		이름 <input type="text" name="member_name"> <br>
		이메일 <input type="text" name="member_email1">@<input type="text" name="member_email2"> <br>
		<button type="submit">확인</button>
	</form>
</body>
</html>