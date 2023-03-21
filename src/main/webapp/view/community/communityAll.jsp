<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="display: flex; align-items: center; justify-content: center;">
		<h2 style="font-size: 1.8vw; margin-right: 1vw;">커뮤니티</h2>
		<div class="search">
			<input class="msearch" name="test" placeholder="search"> 
			<a href="">
				<img src="${ pageContext.request.contextPath }/resources/img/search.png">
			</a>
		</div>
	</div>

	<section>
		<div id="board">
			<div id="board_header">
				<p style="margin-bottom: 13px;">${boardName}보기</p>
				<p style="font-size: 0.8vw;">${boardContent}</p>
			</div>
			<div id="table_list">
				<table>
					<tr class="table_header">
						<th style="padding-right: 10px;"></th>
						<th style="width: 40vw;">제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
					<c:set  var="cnt"  value="${boardNum}"></c:set>
					
					<c:forEach var="b" items="${list}">
						<tr class="table_data">
							<td>${cnt}</td>
							<c:set  var="cnt"   value="${cnt-1}"/> <!-- 게시판 정렬숫자 -->
							<td class="table_title" style="float: left; padding-top: 10px;">
								<a href="${ pageContext.request.contextPath }/community/communityInfo?community_idx=${b.community_idx}">${b.community_title}</a>
								<!-- <div>댓글 갯수</div> -->
							</td>
							<td>${b.member_nickname_fk}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${b.community_regdate}"/></td>
							<td>${b.community_hit}</td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
			<div id="board_footer">
				
	            <c:if test="${sessionScope.member_id!=null}">
	            	<a href="${pageContext.request.contextPath}/community/community_Form"><button class="btn warning">글쓰기</button></a>
	            </c:if>
				<a style="opacity:0;" href=""><button class="btn warning">글쓰기</button></a>
				<input type="hidden"  name="name" value="${comunity_idx}"/>
				</a>
				<div style="position: absolute; left:50%; transform: translateX(-50%);" id="next_buttons">
					<c:if test="${startPage <= bottomLine}">
						<a href="#" class="previous round" style="background-color: gray">&#8249;</a>
					</c:if>
					<c:if test="${startPage > bottomLine}">
						<a href="${ pageContext.request.contextPath }/community/communityAll?pageNum=${startPage-1}" class="previous round">&#8249;</a>
					</c:if>
					<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
						<a href="${ pageContext.request.contextPath }/community/communityAll?pageNum=${p}" >
							${ p } </a>
      				</c:forEach>
      				<c:if test="${endPage >= maxPage}">
						<a href="#" class="next round">&#8250;</a>
					</c:if>
					<c:if test="${endPage < maxPage}">
						<a href="${ pageContext.request.contextPath }/community/communityAll?pageNum=${endPage+1}" class="next round">&#8250;</a>
					</c:if>
				</div>
			</div>

		</div>



	</section>
	<footer style="height: 8vh;"> </footer>



</body>
</html>