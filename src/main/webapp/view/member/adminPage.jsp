<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet"/>
<title>프로필</title>
</head>
<body>
	<div style="display: flex; align-items: center; justify-content: center;">
		<h2 style="font-size: 1.8vw; margin-right: 1vw;">관리자</h2>
		<form action="adminMemberSearch" id="search">
			<div class="search">
				<input class="msearch" name="value" placeholder="search">
				<a onclick="document.getElementById('search').submit();"><img src="${pageContext.request.contextPath}/resources/img/search.png"  ></a>	
			</div>
		</form>
	</div>
	<div class="mymain">
		<ul>
			<li><div class="mylist_title"> 관리자페이지</div></li>
			<li style="margin: 20px 0;"><a class="myselect"  href="<%=request.getContextPath()%>/member/admin">회원관리</a>
			</li>
			
			
			
		</ul>
		

		<!-- ======================프로필======================== -->
		<section>
            <div id="board">
                <div id="board_header" >
                    <p style="
                    margin-bottom: 13px;">회원관리</p>
                   
                </div>
                <div id="table_list">
                    <table style="margin-left: 20px;">
                        <tr class="table_header" >
                            <th style="padding-left: 40px;">  </th>
                            <th>아이디</th>
                            <th>닉네임</th>
                            <th>이름</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>성별</th>
                            <th>생일</th>
                            <th>가입일</th>
                        </tr>
                        <c:set  var="cnt"   value="${boardNum}"/>
                        <c:forEach  var="m"  items="${list}">	
	                        <tr class="table_data">
	                            <td style="padding-left: 40px;">${cnt}</td>
	                             <c:set  var="cnt"   value="${cnt+1}"/>
	                            <td><a href="${pageContext.request.contextPath}/member/adminPageInfo?member_id=${m.member_id}">${m.member_id }
								</a></td>
								<td>${m.member_nickname }</td>
	                            <td>${m.member_name }</td>
	                            <td>${m.member_email1 } @ ${m.member_email2 }</td>
	                            <td>${m.member_phone }</td>
	                            <td>${member.member_gender == 1 ? "여자" : "남자"}</td>
	                            <td>${m.member_birthdate }</td>
	                            <td>${m.member_joindate }</td>
	                        </tr>
                        </c:forEach>
                    </table>
                </div>
                
                <div id="next_buttons" style="margin-left: 30vw; margin-top: 20px;">
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
            

            
        </section>
        </div>
	
</body>
</html>