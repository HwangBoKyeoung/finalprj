<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="apple-touch-icon" sizes="76x76" href="./resources/users/img/apple-icon.png">
<link rel="icon" type="image/png" href="./resources/users/img/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<link href="./resources/signup/css/signup.css" rel="stylesheet" /> 
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>

</head>
<body>
	<div id="signup_3" class="section section-signup">
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
								<input type="text" class="form-control" placeholder="이름" required="required" id="name" name="name" maxlength="8">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" placeholder="아이디" class="form-control" required="required" id="Uid" name="Uid" maxlength="10"/>
								<button type="button" class="idChk" id="idChk" value="N" onclick="fn_idChk(); ">중복체크</button>
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								<input type="password" class="form-control" placeholder="비밀번호" required="required" id="pwd" name="pwd" maxlength="10">
								
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								
								<input type="password" class="form-control" placeholder="비밀번호 확인" required="required" id="pwd2" name="pwd2" onkeyup="passConfirm()" maxlength="10">
							</div>
 
 
							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_email-85"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="이메일" value="${all }" readonly="readonly" id="email" name="email">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons location_pin"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="주소" required="required" id="addr" name="addr" maxlength="20">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons tech_mobile"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="연락처" required="required" id="phone" name="phone" maxlength="11" onkeyup="phoneConfirm()">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons business_badge"></i>
									</span>
								</div>
								<input type="date" class="form-control" placeholder="생년월일 ex)20000101" required="required" id="birthDt" name="birthDt" maxlength="8" onkeyup="birthConfirm()" max="2022-03-30">
							</div>

							<!-- CAPTCHA -->
							<div class="g-recaptcha"
								data-sitekey="6LfYlAwfAAAAACBsy1BXNVfkU1LhB6cYOzfPBAGN"></div>

						</div>

						<div class="card-footer text-center">
							<input type="submit" id="submit_input" class="btn btn-neutral btn-round btn-lg">
						</div>
					</form>
				</div>
			</div>
			<div class="col text-center">
				<a href="userLoginForm.do"
					class="btn btn-outline-default btn-round btn-white btn-lg"
					target="_blank">로그인 페이지로</a>
			</div>
		</div>
	</div>
</body>
</html>
