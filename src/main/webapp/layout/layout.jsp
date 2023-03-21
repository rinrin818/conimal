<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- webapp/layout/layout.jsp -->
		<link rel="icon" type="image/x-icon" href="${ pageContext.request.contextPath}/resources/img/paw.png">
		<title>코니멀</title>
		<%@ include file="/common/head.jsp" %>
		<sitemesh:write property='head'/>
	</head>
	<body>
		<div class ='mainBody'>
			<sitemesh:write property='body'/>
		</div>
		<div>
		<!-- footer -->
		<sitemesh:write property='footer' />
		<!-- footer -->
		</div>
	</body>
</html>