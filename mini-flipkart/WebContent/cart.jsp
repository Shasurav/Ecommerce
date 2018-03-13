<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart</title>
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
   hr {
    height: 1px;
    background-color:black;
    margin-top: 20px;
    margin-bottom: 20px;
    width: 75%;
} 
   footer{
		height:150px;
		text-align:right} 
 #image{margin-top:20px; 
 	height:200px; 
 	width:200px; 
 	margin-bottom:20px;	}
#icon{
margin:5px 5px 5px;}	
#buy{margin-right:10px;}
 #description{
 				margin-top:50px;
 				text-align:right;
 				font-size:20px;
 				margin-right:}	
 a{cursor:pointer;}					  
  </style>
</head>
<body onload="get();myFunction();">
<%-- <%if(session == null|| session.getAttribute("user") == null){ --%>
<!-- // 	response.sendRedirect("signup-page.html");	 -->
<%-- }%> --%>


<nav class="navbar" style="z-index:999;">
  <div class="container-fluid">
  <div class="btn-group" style="margin-top:5px;padding: 10px 10px;">
  <div class="btn-group">
  <div class="dropdown">
  <button class="btn btn-default btn-md"style="background:transparent;border:transparent;"><img alt="user" style="width:30px;height:30px;border-radius:50%"></button>
  <div class="dropdown-menu">
    <img alt="user" id="userimage" style="width:150px;height:150px;border-radius:50%"><hr>
    <p id="username">User name</p><hr>
    <p id="email">email</p><hr>
    <p id ="mob">mobile</p><hr>
    <a href="useredit.jsp" style="color: black;">Edit</a>
  </div>
  </div>
  </div>
</div>
    <form class="navbar-form navbar-right">
      <a href="logout"><button type="button" class="button type1" id="myBtn">Logout</button></a>&nbsp;&nbsp; 					
    </form>
</nav>
<div class="container">
<div class="container" style="width:80%; margin-top:100px;box-shadow: 5px 5px 40px 5px rgba(0,0,0,0.5);" id="contain">



</div>
</div>

<script type="text/javascript">
var id ="";
function get(){
    var url = document.location.search;
    var product = url.substring(1);
     id = product.split(",");}
    
    	function myFunction() {
    		var item_id = id;
    		for(i in item_id){
    		var xhttp = new XMLHttpRequest();
    		  xhttp.onreadystatechange = function() {
    		    if (this.readyState == 4 && this.status == 200) { 
    		    	var text = JSON.parse(this.responseText);
    			    	 var image = text.File;
    			    	  var imagesrc = image.substring(1,image.length -1);
    			    	var imgsrc= imagesrc.split(", ");
    			      	var detail = text.Detail;
    			        var price = text.Price;
    			      	const item_id = text.Item; //Item_id
    		
    		const src="images/"+ imgsrc[0];
     		 var contain = document.getElementById("contain");
     		var div2 = document.createElement("div");
     		var att2 = document.createAttribute("class");
     	    att2.value ="col-md-8";
     	    div2.setAttributeNode(att2);
     	  	 var a = document.createElement("a");
     	  	 a.onclick= function () {
     	    	url = 'item.jsp?' + item_id;
     	    	document.location.href = url;
     	    }
    		var img = document.createElement("img");
    	    img.setAttribute("src",src);
    	    img.setAttribute("id","image");
    	    var div4 = document.createElement("div");
     		var att4 = document.createAttribute("class");
     	    att4.value ="col-md-12";
     	    div4.setAttributeNode(att4);
    	    var div3 = document.createElement("div");
    	    var att3 = document.createAttribute("class");
     	    att3.value ="col-md-4";
     	    div3.setAttributeNode(att3);
    	    var p = document.createElement("p");
    	    p.setAttribute("id","description");
    	    var t = document.createTextNode("Description : "+detail);
    	    p.appendChild(t);
    	    var p1 = document.createElement("p");
    	    p1.setAttribute("id","description");
    	    var t1 = document.createTextNode("Price : "+ price);
    	    var btn = document.createElement("button");
    	    btn.setAttribute("type","button");
    	    btn.setAttribute("class","btn btn-info btn-lg");
    	    btn.setAttribute("id","buy");
    	    btn.innerHTML='Buy';
    	    btn.onclick = function () {
    	    	document.location.href = 'payment.jsp';
    	    };
    	    var btn1 = document.createElement("button");
    	    btn1.setAttribute("type","button");
    	    btn1.setAttribute("class","btn btn-danger btn-lg");
    	    btn1.innerHTML='Remove';
    	    btn1.onclick = function () {
    	    	item_id.splice(i,1);
    	    	location.reload;
    	    }
			var hr = document.createElement("HR");
    	    p.appendChild(t);
    	    p1.appendChild(t1);
    	    a.appendChild(img);
    	    div2.appendChild(a);
    	    div3.appendChild(p);
    	    div3.appendChild(p1);
    	    div3.appendChild(btn);
    	    div3.appendChild(btn1);
    	    contain.appendChild(div2);
    	    contain.appendChild(div3);
    	    contain.appendChild(hr);
    	   }};    		    	  
    		    xhttp.open("GET", "id?id="+item_id[i], true);
    		    xhttp.send();
    		  }}
  
</script>
<hr>
<footer>
<br>
<h3 style="margin-right:100px;color:black; font-family: 'Tangerine', serif;font-size:50px;">Mini-Flipkart</h3>
<p style="margin-right:100px;color:black; font-family: 'Tangerine', serif;font-size:30px;">Address: 18th,Main Road<br>
29th,Lake Road.

</footer>
</body>
</html>