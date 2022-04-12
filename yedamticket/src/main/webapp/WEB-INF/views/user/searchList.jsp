<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btnn {
	display: block;
	margin: auto;
	margin-bottom: 35px;
	margin-right: 20px;
	padding: 0 50px;
	text-align: center;
	line-height: 34px;
	color: white;
	font-weight: 400;
	border-radius: 4px;
	font-family: fantasy;
	text-decoration: none;
	border: 1px solid #503396;
	vertical-align: middle;
	background-color: #fff;
	cursor: pointer;
	background-color: #503396;
}

.card {
	width: 280px;
	height: 390px;
	background: #000;
	overflow: hidden;
	
}

.card:hover .info {
  opacity: 0.9;
}


.info {
  position: absolute;
  padding:20px;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #0c0e0fed;
}

.pbox {
  	font-size: 15px;
	margin: 10px 0 10px;
	color: white;
	display: block;
    font-size: 16px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    line-height: 1.2;
    height: 8.4em;
    text-align: left;
    word-wrap: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 7;
    -webkit-box-orient: vertical;
}



.container {
	min-width: 1200px;
	max-width: 1400px;
}

.col-3 {
	margin-top: 100px;
	text-align-last: center;
}

#mname {
	width: 280px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	margin: auto;
	margin-bottom: 20px;
	font-weight:bold;
	font-family: fantasy;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

	<div class="container">
		<div class="row">
			<c:forEach items="${searchName }" var="sN">
				<div class="col-3">
					<div class="card">
						<div class="poster">
							<img
								src="https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg">
						</div>
						<div class="details">
							<br> <br>
							<div class="info">
								<p class="pbox">${sN.content}</p>
							</div>
						</div>
					</div>
					<p id="mname">${sN.name}</p>
					<div>
						<button class="btnn">예매</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${empty searchName }">
			<tr>
				<td>검색된 아이템이 없습니다.</td>
			</tr>
		</c:if>
	</div>
</body>
</html>