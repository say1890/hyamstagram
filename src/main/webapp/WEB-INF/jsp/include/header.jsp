<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" href = "/static/css/post/style.css" type = "text/css">
</head>

<body>
<header class ="d-flex">
		<div id ="logo" class ="ml-3">
			<h1><i>hyamstagram</i></h1>
		</div>
		<div id ="searchbar" class ="col-6 d-flex ml-5" >
			<input type = "text" class ="form-control" id ="searchInput" list ="SearchedWords">
			<datalist id = "SearchedWords">
			
				<option value="gor"/>
				<option value="gorilla"/>
			</datalist>
			<button type ="button" id="searchBtn" class="btn btn-lg btn-primary output col-2">검색</button>
		</div>
		<div class ="id-flex mt-2 float-right mr-3">
		<c:if test="${not empty userName}">
			<div id = "name">${userName}님 
				<a href="/user/sign_out">로그아웃</a> 
			</div>
		</c:if>
		</div>
		
			<a href = "/post/list_view" class ="btn" id ="home">
				<i class="bi bi-house-door"></i>
			</a>
			<a href="/post/add_post_view" class ="btn" id ="postBtn" >
				<i class="bi bi-pencil-square"></i>
			</a>
			
			<a href = "/user/Profile_view" class ="btn" id ="profile">
				<i class="bi bi-person-circle"></i>
		
			</a>
			

	</header>
	
	<script>
	$(document).ready(function(){
		
		
		$("#searchBtn").on("click",function(){
			var searchedWord = $("#searchInput").val();
			$.ajax({
				type:"get",
				url:"/post/SearchResult", 
				data:{"searchedWord":searchedWord},
				success:function(data) {
					location.href ="/post/SearchResult";
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