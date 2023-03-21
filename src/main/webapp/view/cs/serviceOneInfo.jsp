<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function delete_check(url) { //글삭제 알림창! 
				var answer;
				//페이지를 이동하기 전에 confirm()을 사용해 다시 한번 확인한다.
				//확인을 선택하면 answer에  true, 취소를 선택하면 false 값이 들어간다.
				answer = confirm("게시글을 삭제하시겠습니까?");
				//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
				if (answer == true) {
					location = url;
				}
			}
		</script>
	</head>
	<body>
		<section>
			<div id="board">
				<div id="board_header">
					<c:if test="${boardid==3}">
                        <a href="${ pageContext.request.contextPath }/board/serviceOne?boardid=3"><p style="font-size: 0.8vw;">공지사항 ></p></a>
                    </c:if>
                    
                    <c:if test="${boardid==2}">
                        <a href="${ pageContext.request.contextPath }/board/serviceOne?boardid=2"><p style="font-size: 0.8vw;">이벤트 ></p></a>
                    </c:if>
                    
                    <c:if test="${boardid==1}">
                        <a href="${ pageContext.request.contextPath }/board/serviceOne?boardid=1"><p style="font-size: 0.8vw;">1:1문의 ></p></a>
                    </c:if>
					
				</div>

				<div id="table_list1">
                    <div style="font-size: 1.8vw; margin-bottom: 5px;"></div>
                    <div id="board_profile">
                        <img src="${pageContext.request.contextPath}/view/cs/user.png" alt="">
                        <div>
                            <p>${board.name}</p>
                            <p>${board.regdate}  </p>
                        </div>
                    </div>
                    <div style="font-size: 1vw; padding: 10px">
                        ${board.content}
                    </div>
                    <c:if test="${board.file1!=null}">
                    <img style="height: 500px" src="${pageContext.request.contextPath}/view/cs/img/${board.file1}" id="file1">
                    </c:if>
                    <div style="margin: 10px  0 0 10px; padding-bottom: 10px;">
                        <a href=""style="display: flex; align-items: center;">
                            <img src="${ pageContext.request.contextPath }/resources/img/chat.png" alt="" style="width: 1.2vw;">
                        <p style="font-size: 0.9vw; margin-left: 2px;"></p>
                        </a>
                    </div>
                </div>

				<!-- 사진등록 -->
				<div id="table_footer" style="display: flex; justify-content: space-between; margin-top: 10px;">
					<div id="board_footer" style="display: flex; justify-content: start;">

						<!-- 관리자만 답글작성-->
						<c:if test="${sessionScope.member_id eq 'admin' }">
							<a href="<%=request.getContextPath()%>/board/serviceReplyForm?num=${board.num}"><button class="btn warning" style="margin-right: 5px;">답글</button></a>
						</c:if>

						<c:if test="${sessionScope.member_id eq board.name ||sessionScope.member_id eq 'admin'}">
							<a href="${pageContext.request.contextPath}/board/serviceUpdateForm?num=${board.num}"><button class="btn warning" style="margin-right: 5px;">글수정</button></a>
							<!-- 글삭제 알림창-->
							<a class="mybtn" href="javascript:delete_check('${pageContext.request.contextPath}/board/serviceDeletePro?num=${board.num}')"><button class="btn warning">글삭제</button></a>
						</c:if>
					</div>
					
					<div>
						<a onclick="history.back()"><button class="btn warning" style="margin-right: 5px;">목록</button></a>
					</div>
				</div>
			</div>
		</section>

		<footer style="height: 8vh;"> </footer>
	</body>
</html>