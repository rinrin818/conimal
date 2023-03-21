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
        <title>코니몰 문의하기 답글</title>
        <link rel="icon" type="image/x-icon" href="./src/img/paw-black-shape.png">  
    </head>
    <body>
        <div class="service-outbox">
            <form action="${pageContext.request.contextPath}/board/serviceReplyPro" method="post" enctype="multipart/form-data" name="f">
                <input type="hidden"  name="num" value="${board.num}">
                <input type="hidden"  name="ref" value="${board.ref}">
                <input type="hidden"  name="refstep" value="${board.refstep}">
                <input type="hidden"  name="reflevel" value="${board.reflevel}">
                <input type="hidden"  name="name" value="${member_id }"/> <!-- 아이디정보 받아오기 -->
                ㄴ
                <div class="service-inbox">
                    <span class="service-QnA title" >${boardName }: > 답글쓰기</span>	
                    
                    <ul class="service-ul">
                        <li class="service-li"><span class="service-li-inline">
                            <input class="service-li-input" id="service-QnA-title" type="text" name="subject"  value="re:${board.subject}" maxlength="150" placeholder=" "><label class="service-li-title" for="service-QnA-title"><span class="service-li-star">*</span>제목</label></span>
                        </li>

                        <li class="service-li textarea">
                            <h3 style="margin: 10px;">내용</h3>
                            <textarea class="service-li-textarea" name="content" placeholder="답변 내용을 입력해주세요"></textarea>
                        </li>
                    </ul>
                </div>

                <div class="service-inbox"><label class="" style="cursor: pointer;" for="service-QnA-searchImg">파일</label><input class="w3-input w3-border" id="service-QnA-searchImg" type="file" name="f"><a href="javascript:win_upload()"></a></div>
                
                <button class="service-save-btn" type="submit">저장</button>   
            </form>  
        </div>
    </body>
</html>
				