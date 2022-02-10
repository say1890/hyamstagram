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
	
	<!-- font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	
</head>
<body>
	<div id = "wrap">
	 	<div class ="col-10 bg-primary ">
			<h1 class ="text-center">새 게시물 만들기</h1>
			<hr>
			<section class ="d-flex col-12 bg-light card shadow-lg border-0 rounded-lg">
			<div class ="row">
			 <div class ="col-6">
				<div class ="card-body">
					<!-- 파일 업로드 div -->
					<div id = "selectPic" class ="col-6 ml-5 mt-5">	
						<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="pink" class="bi bi-image  " viewBox="0 0 16 16">
	  					<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
	 				    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
						</svg>
							
					</div>	
				</div>  // card section end
				
				<input  multiple="multiple" type ="file" class="mt-5 form-control d-none" id="fileInput">
			 </div>	
				
				
				<!-- 글쓰기 div -->
				  <div class ="col-6">
					<div class ="card-body">
						<div id = "postSection" class ="bg-danger justify-content-center">
							<div>
								 <div class ="col-2 d-flex mt-3">
									 <img id ="profileImage"
									  src = "https://w.namu.la/s/43a3472858577498e23c3701af9afad33de29d4a6235e3a9e8442af0c61ea63a6a688e30777396471edc221e21671196cd0f9d8d1ea0ca3c970d7cbc45dae1ba4e82c9f0b4199882ace03d432167f521">
									 <h3 class ="ml-3 justify-content-center">${userName}</h3>
								 </div>
								 
								<div class ="mt-4" id="uploadImage" class ="bg-success col-5">
									
								</div>
								<textarea class="form-control mt-3" rows="5" id="contentInput" class ="form-control"></textarea>
								<hr>
								<div class ="row justify-content-between">
									<details class ="ml-3">
										<summary>고급 설정</summary>
										<span><input type="checkbox"> <label>댓글 기능 해제</label></span>
									</details>
									<button type = "button" id ="uploadBtn" class ="btn mr-3">업로드</button>
								</div>
						  </div>
						</div>
					</div>
					</div>
					</div> // row
			</section>
		</div>
	</div>
	
	
	
	<script>
	$(document).ready(function() {
		$("#selectPic").on("click", function(){
			$("#fileInput").click(); 
			
		});
		
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