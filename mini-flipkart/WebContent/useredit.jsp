<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Tangerine">
  <style type="text/css">
form{
	margin:100px 250px 200px;
	width:60%;
	 border:2px solid grey;
	 padding:60px;
	background-color:white;
	box-shadow: 20px 20px 60px 20px rgba(0,0,0,0.5);
	border-radius: 10px;
}
.navbar{
;
position:fixed;
width:100%;
}  
.thumbnail{
			height:100px;
			width:100px;
			display:inline;}
footer{
		height:150px;
		text-align:right}
body{background:whitesmoke;}		
  
  
  </style>
</head>
<body onload="detail();">
<%if(session == null|| session.getAttribute("user") == null){
	response.sendRedirect("signup-page.html");	
}%>
<nav class="navbar " style="z-index:999;" id="nav">
  <div class="container-fluid">
 <a href="" class="btn btn-default btn-lg" id="go"><i class="glyphicon glyphicon-home" ></i></a>
  <div class="navbar-form navbar-right">
  <a href="logout"><button type="button" class="btn btn-default " id="myBtn">Logout</button></a>
  </div>
  </div>
</nav>

<script type="text/javascript">
function detail(){
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      var text = this.responseText;
	      document.getElementById("go").href=text;
	    }};
	    xhttp.open("GET", "go?user="+'<%=(String) session.getAttribute("user")%>', true);
	    xhttp.send();
	
}
</script>


<div class="container" id="form">
<form action="edit">
                        
              
           
            <div class="form-group">
              <label>FirstName</label>
              <input type="text" class="form-control" id="firstname" name="firstname" placeholder="FirstName">
            </div>
            <div class="form-group">
              <label>LastName</label>
              <input type="text" class="form-control" id="item" name="lastname" placeholder="LastName">
            </div>
              <input type="hidden" name="user" value='<%=(String) session.getAttribute("user")%>'>
           <div class="form-group">
              <label>EmailID</label>
              <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
            </div>
		    <div class="form-group">
		    <label>Mobile</label>
		      <input type="number" class="form-control" id="mob" placeholder=" Number" name="mob">
		    </div>
		    <div class="form-group">
              <label>Address</label>
              <textarea  name="address" class="form-control" placeholder="address"></textarea>
            </div><br><br><br>
            <div class ="col-md-6">
              <button type="submit" class="btn btn-success btn-block">Submit</button>
				</div>
				<div class ="col-md-6">
              <button type="reset" class="btn btn-info btn-block" >Reset</button>
				</div>
            

</form>
</div>

<footer>
<br>
<h3 style="margin-right:100px;color:black; font-family: 'Tangerine', serif;font-size:50px;">Mini-Flipkart</h3>
<p style="margin-right:100px;color:black; font-family: 'Tangerine', serif;font-size:30px;">Address: 18th,Main Road<br>
29th,Lake Road.

</footer>
</body>
</html>