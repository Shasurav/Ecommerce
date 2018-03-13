<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>seller</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Tangerine">
<style>
  
 .btn.btn-danger.btn-lg{
  	  margin-top:650px;
  	  margin-bottom: 5px;
  	  margin-left:1200px;
  	  
  	  position:fixed;
 }
 .image{
			height:200px;
			width:300px;
			} 
.navbar{
	 position:fixed;
	 width:100%;
	 
}

body{background-color:whitesmoke;}

.dropdown {
    position: relative;
    display: inline-block;  
}
.dropdown-menu {
    display: none;
    position: absolute;
    background-color: #2D3142;
    color:#EF8354;
    width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
    
}

.dropdown:hover .dropdown-menu {
    display: block;
    
}
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
  </style>
</head>
<body onload="myFunction();getdetails();" >
<%if(session == null|| session.getAttribute("user") == null){
	response.sendRedirect("signup-page.html");	
}%>



<nav class="navbar" style="z-index:999;">
  <div class="container-fluid">
  <div class="btn-group" style="margin-top:5px;padding: 10px 10px;">
  <div class="btn-group">
  <div class="dropdown">
  <button class="btn btn-default btn-md" style="background:whitesmoke;border:transparent;"><i class="glyphicon glyphicon-user" style="padding:3px;"></i></button>
  <div class="dropdown-menu">
    <p id="username">User name</p><hr>
    <p id="email">email</p><hr>
    <p id ="mob">mobile</p><hr>
    <a href="useredit.jsp" style="color:#EF8354;">Edit</a>
  </div>
  </div>
  </div>
 
 </div>
    <form class="navbar-form navbar-right">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search"style="background:whitesmoke;border:transparent;" >
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit" style="background:whitesmoke;">
            <i class="glyphicon glyphicon-search"style="padding:3px;" ></i>
          </button>
        </div>
      </div>&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="logout"><button type="button" class="button type1" id="myBtn">Logout</button></a>&nbsp;&nbsp; 
    </form>
   
  </div>
</nav>
<script type="text/javascript">
function getdetails(){
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      var text = JSON.parse(this.responseText);
		  var name = text.FirstName;
		  var email = text.EmailId;
		  var mob = text.Mobile;
		  document.getElementById("username").innerHTML=name;
		  document.getElementById("email").innerHTML=email;
		  document.getElementById("mob").innerHTML=mob;
	    }};
	    xhttp.open("GET", "data?user="+'<%=(String) session.getAttribute("user")%>', true);
	    xhttp.send();
}
</script>
<div class="container">
 <a href="SellerUpload.jsp"> <button type="button" class="btn btn-danger btn-lg" id="myBtn" style="border-radius:50%">
  <span class="glyphicon glyphicon-plus"></span></button> </a>
</div>


<div class="container" style="margin-top:100px; " >
<div class="row"  style="height:300px;"id="thumbnail">
   
    </div>
</div>

<script>
var image="";
var price="";
var detail="";
var quantity="";

function myFunction() {
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var text = JSON.parse(this.responseText);
		      for(i in text){
		    	  image = text[i].File;
		    	  var imagesrc = image.substring(1,image.length -1);
		    	var imgsrc= imagesrc.split(",");
		      	detail = text[i].Detail;
		      	price = text[i].Price;
				quantity=text[i].Quantity;
	var src="images/"+ imgsrc[i];
	var div = document.getElementById("thumbnail");
	
    var div2 = document.createElement("div");
    var att2 = document.createAttribute("class");
    att2.value ="col-md-4";
    div2.setAttribute("min-height","200");
    div2.setAttributeNode(att2);
    var div3 = document.createElement("div");
    var att3 = document.createAttribute("class");
    att3.value ="thumbnail";
    div3.setAttribute("height","200");
    div3.setAttributeNode(att3);
    
    var img = document.createElement("img")
    var image=document.createAttribute("class");
    image.value="image";
    img.setAttribute("src",src);
    img.setAttribute("height","100");
    
    var div4 = document.createElement("div");
    var att4 = document.createAttribute("class");
    att4.value ="caption";
    div4.setAttributeNode(att4);
    
    var p = document.createElement("p");
    var t = document.createTextNode(detail);
    var p1 = document.createElement("p");
    var t1 = document.createTextNode("Rs "+price+" /-");
    var p2 = document.createElement("p");
    p2.setAttribute("id","price");
    var t2 = document.createTextNode(quantity+" units");
    p2.appendChild(t2);
    p1.appendChild(t1);
    p.appendChild(t);
    div4.appendChild(p);
    div4.appendChild(p1);
    div4.appendChild(p2);
    div3.appendChild(img);
    div3.appendChild(div4);
    
    div2.appendChild(div3);
    div.appendChild(div2); 
		      }}};
xhttp.open("GET", "sellerStore?user="+'<%=(String) session.getAttribute("user")%>', true);
xhttp.send();
}
</script>


<hr>
<footer style="height:300px;">

<div id="mapholder" class="col-md-6" style="margin-bottom:50px;margin-left:10px;"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15556.096438931429!2d77.6094696!3d12.9061712!3m2!1i1024!2i768!4f13.
1!3m3!1m2!1s0x0%3A0xa8f9db94f2c59789!2sGanesh+Ashray!5e0!3m2!1sen!2sin!4v1495808585159" width="800" height="300" frameborder="0" style="border:0" allowfullscreen></iframe></div><br>
<h2 style="margin-left:1000px;margin-top:100px;color:black; font-family: 'Tangerine', serif;font-size:50px;">Mini-Flipkart</h2>
<p style="margin-left:1000px;color:black; font-family: 'Tangerine', serif;font-size:30px;">Address: 18th,Main Road<br>
29th,Lake Road.</p>

</footer>


</body>
</html>