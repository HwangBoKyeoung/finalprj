<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./resources/users/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="./resources/users/img/favicon.png">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0"
	rel="stylesheet" />
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
.loginBtn {
	border-radius: 30px;
}
</style>

<body class="login-page sidebar-collapse">
	<!-- Navbar (부가적인 페이지이동 부분) -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
		<div class="collapse navbar-collapse justify-content-end"
			id="navigation"
			data-nav-image="resources/users/img/blurred-image-1.jpg">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="home.do">홈으로</a></li>
				<li class="nav-item"><a class="nav-link" href="faqList.do">문의사항이
						있으신가요?</a></li>
			</ul>
		</div>
		</div>
	</nav>
	<!-- End Navbar -->

	<div class="page-header"
		style="background-image: url('./resources/users/img/ssp7.jpg'); background-position: top center;">
		<div class="content">
			<div class="container">
				<div class="col-md-4 ml-auto mr-auto">
					<div class="card card-signup card-login card-plain"
						style="background: #301e4e;">
						<div class="card-header text-center">
							<h3 class="card-title title-up">로그인</h3>
							<div class="social-line" style="margin-bottom: 23px;">
								<img src="resources/users/img/YDTICKET_white.png" alt="">
							</div>
						</div>
						<div id="personalLogin">
							<form class="form" action="manaLogin.do" method="POST">
								<div class="card-body">
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="now-ui-icons users_circle-08"></i>
											</span>
										</div>
										<input type="text" class="form-control UId" name="MId"
											placeholder="Id...">
									</div>
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="now-ui-icons objects_key-25"></i>
											</span>
										</div>
										<input type="password" placeholder="Password..." name="pwd"
											class="form-control pwd" />
									</div>
									<div class="card-footer text-center">
										<input type="submit" class="btn-round btn btn-block btnLogin"
											style="background: #cfc5e9; border: 0px;" value="로그인"><br>
									</div>
									<br>
									<div class="pull-left">
										<h6>
											<a href="signup_1.do" class="link">회원가입</a><br>
										</h6>
									</div>
									<div class="pull-left">
										<h6>
											<a href="#" class="idPassword link">아이디/비밀번호 찾기</a>
										</h6>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--   Core JS Files   -->
	<script src="./resources/users/js/core/jquery.min.js"
		type="text/javascript"></script>
	<script src="./resources/users/js/core/popper.min.js"
		type="text/javascript"></script>
	<script src="./resources/users/js/core/bootstrap.min.js"
		type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="./resources/users/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="./resources/users/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
	<script src="./resources/users/js/plugins/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!--  Google Maps Plugin    -->
	<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
	<script src="./resources/users/js/now-ui-kit.js?v=1.3.0"
		type="text/javascript"></script>
</body>


</html>