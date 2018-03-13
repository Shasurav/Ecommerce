<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buyer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Tangerine">
<style>
  

.navbar{
	 position:fixed;
	 width:100%;
	
}
body{background-color: whitesmoke;}

.dropdown {
    position: relative;
    display: inline-block;  
}
.dropdown-menu {
    display: none;
    position: absolute;
    background-color: whitesmoke;
    color: black;
    width: 200px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    border-radius:20px 0 20px 0;
    padding: 12px 16px;
    z-index: 1;
    text-align:center;
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
   hr{border-width: 3px;
   margin-right: 30px;
   margin-left: 30px;
   } 
   .thumbnail a>img{height:300px;}
  #image{cursor:pointer;}   
  </style>
</head>
<body onload="myFunction();getdetails();" >
<%-- <%if(session == null|| session.getAttribute("user") == null){ --%>
<!-- //   	response.sendRedirect("signup-page.html");	  -->
<%--  %>  --%>


<nav class="navbar" style="z-index:999;">
  <div class="container-fluid">
  <div class="btn-group" style="margin-top:5px;padding: 10px 10px;">
  <div class="btn-group">
  <div class="dropdown">
  <button class="btn btn-default btn-md"style="background:transparent;border:transparent;"><img alt="user" id="image"style="width:30px;height:30px;border-radius:50%"></button>
  <div class="dropdown-menu">
    <img alt="user" id="userimage" style="width:150px;height:150px;border-radius:50%"><hr>
    <p id="username">User name</p><hr>
    <p id="email">email</p><hr>
    <p id ="mob">mobile</p><hr>
    <a href="useredit.jsp" style="color: black;">Edit</a>
  </div>
  </div>
  </div>
  <div class="dropdown">
 <a class="btn btn-default btn-md"style="background:transparent;border:transparent;"onmouseover="cart();"onclick="nextpage();"><i class="glyphicon glyphicon-shopping-cart" style="padding:3px;" ><span class="label label-default" id="cart"></span></i></a>
<div class="dropdown-menu" >
<p id="cartdropdown"></p>
</div>
</div>
</div>

 
    <form class="navbar-form navbar-right">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search"style="background:whitesmoke;" >
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit"style="background:whitesmoke;">
            <i class="glyphicon glyphicon-search"style="padding:3px;" ></i>
          </button>
        </div>
      </div>&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="logout"><button type="button" class="button type1" id="myBtn">Logout</button></a>&nbsp;&nbsp; 					
    </form>
  </div>
</nav>
<script type="text/javascript">
var img="";
function getdetails(){
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      var text = JSON.parse(this.responseText);
		  var name = text.FirstName;
		  var email = text.EmailId;
		  var mob = text.Mobile;
		  var img = text.user;
		  
		  document.getElementById("username").innerHTML=name;
		  document.getElementById("email").innerHTML=email;
		  document.getElementById("mob").innerHTML=mob;
 		  document.getElementById("image").src="user/"+"9ebb0fdf-1da6-4145-b793-da66f5842902"+".jpg"
 		 document.getElementById("userimage").src="user/"+"9ebb0fdf-1da6-4145-b793-da66f5842902"+".jpg"
  		 
	    }};
	    xhttp.open("GET", "data?user="+'<%=(String) session.getAttribute("user")%>', true);
	    xhttp.send();
}					 
</script> 			
<div class="container">

</div>
<div class="container-fluid" style="margin-top:80px;">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/watch.jpg" alt="watch" style="width:100%;height:700px">
     		<div class="carousel-caption">
        <h3>Watch</h3>
      </div>
	 </div>
      <div class="item">
        <img src="images/phone.jpg" alt="phone" style="width:100%; height:700px">
     		<div class="carousel-caption">
        <h3>Phones</h3>
      </div>
      </div>
      <div class="item">
        <img src="images/headphone.jpg" alt="headphone" style="width:100%;height:700px">
      		<div class="carousel-caption">
        <h3>Headphones</h3>
      </div>
      </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<div class="container" style="margin-top:200px;" id="thumbnail">
<div class="row">
   
    </div>
</div>

<script>
var image="";
var price="";
var detail="";
var array = new Array();
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
		      	 const id = text[i].Item; //Item_id
					
	var src="images/"+ imgsrc[0];
	var div = document.getElementById("thumbnail");
    var div2 = document.createElement("div");
    var att2 = document.createAttribute("class");
    att2.value ="col-md-4";
    div2.setAttributeNode(att2);
    var div3 = document.createElement("div");
    var att3 = document.createAttribute("class");
    att3.value ="thumbnail";
    div3.setAttributeNode(att3);
    var a = document.createElement("a");
    a.onclick = function (){
    	
    	url = 'item.jsp?' + id;
    
    	document.location.href = url;
    }
    a.setAttribute("id","image");
    var img = document.createElement("img")
    
    img.setAttribute("width","350px");
    img.setAttribute("src",src);
    var div4 = document.createElement("div");
    var att4 = document.createAttribute("class");
    att4.value ="caption";
    div4.setAttributeNode(att4);
    var btn = document.createElement("button");
    btn.setAttribute("type","button");
    btn.setAttribute("class","btn btn-info btn-lg");
    btn.innerHTML='Add to Cart';
    btn.setAttribute("value",id);
    btn.onclick = function  my(){var value = this.value;
    array.push(value);
    document.getElementById("cart").innerHTML = array.length;
    
	
    } ;
   
    var p = document.createElement("p");
    var t = document.createTextNode(id);
    var p1 = document.createElement("p");
    var t1 = document.createTextNode("Rs "+price+" /-");
    p1.appendChild(t1);
    p.appendChild(t);
    div4.appendChild(p);
    div4.appendChild(p1);
    a.appendChild(img);
    div3.appendChild(a);
    div3.appendChild(div4);
    div3.appendChild(btn);
    div2.appendChild(div3);
    div.appendChild(div2); 
		      }}};
xhttp.open("GET", "buyerStore", true);
xhttp.send();
}
function cart(){
	
	var text = "<ul>";
	for (i = 0; i < array.length; i++) {
	    text += "<li>" + array[i] + "</li>";
	}
	text += "</ul>";
		 document.getElementById("cartdropdown").innerHTML = text;	
}
function nextpage(){
	url = 'cart.jsp?' + array;
	document.location.href = url;
}

</script>


<hr>
<footer style="height:300px;">

<div id="mapholder" class="col-md-6" style="margin-bottom:50px;margin-left:10px;">
<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15556.096438931429!2d77.6094696!3d12.9061712!3m2!1i1024!2i768!4f13.
1!3m3!1m2!1s0x0%3A0xa8f9db94f2c59789!2sGanesh+Ashray!5e0!3m2!1sen!2sin!4v1495808585159" width="800" height="300" frameborder="0" style="border:0" allowfullscreen></iframe></div><br>
<h2 style="margin-left:1000px;margin-top:100px;color:black; font-family: 'Tangerine', serif;font-size:50px;">Mini-Flipkart</h2>
<p style="margin-left:1000px;color:black; font-family: 'Tangerine', serif;font-size:30px;">Address: 18th,Main Road<br>
29th,Lake Road.</p>

</footer>


</body>
</html>