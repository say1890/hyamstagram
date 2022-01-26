<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Hyamstagram - login</title>

       <!-- bootstrap CDN link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	   <!-- stylesheet -->
	   <link rel = "stylesheet" href = "/static/css/user/signIn.css" type = "text/css">
	
</head>
<body>
<div id ="wrap">
 <section class = "d-flex justify-content-center">
 	<div class ="col-lg-5">
 		<div class="card shadow-lg border-0 rounded-lg mt-5 bg-warning">
 		
 			<div class ="input-header">
 				<h1 class="text-center font-weight-light my-4">Hyamstagram</h1>
 			</div>
 			
 			<div class ="input-body">
 				<form id = "loginForm">
				<input id = "loginIdInput" placeholder ="ID 혹은 이메일" class ="mt-3 form-control"> 
				<input id = "passwordInput" placeholder = "비밀번호" class ="mt-3 form-control"> 
				<button type ="submit" class ="btn mt-3">로그인</button>
			</form>
 			</div>
 			
 			<div class ="small-join-box">
 				<label>계정이 없으신가요?</label> <a href = "/user/signup_view">가입하기</a>
 			</div>
		 	
		</div>
	</div>
 </section>	
</div>

<script>
$(document).ready(function(){
	//hyamstagram
	
	$("#loginForm").on("submit", function(e){
		var loginId = $("#loginIdInput").val();
		var password = $("#passwordInput").val();
		if(loginId==null || loginId== "" ){
			alert("id를 입력하세요");
			return;
		}
		if(password == null || password== ""){
			alert("pw를 입력하세요.");
			return;
		}
		else{
			alert("잘했음");
			return;
		}
		$.ajax({
			
			type:"post",
			url:"/user/sign_in",
			data:{"loginId":loginId, "password":password},
			success:function(data){
				if(data.result == "success"){
					location.href ="/post/list_view";
				}
				else{
					alert("아이디, 비밀번호를 확인하세요.");
				}
			},
			error:function(){
				alert("에러 발생");
			}
			
		})
		
		
	}); //loginform 끝

});


</script>
</body>
</html>