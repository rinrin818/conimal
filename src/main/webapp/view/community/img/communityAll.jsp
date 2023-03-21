<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>



	<div
		style="display: flex; align-items: center; justify-content: center;">
		<h2 style="font-size: 1.8vw; margin-right: 1vw;">커뮤니티</h2>
		<div class="search">
			<input class="msearch" name="test" placeholder="search"> <a
				href=""><img
				src="${ pageContext.request.contextPath }/resources/img/search.png"></a>
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
						<th>추천</th>
						<th>조회</th>
					</tr>
					<c:forEach var="b" items="${list}">
						<tr class="table_data">
							<td>${b.community_idx}</td>
							<td class="table_title" style="float: left; padding-top: 10px;"><a
								href="${ pageContext.request.contextPath }/community/communityInfo?community_idx=${b.community_idx}">${b.community_title}</a>
								<div>999</div></td>
							<td>${b.member_nickname_fk}</td>
							<td>${b.community_regdate}</td>
							<td>100</td>
							<td>${b.community_hit}</td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
			<div id="board_footer">
				<a href="${ pageContext.request.contextPath }/community/community_Form"><button class="btn warning">글쓰기</button></a>
				<div id="next_buttons">
					<c:if test="${startPage <= bottomLine}">
						<a href="#" class="previous round" style="background-color: gray">&#8249;</a>
					</c:if>
					<c:if test="${startPage > bottomLine}">
						<a href="${ pageContext.request.contextPath }/community/communityAll?pageNum=${startPage-1}" class="previous round">&#8249;</a>
					</c:if>
					<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
						<a href="${ pageContext.request.contextPath }/community/communityAll?pageNum=${p}" >
							${ p } </a> &nbsp;
      				</c:forEach>
      				<c:if test="${endPage >= maxPage}">
						<a href="#" class="next round">&#8250;</a>
					</c:if>
					<c:if test="${endPage < maxPage}">
						<a href="${ pageContext.request.contextPath }/community/communityAll?pageNum=${endPage+1}" class="next round">&#8250;</a>
					</c:if>
				</div>
				<div></div>
			</div>

		</div>



	</section>
	<footer style="height: 8vh;"> </footer>



</body>
</html>