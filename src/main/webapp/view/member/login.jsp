<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function win_memberFind() {
		var op = "Width=500, height=150, left=50, top=150";
		open("${ pageContext.request.contextPath }/member/memberFind","",op);
	}
</script>
</head>
<body>

	<section
		style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<div id="login_form"
			style="border: solid 1px #ffe4c4e6; width: 30vw; height: 60vh; padding-bottom: 50px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
			<h1>로그인</h1>
			<form id="loginform" action="${pageContext.request.contextPath}/member/loginPro" method="post">
				<table>
					<tr>
						<td>
							<div class="formBox">
								<img src="${ pageContext.request.contextPath }/resources/img/user1.png" alt=""> <input type="text"
									style="background-color:#00000000;" placeholder="아이디" name="member_id">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="formBox">
								<img src="${ pageContext.request.contextPath }/resources/img//padlock.png" alt=""> <input
									style="background-color:#00000000;" type="password" placeholder="비밀번호" name="member_pw">
							</div>
						</td>
					</tr>
				</table>

			</form>
			<button class="btn1 warning1" form="loginform" type="submit">로그인</button>
			<div style="margin: 20px 0; font-size: 0.9vw;">
				<a href="javascript:win_memberFind()">아이디/비밀번호 찾기</a> |<a href="${ pageContext.request.contextPath }/member/join">회원가입</a>
			</div>
			<img src="${ pageContext.request.contextPath }/resources/img/dog_event.png"
				alt="200 * 400 size image" style="width: 21vw; height: 7vh;">
		</div>
	</section>

	<footer style="height: 8vh;"> </footer>
</body>
</html>