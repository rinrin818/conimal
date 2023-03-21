<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 아이디/비밀번호 찾기</title>
<script>
	function win_idFind() {
		var op = "Width=500, height=150, left=50, top=150";
		open("${pageContext.request.contextPath}/member/memberFindId","",op);
		self.close();
	}
	
	function win_pwFind() {
		var op = "Width=500, height=150, left=50, top=150";
		open("${pageContext.request.contextPath}/member/memberFindPw","",op);
		self.close();
	}
</script>
<link href="${ pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/>
</head>
<body>
	<h3>아이디 / 비밀번호 찾기</h3>
	<a href="javascript:win_idFind()">
		<button>아이디 찾기</button>
	</a>
	<a href="javascript:win_pwFind()">
		<button>비밀번호 찾기</button>
	</a>
</body>
</html>