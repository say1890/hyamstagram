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
            
       	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	   <!-- stylesheet -->
	   <link rel = "stylesheet" href = "/static/css/user/signIn.css" type = "text/css">
	   
	   	 <!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	
</head>
<body>
<div id ="wrap">
 <section class="d-flex justify-content-center col-12 ">
 	
 		
 		<div class="card shadow-lg border-0 rounded-lg mt-5">
 			
	 			<h1 class="text-center mt-3"> 
	 					<i>Hyamstagram</i>
	 			</h1>
 			
 			<div class="input-body mt-5">
 				<form id="loginForm">
 					<div class="col-7 mx-auto my-auto row ">
						<input id="loginIdInput" placeholder="ID" class="mt-3 form-control"> 
						<input id="passwordInput" placeholder="비밀번호" class="mt-3 form-control"> 
						<a class="btn  mt-3 col-12 text-white" id ="login">로그인</a>
						<button type="submit" class="btn  mt-3 col-12 d-none" id="realLogin">로그인</button>
					</div>
					<section class ="hr d-flex mt-3 col-12">
						<hr class = "col-4 bg-dark"></hr>
							<div class ="col-2 text-center text-white">또는</div>
						<hr class = "col-4 bg-dark"></hr>
					</section>
				</form>
 			</div>
 			
 			<div class="small-join-box col-12 ">
 				<label class ="text-center d-flex justify-content-center text-white">계정이 없으신가요?</label> 
 				<a href="/user/signup_view" class="d-flex justify-content-center text-white">가입하기</a>
 			</div>
		 	
		</div>
	
 </section>
</div> 	
<script>
$(document).ready(function(){
	//hyamstagram
		$("#login").on("click", function(){
		$("#realLogin").click(); 
			
		});
	
	$("#loginForm").on("submit", function(e){
		alert();
		e.preventDefault();
		var loginId = $("#loginIdInput").val();
		var password = $("#passwordInput").val();
		if(!loginId){
			alert("id를 입력하세요");
			return;
		}
		if(!password){
			alert("pw를 입력하세요.");
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