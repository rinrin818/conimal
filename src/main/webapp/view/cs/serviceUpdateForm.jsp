<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no"/>
        <meta name="keywords" content="test, homepage">
        <meta name="description" content="s.h testhomepage"/>
        <meta name="author" content="s.h"/>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>코니몰 문의하기 수정하기</title>
        <link rel="icon" type="image/x-icon" href="./src/img/paw-black-shape.png">   
        <script>
            function file_delete() {
                document.f.file1.value = "";
                file_desc.style.display = "none";
            }
        </script>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/board/serviceUpdatePro" method="post" enctype="multipart/form-data" name="f">
            <div class="service-outbox">
                <input type="hidden" name="num" value="${board.num}">
                <input type="hidden" name="file1"  	value="${board.file1}">
                <input type="hidden"  name="name" value="${member_id }"/>
                <input type="hidden" name="num" value="${num}">
                <div class="service-inbox">
                    <span class="service-QnA title" >${boardName} > 게시글 수정</span>
                    <ul class="service-ul">
                        <li class="service-li">
                            <span class="service-li-inline"><input class="service-li-input" id="service-QnA-title" type="text" name="subject" value="${board.subject}" maxlength="150" placeholder=" "><label class="service-li-title" for="service-QnA-title"><span class="service-li-star">*</span>제목</label></span>
                        </li>
                        <li class="service-li textarea">
                            <h3 style="margin: 10px;"> 내용</h3>
                            <textarea class="service-li-textarea" name="content">${board.content}</textarea>
                        </li>
                    </ul>
                </div>

                <td>첨부파일</td>
                <td style="text-align: left">
                    <c:if test="${board.file1 != null && board.file1 ne ''}">
                        <div class="service-inbox">
                        <div id="file_desc">${board.file1}
                            <a href="javascript:file_delete()">[첨부파일 삭제]</a>
                            <td style="text-align: left">
                        </div> 
                    </c:if>

                    <input type="file" name="f">
                </td>
                </tr>
                <div style=" text-align: center;">
                    <button class="service-save-btn" >저장</a></button>
                    </td>
                    </tr>
                    </table>
                </div>
            </div>
        </form>
    </body>
</html>