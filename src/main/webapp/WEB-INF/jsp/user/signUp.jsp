<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hyamstagram - join</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/user/signup.css" type = "text/css">


<!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">	

</head>
<body>
<div id = "wrap">
	<section class ="d-flex justify-content-center">
		
			<div class ="form bg-dark">
			
				<h1 class = "mt-4 ml-4">가입하기</h1>
			
			<hr>
			 <div class ="col-6">
				<input type = "text" placeholder= "ID" id = "loginIdInput" class ="form-control">
					<div id = "lengthText" class ="d-none"><small class="text-danger">ID는 5자 이상으로 입력해주세요.</small></div>
					<div id="duplicateText" class="d-none"><small class="text-danger">중복된 ID 입니다</small></div>
					<div id="availableText" class="d-none"><small class="text-info">사용 가능한 ID 입니다.</small></div>
				<input type = "password" placeholder= "비밀번호" id = "passwordInput" class ="form-control">
				<input type = "password" placeholder= "비밀번호 확인"  id ="passwordConfirmInput" class ="form-control">
				<input type = "text" placeholder= "사용자 이름" id = "nameInput" class ="form-control">
				<button type ="button" id = "joinBtn" class ="btn mt-3">가입</button>
				</div>
			</div>

	</section>	
	 	
</div>

<script>
$(document).ready(function(){
	var IDDuplicate = false;
	var checkID = false;
	
	$("#loginIdInput").on("propertychange change keyup paste input",function(){
		var loginId = $("#loginIdInput").val();
		
		if(loginId.length<=4){
			$("#lengthText").removeClass("d-none");
		}
		else{
			$("#lengthText").addClass("d-none");
		}
		
		 $.ajax({
	            url:'/user/idCheck', //Controller에서 인식할 주소
	            type:'post', //POST 방식으로 전달
	            data:{"loginId":loginId},
	            success:function(data){
	                if(data.is_duplication){
	                	$("#duplicateText").removeClass("d-none");
	                	 IDDuplicate = true;
	                	return;
	                }
	                else{
	                	$("#duplicateText").addClass("d-none");
	                	IDDuplicate = false;
	                }
	               		checkID = true;	
	            },
	            error:function(e){
	                alert("에러 발생");
	            }
	        });
		
	})
	
	
	$("#joinBtn").on("click", function(){
		var loginId = $("#loginIdInput").val();
		var password = $("#passwordInput").val();
		var passwordConfirm = $("#passwordConfirmInput").val();
		var name = $("#nameInput").val();
		
		
		if(loginId == null || loginId == "") {
			alert("id를 입력하세요.");
			return;
		}
		
		if(loginId.length<=4){
			alert("id의 길이는 5자 이상이 되어야 합니다.");
			return;
		}
		
		if(IDDuplicate == true){
			alert("id가 중복되었습니다.");
			return;
		}
		if(password == null || password == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
		if(name == null || name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		if(password != passwordConfirm) {
			alert("비밀번호를 다시 확인해주세요.");
			return;
		}
		
		 
		  
	
		 $.ajax({
			 type:"post",
			 url:"/user/sign_up",
			 data:{"loginId":loginId, "password":password, "name":name},
			 success:function(data) {
					if(data.result == "success") {
						alert("회원가입 성공");
						// 로그인 화면으로 이동
						location.href = "/user/signin_view";
						
					} else {
						alert("회원가입 실패");
					}
				}, 
				error:function() {
					alert("에러 발생");
				}
		 });
			
		
		
	});
});

</script>


</body>
</html>