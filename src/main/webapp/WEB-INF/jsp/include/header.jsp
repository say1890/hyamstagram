<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<header class ="bg-info d-flex">
		<div id ="logo" class ="ml-3"><h1><i>hyamstagram</i></h1></div>
		<div id ="searchbar" class ="col-md-5 mx-5 d-flex" >
			<input type = "text" class ="form-control">
			<button type ="button" class="btn btn-lg btn-primary output col-5">검색</button>
		</div>
		<div class ="icon d-flex mt-2 float-right mr-0">
		<c:if test="${not empty userName }">
			<div id = "name">${userId}님 
			<!--${userName}  --><a href="/user/sign_out">로그아웃</a> </div>
		</c:if>
			<div id ="home"><img src ="/static/image/home.svg" width = 80px height = 50px></div>
			<a href="/post/add_post_view" class ="btn" id ="postBtn" >
				<img src ="/static/image/note.svg" width = 80px height = 50px >
			</a>
			
			<div id ="profile"><img src ="/static/image/profile.svg" width = 80px height = 50px></div>
		</div>
	</header>
</body>
</html>