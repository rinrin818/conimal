<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no"/>
        <meta name="keywords" content="test, homepage">
        <meta name="description" content="s.h testhomepage"/>
        <meta name="author" content="s.h"/>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>코니몰 문의하기 글삭제 화면</title>
        <link rel="icon" type="image/x-icon" href="./src/img/paw-black-shape.png">
        <link href="${pageContext.request.contextPath}/resources/css/main.css?"  type="text/css" rel="stylesheet"/>        
	</head>
	<body>
		<div class="service-outbox">
		<form action="<%=request.getContextPath() %>/board/serviceDeletePro" name="f" method="post">
			<input type="hidden" name="num" value="${num}">
			<input type="hidden"  name="name" value="${member_id}"/>	
			<div class="service-inbox">
			<span class="service-QnA title" > > 게시글을 삭제하시겠습니까?</span>
			<ul class="service-ul"> 		
				<div class="service-inbox">
				<button class="service-save-btn" >게시글삭제</button>
				<!-- <button class="service-save-btn" type="submit" form="service-QnA-form">저장</button>-->
			</ul>
		</form>
		</div>
	</body>
</html>