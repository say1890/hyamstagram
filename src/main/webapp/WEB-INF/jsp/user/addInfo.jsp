<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hyamstagram-프로필 편집</title>
       <!-- bootstrap CDN link -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<!--  부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  
	 <!-- css -->
		
		<link rel = "stylesheet" href = "/static/css/post/style.css" type = "text/css">

	
	 <!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
<div id = "wrap">
	<div id = "inputForm" class = "col-5 mx-auto my-5 bg-success">
		<label>정보 수정하기</label>
		<hr>
		<div class ="d-flex col-12 ">
			<div class ="img-wrapper mb-3">
				<img src = "https://img3.yna.co.kr/etc/inner/KR/2016/09/05/AKR20160905049451009_04_i_P2.jpg" 
				class= "mt-1 rounded-circle" id ="selectPic">	
			</div>
			<div class ="row col-6">
			<div class ="mt-3 col-6">${loginId}</div>
			</div>
		</div>
		
		<input type ="file" id="fileInput" class="d-none">
		<b class ="mt-5">이름</b> 
		<input type ="text" class = "form-control" placeholder = "${userName}" id = "userNameInput">
		<b>id</b> 
		<input type ="text" class = "form-control" placeholder = "${userLoginId}" id="loginIdInput">
		<b>소개</b> 
		<input type ="text" class = "form-control" id="introduceInput">
		<button type="button" id ="submitBtn" class ="btn">제출</button>	 
	</div>
</div>


<script>

$(document).ready(function(){
	$("#selectPic").on("click", function(){
		$("#fileInput").click(); 
	});
	
	
	$("#submitBtn").on("click", function(){
		
		let userName = $("#userNameInput").val().trim();
		let loginId = $("#loginIdInput").val().trim();
		let introduce =  $("#introduceInput").val().trim();
		
		if(userName == "") {
			return;
		}
		if(loginId == "") {
			return;
		}
		if(introduce == "") {
			return;
		}
		
		var formData = new FormData();
		formData.append("userName", userName);
		formData.append("loginId", loginId);
		formData.append("introduce", introduce);
		formData.append("file", $("#fileInput")[0].files[0]);
		
		$.ajax({
			type:"post",
			url:"/user/editInformation",
			data:formData,
			enctype:"mutipart/form-data",  // 파일 업로드 필수
			processData:false, // 파일 업로드 필수
			contentType:false, // 파일 업로드 필수
			success:function(data) {
				if(data.result == "success") {
					location.href="/post/list_view";
				} else {
					alert("실패");
				}
			},
			error:function() {
				alert("에러발생");
			}
		});
		
		
		
	});
	
})

</script>

</body>

</html>