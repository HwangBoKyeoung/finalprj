<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" sizes="76x76" href="./resources/users/img/apple-icon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="image_src" href="./resources/users/img/bg11.jpg"/>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<link href="./resources/signup/css/signup.css" rel="stylesheet" />
<script src="./resources/signup/js/signup_1.js"></script>

</head>
<div id="signup1" class="section section-signup">
	<div class="container">
		<div class="row">
			<div class="card card-signup" data-background-color="orange">
				<form class="form" name="join" action="mailSending.do" method="post">
					<div class="card-header text-center">
						<h3 class="card-title title-up">회원가입</h3>
					</div>
					<div class="card-header text-center">
						<h4 class="card-title title-up">이메일을 입력해주세요.</h4>
					</div>
					<div class="card-body">
						<div class="input-group no-border">
							<input type="text" name = "id" class="form-control" placeholder="이메일" required="required">
							<input type="text" name = "email" class="form-control" placeholder="주소" disabled>
							<input type="hidden" name="content" id="content" required="required">
							<input type="hidden" name="subject" id="subject" required="required">
						</div>
						<div class="form-group">
						<select class="form-control" id="exampleFormControlSelect1" name = "email" onchange="email_change()">
							<option value="0" style="color : black">선택하세요</option>
							<option value="9" style="color : black">직접입력</option>
							<option value="naver.com" style="color : black">naver.com</option>
							<option value="nate.com" style="color : black">nate.com</option>
							<option value="gmail.com" style="color : black">gmail.com</option>
						</select>
						</div>
					</div>
					<div class="card-footer text-center">
						<input type="submit" class="btn btn-neutral btn-round btn-lg" value="이메일 발송" onclick="btnFnc()"/>
						<input type="hidden" name = "all">
					</div>
				</form>
			</div>
		</div>
		<div class="col text-center">
			<a href="signupB_1.do" class="btn btn-outline-default btn-round btn-white btn-lg" target="_blank">기업회원이십니까?</a> 
		</div>
	</div>
</div>
</head>
</html> 