<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sidebars/">
<!-- Bootstrap core CSS -->
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="./resources/users/css/sidebars.css" rel="stylesheet">
<style>
	aside, #divs {
		float: left;
	}
	
	aside{
		width: 30%;
	}
	
	#divs{
		width: 50%;
	}
	
	footer{
		clear:both;	
	 
	}
/* 	aside { 
  display: block;
} */
	
</style>
</head>
<body>



	<aside>
		<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
			<a href="#"
				class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<svg class="bi me-2" width="30" height="24">
					<use xlink:href="#bootstrap" /></svg> <span class="fs-5 fw-semibold">고객센터</span>
			</a>
			<ul class="list-unstyled ps-0">
				<li class="mb-1">
					<button class="btn  align-items-center rounded collapsed"
						data-bs-toggle="collapse">공지사항</button>
					<div class="collapse show" id="home-collapse"></div>
				</li>
				<li class="mb-1">
					<button class="btn  align-items-center rounded collapsed"
						data-bs-toggle="collapse">1:1문의</button>
					<div class="collapse" id="dashboard-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded">Overview</a></li>
							<li><a href="#" class="link-dark rounded">Weekly</a></li>
							<li><a href="#" class="link-dark rounded">Monthly</a></li>
							<li><a href="#" class="link-dark rounded">Annually</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button class="btn btn-toggle align-items-center rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#orders-collapse"
						aria-expanded="false">FAQ</button>
					<div class="collapse" id="orders-collapse">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#" class="link-dark rounded">New</a></li>
							<li><a href="#" class="link-dark rounded">Processed</a></li>
							<li><a href="#" class="link-dark rounded">Shipped</a></li>
							<li><a href="#" class="link-dark rounded">Returned</a></li>
						</ul>
					</div>
				</li>
				<li class="border-top my-3"></li>
				<li class="mb-1">
					<h4>고객센터</h4>
					<h4>전화상담</h4>
					<h5>1588-1588</h5> <span>평일 09:00~18:00</span><br> <span>토요일
						09:00~17:00</span><br> <span>일요일 공휴일 휴무</span>
				<li class="border-top my-3"></li>
			</ul>
		</div>
	</aside>
	
	<section id="divs">
		<article>
			<
		
		</article>
	</section>


	<script src="./resources/users/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/users/js/sidebars.js"></script>
</body>
</html>