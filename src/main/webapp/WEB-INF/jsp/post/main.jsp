<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hyamstagram-main</title>


       <!-- bootstrap CDN link -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
            
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	

	  <!-- css -->
		
		<link rel = "stylesheet" href = "/static/css/post/style.css" type = "text/css">
	

</head>
<body>
<div id = "wrap">

	<header class ="bg-info row">
		<div id ="logo" class ="ml-3"><h1><i>hyamstagram</i></h1></div>
		<div id ="searchbar" class ="col-md-5 mx-5 d-flex" >
			<input type = "text" class ="form-control"><button type ="button" class="btn btn-lg btn-primary output col-5">검색</button>
		</div>
		<div class ="icon d-flex mt-2 float-right mr-0">
			<div id ="home"><img src ="/static/image/home.svg" width = 80px height = 50px></div>
			<div id ="Post"><img src ="/static/image/note.svg" width = 80px height = 50px></div>
			<div id ="profile"><img src ="/static/image/profile.svg" width = 80px height = 50px></div>
		</div>
	</header>
	<section class ="row bg-success">
		
			<section id ="post" class ="bg-secondary col-6">
			  <div></div>
			
			</section>
		
	</section>

</div>
</body>
</html>