<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
<title>Sidebar 02</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/users/css/style.css">
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
					<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>
				</button>
			</div>
			<div class="p-4 pt-5">
				<h1>
					<a href="index.html" class="logo">MyPage</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li>
						<h6>님은 회원 입니다</h6>
						<h6>포인트 원</h6>
						<br>
					</li>
					<li><a href="#">회원정보수정</a></li>
					<li><a href="#">공연예매내역</a></li>
					<li><a href="#">영화예매내역</a></li>
					<li><a href="#">티켓거래내역</a></li>
				</ul>
				<div class="mb-5">
					<h4 class="h6">고객센터</h4>
					<div class="form-group d-flex">
						<div class="icon">
							<span class="icon-paper-plane"></span>
						</div>

					</div>
				</div>
			</div>
		</nav>
		<div class="container">
		<span>예매내역</span><button class="btn-sm btn-primary">더보기</button>
		<div class="row">
			<div class="cols-12">
			<table class="table table-sm ">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Handle</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
		<div class="row">
			<div class="cols-12">
			<table class="table table-sm ">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Handle</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
			
			</div>
			
		<!-- 	<div class="container">
		<span>예매내역</span><button class="btn-sm btn-primary">더보기</button>
			<table class="table table-sm ">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Handle</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
				</tbody>
			</table>
			</div> -->



			<script type="text/javascript">
				$(".que").click(function() {
					$(this).next(".anw").stop().slideToggle(300);
					$(this).toggleClass('on').siblings().removeClass('on');
					$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
				});
			</script>
		</div>
		<script src="./resources/users/js/core/jquery.min.js"></script>
		<script src="./resources/users/js/core/popper.js"></script>
		<script src="./resources/users/js/core/bootstrap.min.js"></script>
		<script src="./resources/users/js/main.js"></script>
</body>

</html>