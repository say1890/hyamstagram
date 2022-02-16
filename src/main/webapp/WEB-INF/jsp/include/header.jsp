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
				<div id ="logo-second-text">hyamstagram</div>
		</div>
		<div id ="searchbar" class ="col-md-5 mx-5 d-flex" >
			<input type = "text" class ="form-control">
			<button type ="button" class="btn btn-lg btn-primary output col-5">검색</button>
		</div>
		<div class ="id-flex mt-4 float-right mr-3">
		<c:if test="${not empty userName}">
			<div id = "name">${userName}님 
			<!--${userName}  --><a href="/user/sign_out">로그아웃</a> </div>
		</c:if>
		</div>
		
			<a href = "/post/list_view" class ="btn" id ="home">
				<i class="bi bi-house-door"></i>
			</a>
			<a href="/post/add_post_view" class ="btn" id ="postBtn" >
				<i class="bi bi-pencil-square"></i>
			</a>
			
			<a href = "/user/add_info_view" class ="btn" id ="profile">
				<i class="bi bi-person-circle"></i>
			</a>

	</header>
</body>
</html>