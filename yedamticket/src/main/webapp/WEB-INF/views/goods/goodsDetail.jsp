<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<style>
* {
	list-style: none;
}

.swal-button--confirm {
	background-color: #ffb236;
}

.container {
	margin-top: 30px;
	margin-bottom: 150px;
}

#logo {
	text-align: center;
}

h2 {
	font-family: 'Gowun Dodum', sans-serif;
}

h3 {
	font-weight: bold;
	font-family: 'Gowun Dodum', sans-serif;
}

p {
	color: black;
	text-align: left;
	font-family: 'Gowun Dodum', sans-serif;
}

.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.starAvg {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star starAvg {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}

.starAvg span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}

#poster {
	width: 65%;
	box-sizing: content-box;
}

#reservBtn {
	margin-top: 18%
}

hr {
	height: 2.5px;
	background: #7a5ecf;
}

.table td, .table th {
	padding: 0.75rem;
	vertical-align: middle;
	border-bottom: 2px solid #dee2e6;
	border-top: 2px solid #7a5ecf;
}

textarea.form-control {
	max-width: 100%;
	max-height: 80px;
	padding: 10px 10px 0 50px;
	resize: none;
	border: none;
	border-bottom: 1px solid #E3E3E3;
	border-radius: 0;
	line-height: 1;
}
</style>

</head>

<body>
${goods }
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<br>
				<div id="logo">
					<img id="poster" src="${goods.fileCd }">
				</div>
			</div>
			<div class="col-lg-6">
				<br>
				<div id="detail">
					<h3> ${goods.name}</h3>
					<p>${goods.price }원</p>
					<form action="goodsPayForm.do" method="post">
						  <input type="hidden" name="GNo" value="${goods.GNo }"> 
						<input type="hidden" name="UId" value="enc1115"> 
						<button type="submit" class="btn btn-lg" style="background: #cfc5e9;">구매하기</button>												
					</form>
				</div>
			</div>
			<div class="col-lg-12" style="padding-top: 50px; text-align: center;">
				<hr>
				<h2>
					<ins>내용</ins>
				</h2>
				<br>
				<p style="text-align: center;">${goods.content }</p>
				<br>
				<hr>
			
				
			</div>

			
				
			</div>
		</div>



</body>

<script>




</script>
</html>
