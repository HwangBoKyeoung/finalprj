<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn{
	display : block;	
	margin: auto;
	margin-bottom: 35px;
	margin-right: 73px;
}

.card {
	width: 300px;
	height: 450px;
	background: #000;
	overflow: hidden;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.5);
}

.card .poster {
	position: relative;
	overflow: hidden;
}

.card .poster:before {
  content: "";
  position: absolute;
  bottom: -200px;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(0deg, #000 50%, transparent);
  transition: 0.5s;
  z-index: 1;
}

.card:hover .poster:before {
	bottom: 0;
}

.card .poster img {
	width: 100%;
	transition: 0.5s;
}

.card:hover .poster img {
	filter: blur(5px);
	transform: translateY(-50px);
}

.details {
  position: absolute;
  padding: 20px;
  width: 100%;
  height: 78%;
  bottom: -200px;
  left: 0;
  box-sizing: border-box;
  transition: 0.5s;
  z-index: 2;
}

.card:hover .details {
	bottom: 0;
	height:120%;
	overflow: hidden;
  	text-overflow: ellipsis;
}

.details h2 {
	color: #fff;
	margin: 0;
	padding: 0;
	font-size: 20px;
}

.details h2 span {
	font-size: 14px;
	color: orange;
}

.rating {
	position: relative;
	padding: 5px 0;
}

.rating .fas, .rating .far {
	color: gold;
	margin-right: 2px;
	font-size: 16px;
}

.rating span {
	color: #fff;
	padding: 0 5px;
}

.tags {
	position: relative;
	margin-top: 5px;
}

.tags span {
	padding: 2px 5px;
	margin-right: 2px;
	color: #fff;
	display: inline-block;
	border-radius: 4px;
}

.info {
	mystery color: #fff;
}

.info p {
	font-size: 15px;
	margin: 77px 0 10px;
	color:white;
}

.cast {
	position: relative;
}

.cast h4 {
	margin: 0;
	padding: 0;
	font-size: 20px;
	color: yellow;
}

.cast ul li {
	list-style: none;
	width: 35px;
	height: 35px;
	background: #fff;
	border-radius: 50%;
	overflow: hidden;
	margin-right: 6px;
	border: 2px solid #fff;
}


.container{
	min-width: 1600px;
	max-width: 1900px;
}

.col-3{
	text-align-last: center;
}

#mname {
  width:300px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin : auto;
  margin-bottom : 20px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<%-- 	<table class="table">
		<thead>
			<tr>
				<th scope="col">제목</th>
				<th scope="col">배우</th>
				<th scope="col">줄거리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${searchName }" var="sN">
				<tr>
					<td>${sN.name}</td>
					<td>${sN.actor}</td>
					<td>${sN.content}</td>
				</tr>
				<tr>
					<td>${var.performanceVO.name}</td>
					<td>${var.performanceVO.actor}</td>
					<td>${var.performanceVO.content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> --%>

	<div class="container" >
	<div class="row">
			<c:forEach items="${searchName }" var="sN">
				<div class="col-3">
					<div class="card">
						<div class="poster">
							<img src="https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg">
						</div>
						<div class="details">
							<br> <br>
							<div class="info">
								<p>${sN.content}</p>
							</div>
						</div>
					</div>
					<p id="mname">sdaklzxcjklzxjklvdjklsfklvdjklsfklvdjklsfklvdjklsfklvdjklsfdklsa</p>
					<div>
					<button class="btn">예매</button> 
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>