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
				<p style="margin-bottom: 13px;">댓글목록</p>
			</div>
			<div>          
              <table>
             		<tr>
                        <td colspan="3" style="border-bottom: solid 1px var(--cl-orange); width:100vw" >
                        </td>
                    </tr>
                 <c:forEach var="rep" items="${repList}">
           
                    <tr>
                        <td rowspan="3" id="reply_profile"><img src="" alt=""></td>
                        <td td style="float: left; text-align: left;">아이디:${rep.member_id}</td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding:3px 0px; border-bottom: solid 1px var(--cl-litegray); width:100vw" >
                        </td>
                    </tr>
                    <tr>
                        <td style="float: left; text-align: left; padding-right:20px; margin-top:10px">${rep.msg}</td>
                        <td td style="float: right; text-align:left;">
							<fmt:formatDate value="${rep.regdate}" pattern="yyyy-MM-dd" />
						</td>
						<td class="float-right"/>
                    </tr>
                    <tr>
                        <td style="float: left; text-align: left;"/>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-bottom: solid 1px var(--cl-orange); width:100vw" >
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    
                    
                  </c:forEach>

                </table>
            </div>

		</div>



	</section>
	<footer style="height: 8vh;"> </footer>



</body>
</html>