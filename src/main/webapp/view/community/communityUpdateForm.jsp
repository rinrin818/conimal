<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
    <head>
     <!-- 썸머노트 -->
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no"/>
        <meta name="keywords" content="test, homepage">
        <meta name="description" content="s.h testhomepage"/>
        <meta name="author" content="s.h"/>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>코니몰 문의하기 수정하기</title>
        <link rel="icon" type="image/x-icon" href="./src/img/paw-black-shape.png">
<style>
        .service-outbox{
  position: relative;
  display: grid;
  justify-content: center;
  justify-items: center;
  width: 100vw;
}

.service-inbox{
  width: 70vw;
  max-width: 1200px;
  min-width: 900px;
  border: 1px solid orange;
  text-align: left;
  padding: 20px;
  margin-bottom: 20px;
}

.service-ul{
  display: flex;
  flex-wrap: wrap;
  align-items: stretch;
  justify-content: space-between;
}

.service-li{
  width: 47.2%;
  margin-bottom: 30px;
}
.service-li.textarea{
  width: 100%;
  margin-bottom: 0;
}

.service-li-inline{
  display: flex;
  position: relative;
  display: inline-block;
  width: 100%;
  box-sizing: border-box;
}
.service-li-textarea{
  resize: none;
  width: 98%;
  height: 340px;
  padding: 10px;
}

.service-li-input{
  width: 95.5%;
  height: 16px;
  padding: 10px;
  font-size: 16px;
}

.service-li-title{
  position: absolute;
  cursor: text;
  left: 10px;
  bottom: 50%;
  background-color: var(--cl-white);
  transform: translateY(50%);
  transition: all 0.2s;
}
.service-li-input:not(:placeholder-shown) + .service-li-title,
.service-li-input:focus + .service-li-title{
  transform: translateY(-35%);
}

.service-li-star{
  color: var(--cl-darkorange);
  font-size: 15px;
}

.service-save-btn{
  cursor: pointer;
  width: 200px;
  height: 50px;
  margin-bottom: 40px;
  color: var(--cl-gray);
  background-color: #00000000;
  border: 2px solid var(--cl-orange);
  border-radius: 15px;
  font-size: 24px;
  transition: all 0.2s;
  /* border-color: var(--cl-orange);
  border-style: solid; */
}
.service-save-btn:hover{
  color: var(--cl-beige);
  background-color: var(--cl-orange);
}
</style>     
<script>
	function file_delete() {
		document.f.file1.value = "";
		file_desc.style.display = "none";
	}
</script>
</head>
<body>
	
	<form action="${pageContext.request.contextPath}/community/community_UpdatePro" method="post"  	
	enctype="multipart/form-data"  name="f">
	<div class="service-outbox">
		<input type="hidden" name="community_idx" value="${board.community_idx}">
	<%-- 	<input type="hidden" name="file1"  	value="${board.file1}"> --%>
		<input type="hidden"  name="member_nickname_fk" value="${board.member_nickname_fk}"/>
		<div class="service-inbox">
		
		 <span class="service-QnA title" >${boardName}</span>
			 <ul class="service-ul">
                        <li class="service-li"><span class="service-li-inline">
                        <input class="service-li-input" id="service-QnA-title" type="text" name="community_title" value="${board.community_title}" maxlength="150" placeholder=" ">
                        <label class="service-li-title" for="service-QnA-title"><span class="service-li-star">*</span>제목</label></span></li>
                            <li class="service-li textarea">
                             <h3 style="margin: 10px;"> 내용</h3>
                                <textarea  id="summernote"class="service-li-textarea" 
                                name="community_content">${board.community_content}</textarea>
                            </li>
                        </ul>
                </div>
	
			<%-- 	<td>첨부파일</td>
				<%-- <td style="text-align: left">
				<c:if test="${board.file1 != null && board.file1 ne ''}">
					
					 <div class="service-inbox">
					<div id="file_desc">${board.file1}
					
					 
					<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					<td style="text-align: left">
					
					</div> </c:if>
				<input type="file" name="f">
				</td> --%>
               
                <div style=" text-align: center;">
                    <button class="service-save-btn" >저장</button>
          
				<!--	<div style=" text-align: center;">
					<button class="service-save-btn" >저장</a></button> -->
					
		</div>
	</form>
	<script>
 
    $('#summernote').summernote({
    	 placeholder: '글을 쓰세요',
         tabsize: 2,
         height: 400, // 에디터 한글 설정
         lang: "ko-KR",
         // 에디터에 커서 이동 (input창의 autofocus라고 생각)
            focus : true,
         
    	  toolbar: [
    	    // [groupName, [list of button]]
    	    // 글꼴 설정
            ['fontname', ['fontname']],
            //글자 크기 설정
            ['fontsize', ['fontsize']],
          	//글자스타일
    	    ['style', ['bold', 'italic', 'underline', 'clear']],
         	 //글자색
            ['color', ['forecolor','color']],
         	// 표만들기
            ['table', ['table']],
          	//글머리 기호,번호매기기,문단정렬
          	['para', ['ul', 'ol', 'paragraph']],
    	    //폰트
    	    ['font', ['strikethrough', 'superscript', 'subscript']],
    	 	// 코드보기, 확대해서보기, 도움말
            ['view', ['codeview','fullscreen', 'help']],
    	    //줄간격
    	    ['height', ['height']]
    	  ]
    	});
    </script>
</body>
</html>