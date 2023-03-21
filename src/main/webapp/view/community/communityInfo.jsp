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
<section>

	<input type="hidden" name="community_idx" value="${ board.community_idx}">
	<input type="hidden" name="member_idx_fk" value="${ board.member_idx_fk}">
	<input type="hidden" name="community_reply" value="${board.community_idx}">
            <div id="board1">
                <div id="board_header1" >
                    <a href="community_all.html"><p style=" font-size: 0.8vw;">최신글 ></p></a>
                </div>
                <div id="table_list1">
                    <div style="font-size: 1.8vw; margin-bottom: 5px;"></div>
                    <div id="board_profile">
                        <img src="${ pageContext.request.contextPath }/resources/img/user.png" alt="">
                        <div>
                            <p>${board.member_nickname_fk}</p>
                            <p>${board.community_regdate}  </p>
                        </div>
                    </div>
                    <div style="font-size: 1vw; padding: 10px">
                        ${board.community_content}
                    </div>
                    <c:if test="${board.community_file!=null}">
                    <img style="height: 500px" src="${pageContext.request.contextPath}/view/community/img/${board.community_file}" id="file1">
                    </c:if>
                    <div style="margin: 10px  0 0 10px; padding-bottom: 10px;">
                        <a href=""style="display: flex; align-items: center;">
                            <img src="${ pageContext.request.contextPath }/resources/img/chat.png" alt="" style="width: 1.2vw;">
                        <p style="font-size: 0.9vw; margin-left: 2px;"></p>
                        </a>
                    </div>
                </div>
                
               <!-- 댓글 등록 버튼 -->
                <div id="reply_list">              
                    <div id="reply_form">
                        <form name="rep"   action="${pageContext.request.contextPath}/community/replyPro"> 
                       <input type="hidden"  name="community_idx" value="${board.community_idx}"/>
                        <textarea name="msg"> </textarea> 
                        <input type="submit"   value="등록"/>
                        </form>
                      
                    </div>
                   
          <!--  댓글 작성 -->
                  <div id="reply">       
                    
                        <table>
                         <c:forEach var="rep" items="${repList }">
                   
                            <tr>
                                <td rowspan="3" id="reply_profile"><img src="" alt=""></td>
                                <td td style="float: left; text-align: left;">아이디:${rep.member_id}</td>
                                <c:if test="${startPage > bottomLine}"></c:if>
                            </tr>
                            <tr>
                                <td style="float: left; text-align: left;">${rep.msg} <td td style="float: right; text-align:left;">
                                  <fmt:formatDate value="${rep.regdate}" pattern="yyyy-MM-dd" /><td class="float-right"/>
                                
                            </tr>
                            <tr>
                                <td td style="float: left; text-align: left;">
                               
                                
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <!-- 글삭제,글수정 -->
                <div id="table_footer" style="display: flex; justify-content: space-between; margin-top: 10px;">
                    <div id="board_footer" style="display: flex; justify-content: start; align-items: center;">
                        <a href="${ pageContext.request.contextPath }/community/community_UpdateForm?community_idx=${ board.community_idx}"><button class="btn warning" style="margin-right: 5px;">글수정</button></a>
                        <a href="${ pageContext.request.contextPath }/community/community_del?community_idx=${ board.community_idx}"><button class="btn warning" style="margin-right: 5px;">글삭제</button></a>
                        
                    </div>
                    <div style="display: flex; align-items: end;">
                        <a href="${ pageContext.request.contextPath }/community/communityAll"><button class="btn warning">목록</button></a>
                    </div>
                </div>
                
            </div>
            

            
        </section>
        <footer style="height: 8vh;">

        </footer>


</body>
</html>