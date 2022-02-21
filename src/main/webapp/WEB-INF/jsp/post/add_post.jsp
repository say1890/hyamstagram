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
	 	<div class ="col-10 mx-auto">
			<h1 class ="text-center">새 게시물 만들기</h1>
			<hr>
			<section class ="d-flex col-12 bg-light card shadow-lg border-0 rounded-lg">
			<div class ="row">
			 <div class ="col-6">
				
					<!-- 파일 업로드 div -->
					<div id = "selectPic" class="col-12 row  justify-content-center align-items-center">	
						<svg xmlns="http://www.w3.org/2000/svg" width="400" height="400" fill="pink" class="bi bi-image  " viewBox="0 0 16 16">
	  					<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
	 				    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
						</svg>
							
				
				</div>  
				
				<input  multiple="multiple" type ="file" class="mt-5 form-control d-none" id="fileInput">
			 </div>	
				
				
				<!-- 글쓰기 div -->
				  <div class ="col-6">
				
						<div id = "postSection" class ="justify-content-center">
							<div>
								 <div class ="d-flex mt-5 col-9">
									 <img id ="profileImage"
									  src = "${imagePath}"
									  class = "mt-3 rounded-circle">
							     	<h3 class ="justify-content-center col-12 my-auto">${userName}</h3>
							     </div>
									 
								
								 
								<div class ="mt-4" class ="bg-success col-5">
									<img src ="https://t1.daumcdn.net/blogfile/fs6/8_blog_2007_06_15_09_00_4671d6b21acf8?x-content-disposition=inline&filename=%EB%AC%B4%EC%A0%9C-1.jpg" 
									id="uploadImage" >
									
								</div>
								<textarea class="form-control mt-3" rows="5" id="contentInput" class ="form-control"></textarea>
								<hr>
								<div class ="row justify-content-between">
									<details class ="ml-3">
										<summary>고급 설정</summary>
										<span><input type="checkbox" id="disallowComment"> <label>댓글 기능 해제</label></span>
									</details>
									<button type = "button" id ="uploadBtn" class ="btn mr-3">업로드</button>
								</div>
						  </div>
						</div>
					
					</div>
					</div> 
			</section>
		</div>
	</div>
	
	
	
	<script>
	$(document).ready(function() {
		$("#selectPic").on("click", function(){
			$("#fileInput").click(); 
			
		});
	
        
         $("#fileInput").on("change", function() {
        	setImageFromFile(this, '#uploadImage');
 
		});
         
        function setImageFromFile(input, expression) {
        	    if (input.files && input.files[0]) {
        	        var reader = new FileReader();
        	        reader.onload = function (e) {
        	            $(expression).attr('src', e.target.result);
        	        }
        	        reader.readAsDataURL(input.files[0]);
        	    }
        }
		
		$("#uploadBtn").on("click", function(){
			let commentSetting;
			if($('#disallowComment').is(':checked')){
				 commentSetting =  true; 
				 // 댓글 기능 해제시 true
			}
			else{
				commentSetting = false;
				// 댓글 기능 설정시 false
			}
			alert(commentSetting);
			
			let content = $("#contentInput").val().trim();
			if(content == "") {
				alert("내용을 입력하세요");
				return ;
			}
			var formData = new FormData();
			
			formData.append("content", content);
			formData.append("commentSetting", commentSetting);
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
			});  //ajax 끝
			
			
			
		}); // uploadbtn 끝
		
	});  // document 끝
	
	</script>
	
</body>
</html>