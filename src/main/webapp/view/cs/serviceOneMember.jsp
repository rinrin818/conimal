<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>1:1 게시판</title>
    </head>
    <body>
        <div style="display: flex; align-items: center; justify-content: center;">
            <h2 style="font-size: 1.8vw; margin-right: 1vw;">1 : 1 문의</h2>
        </div>

        <section>
            <div id="board">
                <div id="board_header">
                    <p style="margin-bottom: 13px;">문의사항</p>
                    <p style="font-size: 0.8vw;">문의사항 답변해드립니다.</p>
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

                        <c:set  var="cnt"   value="${boardNum}"/>
                        <c:forEach    var="b"   items="${list}">  
                            <tbody>
                                <tr class="table_data">
                                    <c:set  var="cnt"   value="${cnt+1}"/>
                                    <td>${cnt}</td>   <!-- 게시판 정렬숫자 -->
                                    <td class="table_title" style="float: left; padding-top: 10px;">
                                        <c:if test="${b.reflevel > 0}">
                                            <img src ="<%=request.getContextPath() %>/view/cs/down-right.png" style="width: 1vw;"> 
                                        </c:if>

                                        <a href="${pageContext.request.contextPath}/board/serviceOneInfo?num=${b.num}">${b.subject}</a>
                                        
                                        <c:if test="${b.cc == 2}"> 
                                            <div>답변완료</div>
                                        </c:if>
                                        
                                        <c:if test="${b.cc == 1}"> 
                                            <div>미답변</div>
                                        </c:if>
                                        
                                        <c:if test="${b.cc == 0}"> 
                                        </c:if>
                                    </td>
                                    <td>${b.name}</td>
                                    <td>${b.regdate}</td>
                                    <td>${b.readcnt}</td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>

                <div id="board_footer">
                    <!--비회원 글쓰기 문의하기 불가-->
                    <c:if test="${sessionScope.member_id==null}">
                        <button class="btn warning">문의하기</button> 
                    </c:if>
                    <c:if test="${sessionScope.member_id!=null}">
                        <a href="${pageContext.request.contextPath}/board/serviceOneForm"><button class="btn warning">문의하기</button></a>
                    </c:if>
                    <!--     <div id="next_buttons">
                    <a href="#" class="previous round">&#8249;</a> 
                    <a href="#" class="">1</a>
                    <a href="#" class="">2</a> 
                    <a href="#" class="">3</a> 
                    <a href="#"   class="next round">&#8250;</a> 
                    </div>-->

                    <div id="next_buttons">
                        <c:if test="${startPage <= bottomLine}">
                            <a href="#" class="previous round">&#8249;</a>
                        </c:if>
                        
                        <c:if test="${startPage > bottomLine}">
                            <a href="${pageContext.request.contextPath}/board/serviceOne?pageNum=${startPage-1}" class="previous round">&#8249;></a>
                        </c:if>

                        <c:forEach	var="p"		begin="${startPage}" end="${endPage}">
                            <a href="${pageContext.request.contextPath}/board/serviceOne?pageNum=${p}" class="w3-button	<c:if test="${p==pageInt}"> w3-red</c:if>"	> ${p} </a>  &nbsp;
                        </c:forEach>

                        <c:if test="${endPage >= maxPage}">
                            <a href="#" class="next round">&#8250;</a>
                        </c:if>

                        <c:if test="${endPage < maxPage}">
                            <a href="${pageContext.request.contextPath}/board/serviceOne?pageNum=${endPage+1}" class="next round">&#8250;</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
        
        <footer style="height: 8vh;"> </footer>
    </body>
</html>