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
<link rel="icon" type="image/png" href="./resources/users/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!-- CSS Files -->
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
</head>

<div class="section section-signup"
	style="background-image: url('./resources/users/img/bg11.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
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
					</div>
				</form>
			</div>
		</div>
		<div class="col text-center">
			<a href="signupB_1.do"
				class="btn btn-outline-default btn-round btn-white btn-lg"
				target="_blank">기업회원이십니까?</a> 
		</div>
	</div>
</div>

</head>
<script src="resources/signup/main.js"></script>
<script type="text/javascript">
	function email_change(){
		let em = document.getElementsByName("email")[0];
		let email = document.getElementsByName("email")[1];
		if(email.value == '0'){
			em.disabled = true;
		}
		if(email.value == '9'){
			em.disabled = false;
		} else{
			em.disabled = true;
		}
	}
	
	function btnFnc(){
		var all = "";
		var id = document.getElementsByName("id")[0].value;
		var mail = document.getElementsByName("email")[1].value;
		all = id + "@" + mail;
		var subject = "YD TICKET 회원가입 이메일 입니다.";
		document.getElementById('subject').value = subject;
		
		var content = "안녕하세요 YD TICKET입니다. 회원가입을 계속 진행하시려면 아래 링크를 눌러주세요\n\n"; 
		content += "http://localhost/prj/signup_3.do?email=";
		content += all;
		document.getElementById("content").value = content;	
	}
</script> 
</html> 