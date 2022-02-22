<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		<!--  부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  
	 <!-- css -->
		
		<link rel = "stylesheet" href = "/static/css/post/style.css" type = "text/css">

	
	 <!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


</head>
<body>
<div id = "wrap">

	<c:import url ="/WEB-INF/jsp/include/header.jsp" />
	<section class ="d-flex mt-5 justify-content-center align-items-center moving-grad">
		
			<section id ="post" class ="mt-5 col-12 d-flex justify-content-center">
			<section class ="col-10">
	
			<c:forEach var="post" items="${postList}">
				
					  <div id = "userInfo" class ="d-flex mt-3 ">
							  	<div id = "profile" class ="img-wrapper">
							  		<img src = "${post.userProfile}" class = "rounded-circle">
							  	</div>
							  	<div id = "UserName" class ="align-self-center mr-5 ml-3">
							  		<b>${post.post.post_userName}</b>
							  		
							  	</div>
							    
							    <c:choose>
								    <c:when test="${userId eq post.post.post_userId}">
								    
								    <!-- see more btn -->
								    	<div class="dropdown d-flex justify-content-end col-9">
								    	<!-- Button trigger modal -->
											<button type="button" class="btn col-2 text-center" data-toggle="modal" data-target="#exampleModal"
											id ="moreBtn"  data-post-id="${post.post.post_id}">
											  ...
											</button>
								   <!-- see more btn -->      
									    
								    	</div> 
								    </c:when>
							    </c:choose>
							      
					  </div>
					  
					  <hr>
					  <div class ="d-flex">
						  <button type="button" class="btn btn-default"> </button>
						  <div id ="postPicture" class ="bg-secondary">
						  	<img src ="${post.post.post_imagePath}" width="200">
						  </div>
						   <button type="button" class="btn btn-default"> > </button>
					  </div>
					  
					  
					  <div id ="description">
					  
					  	${fn:substring(post.post.post_content, 0, 10)}
					  		<c:if test ="${fn:length(post.post.post_content)>10}">
					  		...
					  		<label id = "seeMore">
					  			<span data-desc-val="${post.post.post_content}" >더 보기</span>
					  		</label>
					  		</c:if>
					  
						  
					  </div>
					  
					  <!-- 좋아요 -->
					  <div class ="d-flex">
					  <a href ="#" class = "likeBtn "  data-post-id="${post.post.post_id}">
					  	<c:choose>
					  		<c:when test = "${post.like}">
					  			<i class="bi bi-heart-fill text-danger"></i>
					  		</c:when>
					  		
					  		<c:otherwise>
					  		
					  			<i class="bi bi-heart text-danger"></i>
					  		
					  		</c:otherwise>
					  	</c:choose>	
					 	</a>
						  <span class ="ml-3">${post.countLike}개</span>
  					  </div>
  					  <!-- 좋아요 -->
  					  
  					  
					  <!-- 댓글 입력창 -->
					  <c:choose>
					  	<c:when test = "${post.post.commentSetting}">
					  			
					  	</c:when>
					  	<c:otherwise>
					  		<div class ="row">
							  		<input type ="text" id ="commentInput${post.post.post_id}" class ="form-control col-6 ml-3">
							  		<button type="button" id = "commentBtn" class ="btn" data-post-id = "${post.post.post_id}">입력</button>
					  			</div>
					  
					  	</c:otherwise>
					  </c:choose>
					  
					  <!-- 댓글 입력창 끝 -->
					  
					  
					  <!-- 댓글 -->
					  <div class ="middle-size m-2">
					  	<c:forEach var = "comment" items="${post.commentList }">
					  	<div class ="mt-1 row">
					  		<b class = "mr-3">${comment.comment_userName}</b> ${comment.comment}
							    <c:choose>
								    <c:when test="${userId eq comment.comment_userId}">
								    	<a href ="#"  id = "deleteCommentBtn"  class ="ml-5 col-1"  data-comment-id ="${comment.comment_id}">
								    	 	<i class="bi bi-trash-fill"></i>
								    	</a>
								    	
								    </c:when>
							    </c:choose>
		
					  	</div>
					  	</c:forEach>
					  </div>
					  
					  <!-- 댓글 -->
					  <div class ="mt-5"></div>
					 
			</c:forEach>
			</section>
		</section> <!-- post section end -->
	</section>
			
			


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body text-center">
       <a href ="#" id ="deleteBtn">삭제하기</a>
       <hr>
       <a href = "/post/edit" id = "editBtn">수정하기</a>
      </div>
    </div>
  </div>
</div>
	

	

</div>

<script>
	$(document).ready(function(){
		let postId = $(this).data("post-id");
		$.ajax({
			type:"get",
			url:"/post/list_view", 
			data:{"postId":postId},
			success:function(data) {
				  
			},
			error:function() {
				alert("에러발생");
			}
			
		}); // ajax end
		
		$("#seeMore").on("click", function(){
			let desc = $(this).data("desc-val");
			alert(desc);
			
			
		});
		
		
		
		
		$("#commentBtn").on("click", function(){
		
			// postId, content
			let postId = $(this).data("post-id");
			let content = $("#commentInput" + postId).val();
			
			$.ajax({
					type: "post",
					url: "/post/comment/create",
					data:{"postId":postId,
					"content":content	
					},
					success:function(data){
						if(data.result == "success"){
							location.reload();
						}
						else{
							alert("댓글 작성 실패");
						}
					}
			});
			
			
		});
		
		
		
		$(".likeBtn").on("click", function(e){
			e.preventDefault();
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get",
				url:"/post/like", 
				data:{"postId":postId},
				success:function(data) {
					if(data==1) {
						
						location.reload();
					} else {
						location.reload();
					}
				},
				error:function() {
					alert("에러발생");
				}
				
			}); // heart  ajax end
		}); // btn end
		
		
		var seeMorePostId;
		
		$("#moreBtn").on("click",function(e){
			let postId = $(this).data("post-id");
			seeMorePostId = postId;
			
		})
		
		
		$("#deleteBtn").on("click", function(e){
			e.preventDefault();
			
			//let postId = $(this).data("post-id");
			let postId =seeMorePostId;
			$.ajax({
				type:"get",
				url:"/post/delete", 
				data:{"postId":postId},
				success:function(data) {
					if(data.result=="success") {
						alert("삭제 성공");
						location.reload();
					} else {
						alert("삭제 실패");
					}
				},
				error:function() {
					alert("에러발생");
				}
			});// delte ajax end
			
		});// delete btn end 
			
			
		$("#deleteCommentBtn").on("click", function(e){
				
				e.preventDefault();
				let CommentId = $(this).data("comment-id");
				$.ajax({
					type:"get",
					url:"/post/comment/delete", 
					data:{"CommentId":CommentId},
					success:function(data) {
						if(data.result=="success") {
							alert("삭제 성공");
							location.reload();
						} else {
							alert("삭제 실패");
						}
					},
					error:function() {
						alert("에러발생");
					}
					
				}); // ajax end
			});
			
		
		
		
	}); // document end

</script>

</body>
</html>