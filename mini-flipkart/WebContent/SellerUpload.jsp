<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Tangerine">
  <style type="text/css">
form{
	
	width:60%;
	
	 padding:60px;
	
}
.navbar{

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
body{background-color:whitesmoke;}		
.button{
  position: relative;
  padding: 10px 10px;
  border: none;
  background-color: transparent;
  cursor: pointer;
  outline: none;
  font-size: 18px;
 }
  
  .button.type1{
    color: #566473;
    }
    .button.type1::after,
   .button.type1::before{
      content: '';
      display: block;
      position: absolute;
      width: 20%;
      height: 30%;
      border: 2px solid;
      transition: all 0.6s ease;
      border-radius: 2px;
}
    .button.type1::after{
      bottom: 0;
      right: 0;
      border-top-color: transparent;
      border-left-color: transparent;
      border-bottom-color: #566473;
      border-right-color: #566473;
}
    .button.type1::before{
      top: 0;
      left: 0;
      border-bottom-color: transparent;
      border-right-color: transparent;
      border-top-color: #566473;
      border-left-color: #566473;
}
    .button.type1:hover:after,
    .button.type1:hover:before{
      width: 110%;
      height: 110%;}  
form {
  width: 60%;
  margin: 20px auto;
  
}

fieldset {
  position: relative;
  border: none;  
}

label {
  position: absolute;  
  top: 18px;
  color: rgba(0, 0, 0, 0.3);
  transform-origin: left;
  transition: all 0.3s ease;
}

input:focus ~ label{
  color: red;  
}

input:focus ~ label,
input:valid ~ label {
  top: 0;
  transform: scale(0.9, 0.9);
}

input {
  font-size: 20px;  
  width: 100%;
  border: none;  
  margin-top: 10px;
  background-color:whitesmoke;
}

input:focus {
  outline: none;
}

.after {
  width: 100%;
  height: 2px;
  background: linear-gradient(to right, red 50%, transparent 50%);
  background-color: rgba(0, 0, 0, 0.3);
  background-size: 200% 100%;
  background-position: 100% 0;
  transition: all 0.6s ease;
}

input:focus ~ .after {
  background-position: 0 0;
}
  
  </style>
</head>
<body>
<%if(session == null|| session.getAttribute("user") == null){
	response.sendRedirect("signup-page.html");	
}%>
<nav class="navbar " style="z-index:999;" id="nav">
  <div class="container-fluid" >
 <a href="seller.jsp" class="btn btn-default btn-lg" style="margin-top:10px;"><i class="glyphicon glyphicon-home" ></i></a>
  
  <div class="navbar-form navbar-right">
  <a href="logout"><button type="button" class="button type1" id="myBtn">Logout</button></a>&nbsp;&nbsp;&nbsp;&nbsp; 
  </div></div>
</nav>


<form action="store" role="form" method="post" enctype="multipart/form-data" id="usrform">
    <input id="user" type="hidden" name="user" value='<%=(String) session.getAttribute("user")%>'>
    <fieldset>
      <input type="file" name="upload" id="file" style="color:rgba(0, 0, 0, 0.3);" multiple required>
      <div class="after"></div>
    </fieldset><br>
    <fieldset id="img"></fieldset>
    <fieldset>
      <input type="text" id="item" name="item" required>
      <label for="item">Product Name</label>
      <div class="after"></div>
    </fieldset><br>
    <fieldset>
      <input  type="text" name="Manufacturer" required>
      <label for="Manufacturer">Manufacturer</label>
      <div class="after"></div>
    </fieldset><br>
    <fieldset>
      <input  type="text" name="quantity" required>
      <label for="quantity">Quantity</label>
      <div class="after"></div>
    </fieldset><br>
    <fieldset>
      <input  type="text" name="price" required>
      <label for="price">Price</label>
      <div class="after"></div><br>
    </fieldset><br>
    <fieldset>
    <select name="years" class="form-control" style="background:whitesmoke;color:rgba(0, 0, 0, 0.5);">
				    <option value="0">years</option>
				    <option value="1">1</option>
				    <option value="3">2</option>
				    <option value="3">3</option>
				    <option value="4">4</option>
				    <option value="5">5</option>
				    <option value="6">6</option>
				    <option value="7">7</option>
				    <option value="8">8</option>
				  </select>
			  
    </fieldset><br>
    <fieldset>
      <textarea name="detail" class="form-control" placeholder="add details" style="background:whitesmoke;"></textarea>  
    </fieldset>
    <br><br><fieldset>
    <div class ="col-md-6">
      <button type="submit" class="btn btn-success btn-block">Submit</button>
      </div>
      <div class ="col-md-6">
              <button type="reset" class="btn btn-info btn-block" >Reset</button>
				</div>
    </fieldset>
    
  </form>

<script>
window.onload = function(){
    var filesInput = document.getElementById("file");
    filesInput.addEventListener("change", function(event){
        var files = event.target.files; 
        var output = document.getElementById("img");
        for(var i = 0; i< files.length; i++)
        {
            var file = files[i];
            var picReader = new FileReader();
            picReader.addEventListener("loadend",function(event){
                var image = new Image();
               	image.src = this.result;
               	image.setAttribute("class","thumbnail");
                output.appendChild(image);            
            });
            picReader.readAsDataURL(file);
        }                               
    });
}
</script>
<footer>
<br>
<h3 style="margin-right:100px;color:black; font-family: 'Tangerine', serif;font-size:50px;">Mini-Flipkart</h3>
<p style="margin-right:100px;color:black; font-family: 'Tangerine', serif;font-size:30px;">Address: 18th,Main Road<br>
29th,Lake Road.

</footer>
</body>
</html>