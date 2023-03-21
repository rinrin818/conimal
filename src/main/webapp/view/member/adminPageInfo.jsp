<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/adminInfo.css" rel="stylesheet"/>
<title>프로필</title>
<script>
function win_load1() {
	var op = "Width=1100, height=600, left=50, top=150";
	open("${pageContext.request.contextPath}/board/serviceOneMember?name=${member.member_id}","",op);
}

function win_load2() {
	var op = "Width=1100, height=600, left=50, top=150";
	open("${pageContext.request.contextPath}/community/communityAllMember?member_nickname_fk=${member.member_id}","",op);
}

function win_load3() {
	var op = "Width=1100, height=600, left=50, top=150";
	open("${pageContext.request.contextPath}/community/communityAllMemberReply?member_id=${member.member_id}","",op);
}



function delete_check(url){
	var answer;
	//페이지를 이동하기 전에 confirm()을 사용해 다시 한번 확인한다.
	//확인을 선택하면 answer에  true, 취소를 선택하면 false 값이 들어간다.
	answer = confirm("회원 강제 탈퇴 시키겠습니까?");
	//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
	if(answer == true){
		location = url;
	}
}

</script>
</head>
<body>
    <div style="display: flex; align-items: center; justify-content: center;">
        <h2 style="font-size: 1.8vw; margin-right: 1vw;">관리자</h2>
        
    </div>
	<div class="mymain">
		<ul>
			<li><div class="mylist_title"> 관리자페이지</div></li>
			<li style="margin: 20px 0;"><a class="myselect"  href="<%=request.getContextPath()%>/member/adminPage">회원관리</a>
			</li>
			
			
			
		</ul>
		

		<!-- ======================프로필======================== -->
        <div class="mysubject">
            <div class="mysubject_title">
                <img src="${pageContext.request.contextPath}/resources/img/arrow2.png" height="10px"> 
                <p class="mysubject_title_name">회원 프로필</p>
            </div>
        
            <div class="myprofile">
    
                    <%-- <img src="${pageContext.request.contextPath}/view/member/picture/${member.picture}" width="100" height="120" id="pic"> --%>
    
                <table>
                    <tr>
                        <td rowspan="4" valign="top" width="120px" style="text-align:center">
                        <img class="mypicture" src="<%=request.getContextPath()%>/view/member/picture/${member.member_picture}" style="margin-top:20px; text-align:center" width="100" id="pic"></td>
                    </tr>
                    <tr>
                        <td class="mytable_list">NAME</td>
                        <td>: ${member.member_name}</td>
                    </tr>
                    <tr>
                        <td class="mytable_list">ID</td>
                        <td>: ${member.member_id}</td>
                    </tr>
                    <tr>
                        <td class="mytable_list">NICKNAME</td>
                        <td>: ${member.member_nickname}</td>
                    </tr>
                    <tr>
                        <td rowspan="2">&nbsp;</td>
                        <td class="mytable_list">E-mail</td>
                        <td>: ${member.member_email1} @ ${member.member_email2}</td>
                    </tr>
                    <tr>
                        <td class="mytable_list">PHONE</td>
                        <td>: ${member.member_phone}</td>
                    </tr>
                    <tr>
                        <td rowspan="2" width="12px">&nbsp;</td>
                        <td class="mytable_list">GENDER</td>
                        <td>: ${member.member_gender == 1 ? "여" : "남"}</td>
                    </tr>
                    <tr>
                        <td class="mytable_list">BIRTHDAY</td>
                        <td>: ${member.member_birthdate}</td>
                    </tr>
    
                    </table>
                </div>
                <div style="display: flex; flex-direction: row;">
	                 <div class="myprofile_under">
	                    <a class="mybtn"  href="javascript:win_load2()" >회원게시글</a>
	                </div>
	                 <div class="myprofile_under" style="margin-left: -50px">
	                    <a class="mybtn" href="javascript:win_load3()">회원댓글</a>
	                </div>
	                 <div class="myprofile_under" style="margin-left: -50px">
	                    <a class="mybtn" href="javascript:win_load1()">회원1:1문의</a>
	                </div>
	                <div class="myprofile_under" style="margin-left: -50px">
	                    <a class="mybtn" href="javascript:delete_check('${pageContext.request.contextPath}/member/adminMemberDeletePro?member_id=${member.member_id }')">회원강제탈퇴</a>
	                </div>
	               
               </div>

           
            
            
         </div>
        </div>
        
        	
</body>
</html>