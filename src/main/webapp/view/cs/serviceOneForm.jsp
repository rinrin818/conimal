<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="kr">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no" />
		<meta name="keywords" content="test, homepage">
		<meta name="description" content="s.h testhomepage" />
		<meta name="author" content="s.h" />
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache">
		<title>코니몰 문의하기</title>
		<link rel="icon" type="image/x-icon" href="./src/img/paw-black-shape.png">
	</head>
	<body>
		<div class="service-outbox">
			<form id="service-QnA-form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/board/serviceOnePro" method="post">
				<input type="hidden" name="name" value="${member_id}" />
				
				<div class="service-inbox">
                    <c:if test="${boardid==3}">
                        <p style="margin-bottom: 13px;"> > 공지사항 작성</p>
                    </c:if>
                    
                    <c:if test="${boardid==2}">
                        <p style="margin-bottom: 13px;"> > 이벤트 작성</p>
                    </c:if>
                    
                    <c:if test="${boardid==1}">
                    	<c:if test="${sessionScope.member_id!=null && sessionScope.member_id!='admin'}">
                           <span class="service-QnA title"> > 문의하기</span>
                        </c:if>
                        <c:if test="${sessionScope.member_id!=null && sessionScope.member_id=='admin'}">
                            <span class="service-QnA title"> > 문의 답변하기</span>
                        </c:if>
                    </c:if>
					

					<ul class="service-ul">
						<li class="service-li"><span class="service-li-inline"><input class="service-li-input" id="service-QnA-title" type="text" name="subject" maxlength="150" placeholder=" "><label class="service-li-title" for="service-QnA-title"><span class="service-li-star">*</span>제목</label></span></li>
						<li class="service-li textarea">
							<h3 style="margin: 10px;">내용</h3>
							<textarea class="service-li-textarea" name="content" placeholder="문의 내용을 입력해주세요"></textarea>
						</li>
					</ul>
				</div>

				<div class="service-inbox">
					<label class="" style="cursor: pointer;" for="service-QnA-searchImg">파일</label><input class="w3-input w3-border" id="service-QnA-searchImg" type="file" name="file2"> <a href="javascript:win_upload()"></a>
				</div>
			</form>
			<button class="service-save-btn" type="submit" form="service-QnA-form">저장</button>
		</div>
	</body>
</html>