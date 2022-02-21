<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hyamstagram - join</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/user/signup.css" type = "text/css">


<!-- font -->
	 
	 	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">	

</head>
<body>
<div id = "wrap">
	<section class ="d-flex justify-content-center">
		
			<div class ="form bg-dark">
			
				<h1 class = "mt-4 ml-4">�����ϱ�</h1>
			
			<hr>
			 <div class ="col-6">
				<input type = "text" placeholder= "ID" id = "loginIdInput" class ="form-control">
					<div id = "lengthText" class ="d-none"><small class="text-danger">ID�� 5�� �̻����� �Է����ּ���.</small></div>
					<div id="duplicateText" class="d-none"><small class="text-danger">�ߺ��� ID �Դϴ�</small></div>
					<div id="availableText" class="d-none"><small class="text-info">��� ������ ID �Դϴ�.</small></div>
				<input type = "password" placeholder= "��й�ȣ" id = "passwordInput" class ="form-control">
				<input type = "password" placeholder= "��й�ȣ Ȯ��"  id ="passwordConfirmInput" class ="form-control">
				<input type = "text" placeholder= "����� �̸�" id = "nameInput" class ="form-control">
				<button type ="button" id = "joinBtn" class ="btn mt-3">����</button>
				</div>
			</div>

	</section>	
	 	
</div>

<script>
$(document).ready(function(){
	var IDDuplicate = false;
	var checkID = false;
	
	$("#loginIdInput").on("propertychange change keyup paste input",function(){
		var loginId = $("#loginIdInput").val();
		
		if(loginId.length<=4){
			$("#lengthText").removeClass("d-none");
		}
		else{
			$("#lengthText").addClass("d-none");
		}
		
		 $.ajax({
	            url:'/user/idCheck', //Controller���� �ν��� �ּ�
	            type:'post', //POST ������� ����
	            data:{"loginId":loginId},
	            success:function(data){
	                if(data.is_duplication){
	                	$("#duplicateText").removeClass("d-none");
	                	 IDDuplicate = true;
	                	return;
	                }
	                else{
	                	$("#duplicateText").addClass("d-none");
	                	IDDuplicate = false;
	                }
	               		checkID = true;	
	            },
	            error:function(e){
	                alert("���� �߻�");
	            }
	        });
		
	})
	
	
	$("#joinBtn").on("click", function(){
		var loginId = $("#loginIdInput").val();
		var password = $("#passwordInput").val();
		var passwordConfirm = $("#passwordConfirmInput").val();
		var name = $("#nameInput").val();
		
		
		if(loginId == null || loginId == "") {
			alert("id�� �Է��ϼ���.");
			return;
		}
		
		if(loginId.length<=4){
			alert("id�� ���̴� 5�� �̻��� �Ǿ�� �մϴ�.");
			return;
		}
		
		if(IDDuplicate == true){
			alert("id�� �ߺ��Ǿ����ϴ�.");
			return;
		}
		if(password == null || password == "") {
			alert("��й�ȣ�� �Է��ϼ���.");
			return;
		}
		if(name == null || name == "") {
			alert("�̸��� �Է��ϼ���.");
			return;
		}
		if(password != passwordConfirm) {
			alert("��й�ȣ�� �ٽ� Ȯ�����ּ���.");
			return;
		}
		
		 
		  
	
		 $.ajax({
			 type:"post",
			 url:"/user/sign_up",
			 data:{"loginId":loginId, "password":password, "name":name},
			 success:function(data) {
					if(data.result == "success") {
						alert("ȸ������ ����");
						// �α��� ȭ������ �̵�
						location.href = "/user/signin_view";
						
					} else {
						alert("ȸ������ ����");
					}
				}, 
				error:function() {
					alert("���� �߻�");
				}
		 });
			
		
		
	});
});

</script>


</body>
</html>