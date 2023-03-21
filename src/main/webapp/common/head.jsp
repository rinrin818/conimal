<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
 	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
        <meta charset="UTF-8">
        <title>네비바</title>

        <link href="${ pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/>
        <link href="${ pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet"/>
        <link href="${ pageContext.request.contextPath}/resources/css/join.css" rel="stylesheet"/>
        <link href="${ pageContext.request.contextPath}/resources/css/community.css" rel="stylesheet"/>
        <link href="${ pageContext.request.contextPath}/resources/css/community_info.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="nav-container nav-color">
            <strong class="nav-titleCont"><a class="nav-title" href="${ pageContext.request.contextPath}/community/communityAllNew"><img class="nav-logoImg" src="${ pageContext.request.contextPath}/resources/img/paw-black-shape.png">&nbsp;코니멀</a></strong>
            <nav>
                <ul class="nav-ulP">
                    <li class="nav-li Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAllNew">커뮤니티</a>
                        <ul class="nav-ulC nav-ulC1"> <!-- 최신글 인기글 자유게시판 강아지 고양이 특수동물 정보공유 질문해요 -->
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAllNew">최신글</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAll?boardid=2">자유게시판</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAll?boardid=3">강아지</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAll?boardid=4">고양이</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAll?boardid=5">특수동물</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAll?boardid=6">정보공유</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath}/community/communityAll?boardid=7">질문해요</a></li>
                        </ul>
                    </li>

                    <li class="nav-li Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath }/board/serviceOne?boardid=3">고객센터</a>
                        <ul class="nav-ulC nav-ulC3">
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath }/board/serviceOne?boardid=3">공지사항</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath }/board/serviceOne?boardid=2">이벤트</a></li>
                            <li class="nav-liC Runderline"><a class="nav-Fcolor" href="${ pageContext.request.contextPath }/board/serviceOne?boardid=1">1:1문의</a></li>
                        </ul>
                    </li>

                    <c:if test="${sessionScope.member_id==null}" >
                    	<li class="nav-li Runderline"><a class="nav-Fcolor" href="<%=request.getContextPath()%>/member/login">로그인</a></li>
                    </c:if>

                    <c:if test="${sessionScope.member_id eq 'admin' }" >
					    <li class="nav-li Runderline"><a class="nav-Fcolor" href="<%=request.getContextPath()%>/member/adminPage">관리자페이지</a></li>
					</c:if>

                    <c:if test="${sessionScope.member_id!=null}" >
	                    <li class="nav-li Runderline li_delete"><a class="nav-Fcolor" href="<%=request.getContextPath()%>/member/memberInfo"><%=session.getAttribute("member_id") %>님의 마이페이지</a></li>
	                    <li class="nav-li Runderline"><a class="nav-Fcolor" href="<%=request.getContextPath()%>/member/logout">로그아웃</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </body>
</html>