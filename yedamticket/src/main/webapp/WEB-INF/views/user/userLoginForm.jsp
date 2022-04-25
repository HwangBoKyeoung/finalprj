<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/user/userIdSearchModal.jsp"%>

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
	width: 548px;
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

.authCheck {
	background: transparent;
	border-bottom: 1px solild grey;
}

.modal_contents{
	margin-left: auto;
    margin-right: auto;
    margin-top: 10%;
}
</style>
</head>

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
							<div>
								<input type="button" class="btn-block btnLogin authCheck"
									style="border: 0px; width: 50%; margin-right: 0px; float: left; color: white; border-bottom: 3px solid #cfc5e9;"
									value="개인"> <input type="button"
									class="btn-block btnLogin authCheck"
									style="border: 0px; width: 50%; margin-right: 0px; color: white;"
									value="기업">
							</div>
						</div>
						<div id="personalLogin">
							<form class="form" action="userLogin.do" method="POST">
								<div class="card-body">
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="now-ui-icons users_circle-08"></i>
											</span>
										</div>
										<input type="text" class="form-control UId" name="UId"
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
										<a
											href="https://kauth.kakao.com/oauth/authorize?client_id=876f8c44421d27c420bd6ffaab02bb68&redirect_uri=http://3.39.54.67:8080/yedamticket/kakaoLogin.do&response_type=code">

											<img src="resources/users/img/kakao_login_large_wide.png"
											class="loginBtn">
										</a>
									</div>
									<br>
									<div class="pull-left">
										<h6>
											<a href="signup_1.do" class="link">회원가입</a><br>
										</h6>
									</div>
									<div class="pull-right">
										<h6>
											<a href="managerLoginForm.do" class="link">관리자입니까?</a>
										</h6>
									</div>
									<div class="">
										<h6>
											<a href="#" class="idPassword link">아이디/비밀번호 찾기</a>
										</h6>
									</div>
								</div>
							</form>
						</div>
						<div id="companyLogin">
							<form class="form" action="companyLogin.do" method="POST">
								<div class="card-body">
									<div class="input-group no-border input-lg">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="now-ui-icons users_circle-08"></i>
											</span>
										</div>
										<input type="text" class="form-control UId" name="CId"
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
											<a href="signup_1.do" class="link">회원가입</a>
										</h6>
									</div>
									<div class="pull-right">
										<h6>
											<a href="managerLoginForm.do" class="link">관리자입니까?</a>
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
							<div class="form-group">
								<label class="font-weight-bold text-white " for="email">이메일</label>
								<div>
									<input type="email" class="form-control" id="email"
										name="email" placeholder="ex) E-mail@gmail.com">
								</div>

							</div>

							<div class="form-group">
								<button id="searchBtn2" type="button"
									class="btn btn-primary btn-block">확인</button>
								<a class="btn btn-danger btn-block" id="close2">취소</a>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#companyLogin").hide();	
	
		$(".authCheck").on("click", function() {
			$(event.target).siblings().css({
				"border-bottom-width" : "0px"
			});
			$(event.target).css({
				"border-bottom-width" : "3px",
				"border-bottom-style" : "solid",
				"border-bottom-color" : "#cfc5e9"
			});

			console.log($(this).val());
			if ($(this).val() == '기업') {
				$("#companyLogin").show();
				$("#personalLogin").hide();
			} else if($(this).val()=='개인') {
				$("#personalLogin").show();
				$("#companyLogin").hide();
			}
		});

		$(function() {

			$(".idPassword").click(function() {
				$(".modal").fadeIn();
			});

			$("#close").click(function() {
				$(".modal").fadeOut();
			});
			$("#close2").click(function() {
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

		$(function() {
			$("#searchBtn2")
					.click(
							function() {
								$("#searchBtn2").attr('disabled', true)
								$
										.ajax({
											url : "findpw.do",
											type : "POST",
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											data : {
												id : $("#UId").val(),
												email : $('#email').val()
											},
											success : function(result) {
												alert(result)

											}

										})
							});
		})
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
