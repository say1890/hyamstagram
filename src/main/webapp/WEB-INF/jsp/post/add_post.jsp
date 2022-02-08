<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

       <!-- bootstrap CDN link -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	  <!-- css -->
		
	<link rel = "stylesheet" href = "/static/css/post/style.css" type = "text/css">
	
</head>
<body>
	<div id = "wrap">
	 	<div class ="col-10 well well-lg bg-success ">
			<h1 class ="text-center">새 게시물 만들기</h1>
			<hr>
			<section class ="d-flex col-12 bg-light">
			
				<div id = "selectPic" class ="col-6">	
					<input type="file" class="mt-3" id="fileInput">
				</div>
				
				<div id = "postSection" class ="bg-danger col-6 justify-content-center">
				<div>
					 <div class ="col-2 d-flex">
					 <img id ="profileImage"
					  src = "https://w.namu.la/s/43a3472858577498e23c3701af9afad33de29d4a6235e3a9e8442af0c61ea63a6a688e30777396471edc221e21671196cd0f9d8d1ea0ca3c970d7cbc45dae1ba4e82c9f0b4199882ace03d432167f521">
					 <h3 class ="align-self-center">${userName}</h3>
					 </div>
					 
					<div class ="mt-4" id="uploadImage" class ="bg-success col-5">
						
					</div>
					<textarea class="form-control mt-3" rows="5" id="contentInput"></textarea>
					<hr>
					<details>
						<summary>고급 설정</summary>
						<span><input type="checkbox"> <label>댓글 기능 해제</label></span>
					</details>
				</div>
				<button type = "button" id ="uploadBtn">업로드</button>
				</div>
				
				
			</section>
		</div>
	</div>
	
	
	
	<script>
	$(document).ready(function() {
		$("#uploadBtn").on("click", function(){
			
			let content = $("#contentInput").val().trim();
			if(content == "") {
				alert("내용을 입력하세요");
				return ;
			}
			var formData = new FormData();
			
			formData.append("content", content);
			formData.append("file", $("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post",
				url:"/post/create",
				data:formData,
				enctype:"mutipart/form-data",  // 파일 업로드 필수
				processData:false, // 파일 업로드 필수
				contentType:false, // 파일 업로드 필수
				success:function(data) {
					if(data.result == "success") {
						location.href="/post/list_view";
					} else {
						alert("글쓰기 실패");
					}
				},
				error:function() {
					alert("에러발생");
				}
			});
			
			
			
		});
		
	});
	
	</script>
	
</body>
</html>