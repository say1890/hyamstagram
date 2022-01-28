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
<c:when test="${not empty userId}">
	<div class="mr-3">${userName}님 <a href="/user/sign_out">로그아웃</a></div>	
</c:when>
</body>
</html>