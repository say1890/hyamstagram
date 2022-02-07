<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id = "wrap">
	 	<div>
			<div>새 게시물 만들기</div>
			<hr>
			<section class ="d-flex">
				<div id = "selectPic">		
				<button>컴퓨터에서 선택</button>
				</div>
				
				<div id = "postSection">
				<div>
					<div>프로필 이미지 들어갈 부분</div>
					<div>${username}</div>
				</div>
				
				</div>
				
				
			</section>
		</div>
	</div>
</body>
</html>