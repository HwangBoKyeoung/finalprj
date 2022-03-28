<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./resources/users/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="./resources/users/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>

</head>
<body>
	<div class="section section-signup"
		style="background-image: url('./resources/users/img/bg8.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
		<div class="container">
			<div class="row">
				<div class="card card-signup" data-background-color="black">
					<form class="form" method="POST" action="signup_4.do" onsubmit='return check_recaptcha();'>
						<div class="card-header text-center">
							<h3 class="card-title title-up">회원가입</h3>
							<div class="social-line">
								<img src="./resources/signup/yedamticket.png">
							</div>
						</div>
						<div class="card-body">
							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
									 <i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="이름" required="required" id="name" name="name">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" placeholder="아이디" class="form-control" required="required" id="Uid" name="Uid" />
								<button type="button" class="idChk" id="idChk" value="N" data-value="" onclick="fn_idChk(); ">중복체크</button>
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								<input type="password" class="form-control" placeholder="비밀번호" required="required" id="pwd" name="pwd">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								<input type="password" class="form-control" placeholder="비밀번호 확인" required="required" id="pwd2" name="pwd2" onkeyup="passConfirm()">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_email-85"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="이메일" value="${email }" readonly="readonly" id="email" name="email">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons location_pin"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="주소" required="required" id="addr" name="addr">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons tech_mobile"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="연락처" required="required" id="phone" name="phone">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons business_badge"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="생년월일(8자리로 입력)" required="required" id="birth" name="birth">
							</div>

							<!-- CAPTCHA -->
							<div class="g-recaptcha"
								data-sitekey="6LfYlAwfAAAAACBsy1BXNVfkU1LhB6cYOzfPBAGN"></div>

						</div>

						<div class="card-footer text-center">
							<input type="submit" id="submit_input"
								class="btn btn-neutral btn-round btn-lg">
						</div>
					</form>
				</div>
			</div>
			<div class="col text-center">
				<a href="login.do"
					class="btn btn-outline-default btn-round btn-white btn-lg"
					target="_blank">로그인 페이지로</a>
			</div>
		</div>
	</div>
	<script>
		function check_recaptcha() {

			if ($("#idChk").val() == 'N') {
				alert('아이디중복체크하세요');
				return false;
			}

			var v = grecaptcha.getResponse()
			if (v.length == 0) {
				alert("자동가입방지를 체크해주세요.")
				return false;
			} else {
				return true;
			}
		}

		function fn_idChk() {
			$.ajax({
				url : "idChk",
				type : "post",
				dataType : "json",
				data : {
					"Uid" : $("#Uid").val()
				},
				success : function(data) {
					if (data == 1) {
						console.log($("#idChk").val());
						alert("중복된 아이디 입니다..");
					} else if (data == 0) {
						$("#idChk").val('Y');
						alert("사용가능한 아이디 입니다.");
						console.log($("#idChk").val());
					} else {
						alert("아이디를 입력해주세요.");
					}
				}
			})
		}

		function passConfirm() {
			var password = document.getElementById('pwd'); //비밀번호 
			var passwordConfirm = document.getElementById('pwd2'); //비밀번호 확인 값
			var passwordConfirmClassName = $('#pwd2').attr('name');
			if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
				/* document.getElementById("pwd2").className = 'form-group has-success'; */
				$('#pwd2').attr("class", "form-group has-success")
			} else {
				/* document.getElementById("pwd2").className = 'form-group has-danger'; */
				$('#pwd2').attr("class", "form-group has-danger")
			}
		}
	</script>
</body>
</html>
