<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- star rating -->
	 <script src="https://jsuites.net/v4/jsuites.js"></script>
    <link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css" type="text/css" />
    <script src="https://jsuites.net/v4/jsuites.webcomponents.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#container {
	margin: 0 auto;
	width: 1200px;
}

head {
	width: 100%;
	height: 100px;
}

#logo {
	float: left;
	width: 300px;
	height: 300px;
}

#detail {
	float: right;
	width: 900px;
	height: 300px;
}

#slideShow {
	clear: both;
	width: 100%;
	height: 300px;
	overflow: hidden;
	position: relative;
}

#contents {
	width: 100%;
	height: 300px;
}

#tabMenu {
	float: left;
	width: 600px;
	height: 100%;
}

#links {
	float: right;
	width: 600px;
	height: 100%;
}

#logo>img {
	width: 300px;
	height: 300px;
}

</style>

</head>

<body>

	<div id="container">
		
			<div id="logo">
				<img id="poster">
			</div>
			<div id="detail">
				<h3>${movie.name }</h3>
				<hr>
				<p>감독:${movie.director }</p>
				<p>배우:${movie.actor }</p>
				<p>장르:${movie.genre }</p>
				<p>개봉:${movie.startDate }</p>
				<button class="btn btn-warning">예매하기</button>
			</div>
		
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-12">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block" id="img1"
								alt="First slide">
							<div class="carousel-caption d-none d-md-block">
							
							</div>
						</div>
						<div class="carousel-item">

							<img class="d-block" id="img2"
								alt="Second slide">

							<div class="carousel-caption d-none d-md-block">

								

							</div>

						</div>

						<div class="carousel-item">

							<img class="d-block" id="img3"
								alt="Third slide">

							<div class="carousel-caption d-none d-md-block">

								

							</div>

						</div>

					</div>

					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <i
						class="now-ui-icons arrows-1_minimal-left"></i>

					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <i
						class="now-ui-icons arrows-1_minimal-right"></i>

					</a>

				</div>

			</div>

		</div>

		<div id="contents">

			<div id="tabMenu">
				<iframe width="600" height="300" src="https://www.youtube.com/embed/qhKCYXSHpWY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<div id="links">
					<div id="comment">
						<form>

						 <jsuites-rating value="0" tooltip="Ugly, Bad, Average, Good, Outstanding"></jsuites-rating>
 
    					<input type="hidden" name="star" id="star">
						<label for="comment">Comments:</label>
						<textarea class="form-control" rows="5" id="content" name="content"></textarea>
						<button type="button" class="btn btn-warning" onclick="aJaxCall()">입력</button>
						</form>
					</div>
					<div id="reply">
						<c:if test="${empty replys }">
						<div>등록된 댓글이없어요</div>
						 <table class="table table-hover" id = "rtable" border = "1"></table>
						</c:if>
						<c:if test="${not empty replys }">
						<table class="table table-hover" id = "rtable" border = "1">
							<c:forEach items="${replys }" var="reply">
							
								<tr>
			                         <td width = "400">${reply.content }</td>
			                         <td> <jsuites-rating value=${reply.star }></jsuites-rating></td>
			                         <td width = "45 " align = "center">
			                            <button type="button" class="btn btn-primary" onclick="deleteReply(${reply.mvReNo})">삭제</button>
			                         </td>
                      			</tr>
							</c:forEach>
						</table>
						</c:if>
						 
					</div>
				</div>
			</div>
		</div>
</body>

<script>
//filecd가 여러개 잇는 값 자르기
	let fileCd="${movie.fileCd}";
	console.log(fileCd);
	let splitCd=fileCd.split('|');
	console.log(splitCd[0]);
	$('#poster').attr("src",splitCd[0]);
	$('#img1').attr("src",splitCd[1]);
	$('#img2').attr("src",splitCd[2]);
	$('#img3').attr("src",splitCd[3]);
//ratingstar
 document.querySelector('jsuites-rating').addEventListener('onchange', function(e) {
    document.getElementById('star').value = this.value;
}); 
function aJaxCall() {
    $.ajax({
       url : "movieReplyInsert.do",
       type : "post",
       data : {"Uid" : "test", "mvNo" : ${movie.mvNo},"content" : $("#content").val(),"star" : $("#star").val()},
       dataType : "text",
       success : function(data){
          htmlConvert(data);
       }
    });
 } 
 
function htmlConvert(data) {
    var button = "<button id = 'delete' onclick = 'deleteReply(" + data + " )'>삭제</button>";
    var tb = $("#rtable");
       var row = $("<tr />").append(
       $("<td width = '400'/>").text($("#content").val()),
       $("<td align = 'center' width = '70'/>").append(button) // 삭제버튼 넣어야 함
       
    );
    tb.append(row);
    $("#content").val(""); // input box 초기화
    $("#reply").append($("#rtable")); //화면에 추가
    location.reload();
 }
function deleteReply(n){ // 전달받은 replyId
   
    $.ajax({
       url : "movieReplyDelete.do",
       type : "post",
       data : {"mvReNo" : n},
       async : false, // 전역변수를 동기화해서 같이 사용
       dataType : "text",
       success : function(data) {
          if(data.length > 0){
             del = true;
          }
       }
    })
    if(del){
    $(event.target).parent().parent().remove();
    } else{
       alert(del + "삭제 실패.");
    }
     //event.target.parentElement.parenElement.remove();
 }
 

//슬라이더 미완성

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