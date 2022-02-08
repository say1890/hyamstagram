<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hyamstagram-main</title>


       <!-- bootstrap CDN link -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	

	  <!-- css -->
		
		<link rel = "stylesheet" href = "/static/css/post/style.css" type = "text/css">
	
	 <!--  -->


</head>
<body>
<div id = "wrap" class ="container-fluid">

	<c:import url ="/WEB-INF/jsp/include/header.jsp" />
	<section class ="bg-success d-flex justify-content-center align-items-center">
		
			<section id ="post" class ="bg-light col-8 ">
			<c:forEach var="post" items="${postList}">
				
					  <div id = "userInfo" class ="d-flex mt-3">
							  	<div id = "profile" class = "bg-success">
							  		<img src = "https://file.mk.co.kr/meet/neds/2021/06/image_readtop_2021_535745_16226846584668330.jpg" width=100px;  class ="img-circle">
							  	</div>
							  	<div id = "UserName" class ="align-self-center ml-3 mr-5"><h2>${userName}</h2></div>
							    <button type ="button" id ="seeMoreBtn" class =" col-3 btn btn-primary float-right">더 보기</button>
					  </div>
					  
					  <hr>
					  <div class ="d-flex">
						  <button type="button" class="btn btn-default"> < </button>
						  <div id ="postPicture" class ="bg-secondary">
						  	<img src ="${post.post_imagePath}" width="200">
						  </div>
						   <button type="button" class="btn btn-default"> > </button>
					  </div>
					  
					  
					  <div id ="description">
						  	${post.post_content}
					  </div>
					  
					  <div class ="mt-5"></div>
					 
			</c:forEach>
			</section>
		
	</section>

</div>

<script>
	$(document).ready(function(){
		var desc =  $("#description").text();
		
		if(desc.length > 14){
			
			$(this).html(desc.slice(0, 14));
		}
		
		$("#postBtn").on("click", function(){
			
			$.ajax({
					
				
			}); // ajax end
		}); // btn end
		
	}); // document end

</script>

</body>
</html>