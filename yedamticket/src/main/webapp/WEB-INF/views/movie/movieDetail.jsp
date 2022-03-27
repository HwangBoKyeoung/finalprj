<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
*{
    margin:0;
    padding:0;
    box-sizing: border-box;
}
#container{
    margin:0 auto;
    width: 1200px;
}
head{
    width: 100%;
    height: 100px;
    background-color: blue;
}
#logo{
    float:left;
    width: 300px;
    height: 300px;
    background-color: indigo;
}
#detail{
    float: right;
    width: 900px;
    height: 300px;
    background-color: green;
}
#slideShow{
    clear: both;
    width: 100%;
    height: 300px;
 
    overflow: hidden;
    position:relative;
}

#contents{
    width: 100%;
    height: 300px;
}
#tabMenu{
    float: left;
    width: 600px;
    height: 100%;
    background-color: violet;
}
#links{
    float: right;
    width: 600px;
    height: 100%;
    background-color: skyblue;
}
footer{
    width: 100%;
    height: 100px;
    background-color: gray;
}
#logo > img{
	width: 300px;
    height: 300px;
}
/*
#slides{
	position:absolute;
}
#slides > img{
	width:100%;
	float:left;
}
button{
	position:absolute;
	height: 100%;
	top:0;
	border:none;
	padding:20px;
	background-color:transparent;
	color:#000;
	font-weight: 800;
	font-size: 24px;
	opacity: 0.5;
}
#prev{
	left:0;
}
#right{
	right: 0;
}
button:hover{
	background-color: #222;
	color:#fff;
	opacity: 0.6;
	cursor: pointer;
}
button:focus{
	outline:0;
}
*/
.mySlides {display:none;}
</style>
</head>
<body>
 <div id="container">
        <header>
            <div id="logo">
				<img src="resources/users/img/poster1.png">
            </div>
            <div id="detail">
				<h3>영화제목</h3>
				<hr>
				<p>감독</p>
				<p>장르</p>
				<p>개봉</p>
				<button class="btn btn-warning">예매하기</button>
            </div>
        </header>
        
			<div class="content">
				<img class="mySlides" src="resources/users/img/slider1.jpg">
				<img class="mySlides" src="resources/users/img/slider2.jpg">
				<img class="mySlides" src="resources/users/img/slider3.jpg">
				<button class="w3-button w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
				<button class="w3-button w3-display-right" onclick="plusDivs(+1)">&#10095;</button>
        </div>
        <div id="contents">
            <div id="tabMenu">
				<iframe width="600" height="90%" src="https://www.youtube.com/embed/fBniKuAoe8Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		
            </div>
            <div id="links">
                
            </div>
        </div>
      <footer>
      
      </footer>
    </div>
</body>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
</html>