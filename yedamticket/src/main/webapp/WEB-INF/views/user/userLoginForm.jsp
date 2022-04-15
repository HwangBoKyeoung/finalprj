<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/user/userIdSearchModal.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>로그인</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- CSS Files -->
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/84d54512c7.js"
	crossorigin="anonymous"></script>
</head>
<style>
.loginBtn {
	border-radius: 30px;
}

.modal {
	z-index: 1;
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}

.modal_content {
	width: 482px;
	height: 537px;
	background: #020409;
	border-radius: 35px;
	position: relative;
	top: 25%;
	left: 43%;
	margin-top: -54px;
	margin-left: -115px;
	text-align: center;
	box-sizing: border-box;
	padding: 74px 0;
	line-height: 23px;
	cursor: pointer;
}
</style>

<body class="login-page sidebar-collapse">
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
		<div class="container">
			<div class="dropdown button-dropdown">
				<a href="#pablo" class="dropdown-toggle" id="navbarDropdown"
					data-toggle="dropdown"> <span class="button-bar"></span> <span
					class="button-bar"></span> <span class="button-bar"></span>
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-header">Dropdown header</a> <a
						class="dropdown-item" href="#">Action</a> <a class="dropdown-item"
						href="#">Another action</a> <a class="dropdown-item" href="#">Something
						else here</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Separated link</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">One more separated link</a>
				</div>
			</div>
			<div class="navbar-translate">
				<a class="navbar-brand"
					href="https://demos.creative-tim.com/now-ui-kit/index.html"
					rel="tooltip" title="Designed by Invision. Coded by Creative Tim"
					data-placement="bottom" target="_blank"> Now Ui Kit </a>
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar top-bar"></span> <span
						class="navbar-toggler-bar middle-bar"></span> <span
						class="navbar-toggler-bar bottom-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse justify-content-end"
				id="navigation"
				data-nav-image="resources/users/img/blurred-image-1.jpg">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="home.do">홈으로</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://github.com/creativetimofficial/now-ui-kit/issues">Have
							an issue?</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="Follow us on Twitter" data-placement="bottom"
						href="https://twitter.com/CreativeTim" target="_blank"> <i
							class="fab fa-twitter"></i>
							<p class="d-lg-none d-xl-none">Twitter</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="Like us on Facebook" data-placement="bottom"
						href="https://www.facebook.com/CreativeTim" target="_blank"> <i
							class="fab fa-facebook-square"></i>
							<p class="d-lg-none d-xl-none">Facebook</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="Follow us on Instagram" data-placement="bottom"
						href="https://www.instagram.com/CreativeTimOfficial"
						target="_blank"> <i class="fab fa-instagram"></i>
							<p class="d-lg-none d-xl-none">Instagram</p>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<div class="page-header ">
		<div class="page-header-image"
			style="background-image: url(resources/users/img/login2.jpg)"></div>
		<div class="content">
			<div class="container">
				<div class="col-md-4 ml-auto mr-auto">
					<div class="card card-login card-plain">
						<form class="form" action="userLogin.do" method="POST">
							<div class="card-header text-center">
								<div class="logo-container">
									<img src="resources/users/img/now-logo.png" alt="">
								</div>
							</div>
							<div class="card-body">
								<div class="input-group no-border input-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="now-ui-icons users_circle-08"></i>
										</span>
									</div>

									<input type="text" class="form-control" name = "UId" placeholder="Id...">

								</div>
								<div class="input-group no-border input-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="now-ui-icons objects_key-25"></i>
										</span>
									</div>
									<input type="password" placeholder="Password..." name="pwd"
										class="form-control" />
								</div>
								<br>
								<div class="card-footer text-center">
									<input type="submit"
										class="btn btn-primary btn-round btn-lg btn-block"
										value="LOGIN">
									<!-- <a href="userSelect.do" class="btn btn-primary btn-round btn-lg btn-block">Login</a> -->
								</div>
								<div class="card-footer text-center">
									<a
										href="https://kauth.kakao.com/oauth/authorize?client_id=876f8c44421d27c420bd6ffaab02bb68&redirect_uri=http://localhost/prj/kakaoLogin.do&response_type=code">

										<img src="resources/users/img/kakao_login_large_wide.png"
										class="loginBtn">
									</a>
								</div>
								<br>
								<div class="pull-left">
									<h6>
										<a href="signup_1.do" class="link">Create Account</a>
									</h6>
								</div>
								<div class="pull-right">
									<h6>
										<a href="companyLoginForm.do" class="link">기업회원이신가요?</a> <a
											href="managerLoginForm.do" class="link">관리자입니까?</a>
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
	<div class="modal">
		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			<div class="full">
				<div class="container">
					<div class="area_inputs wow fadeIn">
						<div class="sub_title font-weight-bold text-white">
							<h3>아이디/비밀번호 찾기</h3>
						</div>
						<div style="margin-bottom: 10px;"
							class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_1"
								name="search_total" onclick="search_check(1)" checked="checked">
							<label class="custom-control-label font-weight-bold text-white"
								for="search_1">아이디 찾기</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_2"
								name="search_total" onclick="search_check(2)"> <label
								class="custom-control-label font-weight-bold text-white"
								for="search_2">비밀번호 찾기</label>
						</div>
						<div id="searchI">
							<div class="form-group">
								<label class="font-weight-bold text-white " for="name">이름</label>
								<div>
									<input type="text" class="form-control" id="name" name="name"
										placeholder="ex)전호민">
								</div>
							</div>
							<div class="form-group">
								<label class="font-weight-bold text-white " for="phone">휴대폰번호</label>
								<div>
									<input type="text" class="form-control" id="phone" name="phone"
										placeholder="ex) 01012345678">
								</div>
							</div>
							<div class="form-group">
								<button id="searchBtn" type="button" onclick="idSearch_click()"
									class="btn btn-primary btn-block">확인</button>
								<a class="btn btn-danger btn-block" id="close">취소</a>
							</div>
						</div>
						<div id="searchP" style="display: none;">
							<div class="form-group">
							<form action="">
								<label class="font-weight-bold text-white " for="UId">아이디</label>
								<div>
									<input type="text" class="form-control" id="UId" name="UId"
										placeholder="ex) Id">
								</div>
							</form>
							</div> 
							<!-- <div class="form-group">
								<label class="font-weight-bold text-white " for="email">이메일</label>
								<div>
									<input type="email" class="form-control" id="email"
										name="email" placeholder="ex) E-mail@gmail.com">
								</div>
							</div> -->
							<div class="form-group">
								<button id="searchBtn2" type="button"
									class="btn btn-primary btn-block">확인</button>
								<a class="btn btn-danger btn-block" id="close">취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {

			$(".idPassword").click(function() {
				$(".modal").fadeIn();
			});

			$("#close").click(function() {
				$(".modal").fadeOut();
			});

		});

		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}

		// 아이디 & 스토어 값 저장하기 위한 변수
		var idV = "";
		// 아이디 값 받고 출력하는 ajax
		var idSearch_click = function() {
			$.ajax({
				type : "POST",
				url : "userSearch.do?name=" + $('#name').val() + "&phone="
						+ $('#phone').val(),
				success : function(data) {
					if (data == 0) {
						$('#id_value2').text("회원 정보를 다시 확인해주세요");
					} else {
						$('#id_value2').text(
								"회원님의 아이디는" + '\u00A0' + data + '\u00A0'
										+ "입니다");
						// 아이디값 별도로 저장
						idV = data;
					}
				}
			});
		}

		$(document).ready(function() {
			/////////모///달///기///능///////////
			// 1. 모달창 히든 불러오기
			$('#searchBtn').click(function() {
				$('#background_modal').show();
			});
			// 2. 모달창 닫기 버튼
			$('.close').on('click', function() {
				$('#background_modal').hide();
			});
			// 3. 모달창 위도우 클릭 시 닫기
			$(window).on('click', function() {
				if (event.target == $('#background_modal').get(0)) {
					$('#background_modal').hide();
				}
			});
		});
		
		// 비밀번호 찾기 눌렀을 때
		// 1 패스워드 찾기 창으로 이어진 후 2 패스워드 창에 아이디가 적힘
		// 3 모달창 종료
		$('#pwSearch_btn').click(function() {
			console.log(idV);

			// 1. 패스워드 찾기 창으로 이어지고
			$('#search_2').prop("checked", true);

			// 메서드 호출
			search_check(2);

			// 2.아이디  저장
			$('#UId').attr("value", idV);
			/* $('#store_id2').val(storeV).prop("selected", true); */

			// 마지막으로 모달창 종료
			$('#background_modal').hide();
		});

		
		$(function(){
			$("#searchBtn2").click(function(){

				$.ajax({
					url : "findpw.do",
					type : "POST",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data : {
						id : $("#UId").val()
					},
					success : function(result) {
						alert(result);
					},
				})
			});
		})
		/* // 비밀번호 찾기 이메일로 보내기
		$('#searchBtn2').click(function(){
			console.log("패스워드 찾기 : ajax 들어가기 전");
			console.log($('#UId').val());
			console.log($('#email').val());
			$.ajax({
				type : "get",
				url : "searchPassword.do",
				data:{
				UId : $('#UId').val(),
				email : $('#email').val()
				},
				success : function(data){
					console.log(data)
					alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");
				},
				error:function(xhr,status,error){
					console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
					alert(xhr.status);
				}
			});
		}); */

		
	</script>

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