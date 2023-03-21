<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<hr>
		<div class="">
		<h3 class="">${boardName}</h3>
		<c:if test="${boardCount == 0 }">
			<p>등록된 게시물이 없습니다</p>
		</c:if>
		
		<a class ="" href="${pageContext.request.contextPath}/cs/serviceOneForm">게시판 입력</a>
			<table class="" style="color: #000">
				<tbody>
					<tr class="">
						<th>번호</th>
						<th>이름</th>
						<th>제목</th>
						<th>내용</th>	
						<th>파일</th>
						<th>입력일</th>
						<th>조회수</th>
					</tr>
				</tbody>

				<tbody>
					<c:forEach var="b" ㄴitems="${list}">  
						<tr>
							<td>${b.num}</td>	
							<td>	
								<c:if test="${b.reflevel > 0}">
									<img src="<%=request.getContextPath() %>/view/board/level.gif" width="${5*b.reflevel}px">
									<img src="<%=request.getContextPath() %>/view/board/re.gif"> 
								</c:if>
								${b.name}
							</td>

							<td><a href="${pageContext.request.contextPath}/board/boardInfo?num=${b.num}">${b.subject}</a></td>
							<td>${b.content}</td> 
							<td>${b.file1}</td>
							<td>${b.regdate}</td>
							<td>${b.readcnt}</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<div class="">
				<c:if test="${startPage <= bottomLine}">
					<a href="#" class="w3-button w3-disabled">[이전]</a>
				</c:if>
				
				<c:if test="${startPage > bottomLine}">
					<a href="${pageContext.request.contextPath}/board/boardList?pageNum=${startPage-1}" class="w3-button">[이전]</a>
				</c:if>
				
				<c:forEach var="p" begin="${startPage}" end="${endPage}">
					<a href="${pageContext.request.contextPath}/board/boardList?pageNum=${p}" class="w3-button <c:if test="${p==pageInt}">w3-red</c:if>"> ${p} </a> &nbsp;
				</c:forEach>
				
				<c:if test="${endPage >= maxPage}">
					<a href="#" class="w3-button w3-disabled">[다음]</a>
				</c:if>
				
				<c:if test="${endPage < maxPage}">
					<a href="${pageContext.request.contextPath}/board/boardList?pageNum=${endPage+1}" class="w3-button">[다음]</a>
				</c:if>
			</div>
		</div>
	</body>
</html>