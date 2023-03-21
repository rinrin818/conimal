<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="javascript">
	
	function delete_check(url){
		var answer;
		//페이지를 이동하기 전에 confirm()을 사용해 다시 한번 확인한다.
		//확인을 선택하면 answer에  true, 취소를 선택하면 false 값이 들어간다.
		answer = confirm("데이터를 삭제하시겠습니까?");
		//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
		if(answer == true){
			location = url;
		}
	}

	</script>
</head>
<body bgcolor="#ffffff">
	<a href="javascript:delete_check('ex_end.html')">데이터삭제</a>
</body>
</html>