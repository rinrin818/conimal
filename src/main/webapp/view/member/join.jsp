<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function win_upload() {
	var op = "Width=500, height=150, left=50, top=150";
	open("${pageContext.request.contextPath}/member/pictureimgForm","",op);
}
</script>
</head>
<body>
	<section
		style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<div id="login_form"
			style="height: 170vh; padding-bottom: 50px; display: flex; flex-direction: column; justify-content: center; align-items: center;">
			<h1 style="font-size: 2vw;">회원가입</h1>
			<form action="${pageContext.request.contextPath}/member/joinPro" method="post" id="joinform" name="f">
				<input type="hidden" name="member_picture">
				<table>
					<tr>
						<td style="display: flex; flex-direction: column;">

							<div class="formBox1">
								<label style="margin-bottom: 2px;">프로필 사진</label> 
								<img src="" alt="" style="margin-bottom: 10px; height:80px; border: solid 1px black;" id="pic"> 
									   <label for="file">
									<a class="btn-upload" href="javascript:win_upload()">사진선택</a>
								</label> 
							</div>
						</td>
					</tr>
					<tr>
						<td style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>아이디</label>
							<div class="formBox2">
								<input style="background-color:#00000000;" type="text" name="member_id">
							</div>
						</td>
					</tr>
					<tr>
						<td
							style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>비밀번호</label>
							<div class="formBox2">
								<input style="background-color:#00000000;" type="password"  name="member_pw">
							</div>
						</td>
					</tr>
					<tr>
						<td
							style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>닉네임</label>
							<div class="formBox2">
								<input style="background-color:#00000000;" type="text"  name="member_nickname">
							</div>
						</td>
					</tr>
					<tr>
						<td
							style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>이름</label>
							<div class="formBox2">
								<input style="background-color:#00000000;" type="text"  name="member_name">
							</div>
						</td>
					</tr>
					<tr>
						<td
							style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>생년월일</label>
							<div class="formBox2">
								<!-- <input type="text" placeholder="년 (4자)"
									style="width: 8vw; margin-right: 1vw;"> <select
									style="width: 8vw; border: none;">
									<option value="">월</option>
									<option value="">01</option>
									<option value="">02</option>
									<option value="">03</option>
									<option value="">04</option>
									<option value="">05</option>
									<option value="">06</option>
									<option value="">07</option>
									<option value="">08</option>
									<option value="">09</option>
									<option value="">10</option>
									<option value="">11</option>
									<option value="">12</option>
								</select> <input type="text" placeholder="일"
									style="width: 10vw; margin-left: 1vw;"> -->
									
									<input style="background-color:#00000000;" type="text" name="member_birthdate">
							</div>
						</td>
					</tr>
					<tr>
						<td
							style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>성별</label>
							<div class="formBox2">
								<select style="background-color:#00000000; width: 28vw; border: none;"  name="member_gender">
									<option value="0">--</option>
									<option value="1">여자</option>
									<option value="2">남자</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td
							style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>이메일</label>
							<div class="formBox2">
								<input style="background-color:#00000000;" type="text" style="width: 13vw; margin-right: 5px;"  name="member_email1">
								@ <input style="background-color:#00000000;" type="text" style="width: 13vw; margin-left: 5px;" name="member_email2">
							</div>
						</td>
					</tr>
					<tr>
						<td
							style="display: flex; flex-direction: column; align-items: flex-start;">
							<label>휴대전화</label>
							<div class="formBox2">
								<input style="background-color:#00000000;" type="text" placeholder="-없이 입력해주세요."  name="member_phone">
							</div>
						</td>
					</tr>

				</table>
			</form>
			<button class="btn2 warning2"  form="joinform">가입하기</button>
		</div>
	</section>


	<footer style="height: 8vh;"> </footer>

</body>
</html>