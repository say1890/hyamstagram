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
		
		<link rel = "stylesheet" href = "/static/css/user/addInfo.css" type = "text/css">

	
	 <!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
<div id = "wrap" class ="row" style="float: none; margin:100 auto;">


	<div id = "inputForm" class = "col-5 mx-auto my-5"  style="float: none; margin:100 auto;">
		<div class ="mt-3"> 
			<h3 class ="text-center">정보 수정하기</h3>
		</div>
		
		<hr>
		<div class ="d-flex col-12 ">
			<div class ="img-wrapper mb-4">
				<img src = "${imagePath}" class = "rounded-circle" id ="selectPic">
			</div>
			<div class ="row col-6">
			<div class ="mt-3 col-6">${userLoginId}</div>
			</div>
		</div>
		
		<input type ="file" id="fileInput" class="d-none">
		<b class ="mt-5">이름</b> 
		<input type ="text" class = "form-control" value = "${userName}" id = "userNameInput">
		
		<b>id</b> 
			<input type ="text" class = "form-control" value = "${userLoginId}" id="loginIdInput">
			<div id = "lengthText" class ="d-none"><small class="text-danger">ID는 5자 이상으로 입력해주세요.</small></div>
			<div id="duplicateText" class="d-none"><small class="text-danger">중복된 ID 입니다</small></div>
			<div id="availableText" class="d-none"><small class="text-info">사용 가능한 ID 입니다.</small></div>
			
		
		<b>소개</b> 
		<input type ="text" class = "form-control" id="introduceInput">
		<button type="button" id ="submitBtn" class ="btn mt-3">제출</button>	 
	</div>
</div>


<script>

$(document).ready(function(){
	
	var IDDuplicate = false;
	$("#selectPic").on("click", function(){
		$("#fileInput").click(); 
	});
	
	$("#loginIdInput").on("propertychange change keyup paste input",function(){
		var loginId = $("#loginIdInput").val();
		
		
		if(loginId.length<=4){
			$("#lengthText").removeClass("d-none");
		}
		else{
			$("#lengthText").addClass("d-none");
		}
		

		if(loginId=="${userLoginId}"){
			$("#duplicateText").addClass("d-none");
			IDDuplicate = false;
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
	               		
	               		
	            },
	            error:function(e){
	                alert("에러 발생");
	            }
	        });
		
	})
	
	
	
	$("#submitBtn").on("click", function(){
		let fileExist = $("#fileInput").val();
		let userName = $("#userNameInput").val().trim();
		let loginId = $("#loginIdInput").val().trim();
		let introduce =  $("#introduceInput").val().trim();
		
		if(userName == "" && loginId == "" && introduce == "" && fileExist =="") {
			location.href="/post/list_view";
		}
		
		if(IDDuplicate == true){
			alert("아이디가 중복됐습니다.");
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