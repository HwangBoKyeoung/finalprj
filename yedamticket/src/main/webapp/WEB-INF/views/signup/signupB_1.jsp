<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" sizes="76x76" href="./resources/users/img/apple-icon.png">
<link rel="icon" type="image/png" href="./resources/users/img/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<div class="section section-signup" style="background-image : url('./resources/users/img/bg8.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
	<div class="container">
		<div class="row">
			<div class="card card-signup" data-background-color="orange">
				<form class="form" name="join" action="mailSending2.do" method="post">
					<div class="card-header text-center">
						<h3 class="card-title title-up">기업회원 회원가입</h3>
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
			<a href="signup_1.do"
				class="btn btn-outline-default btn-round btn-white btn-lg"
				target="_blank">일반회원이십니까?</a> 
		</div>
	</div>
</div>
</head>
<script>

// select 태그에서 이메일 변경을 위한 함수
function email_change() {
	let em = document.getElementsByName("email")[0];
	let email = document.getElementsByName("email")[1];
	if (email.value == '0') {
		em.disabled = true;
	}
	if (email.value == '9') {
		em.disabled = false;
	} else {
		em.disabled = true;
	}
}

// 전송 버튼을 눌렀을 때 메일을 html 형식으로 보내는 함수
function btnFnc() {
	var all = "";
	var id = document.getElementsByName("id")[0].value;
	var mail = document.getElementsByName("email")[1].value;
	all = id + "@" + mail;
	
	var subject = "YD TICKET 기업회원전용 회원가입 이메일 입니다.";
	document.getElementById('subject').value = subject;

	var content = "<div align='center' style='border: 2px solid purple; width: 70%; height: 600px'>"
	content += "<p class='fontSizeUp' style='font-size:35px; text-align:center;'><b>이메일 인증 링크 전송</b></p><br>";
	content += "<p>안녕하세요. 공연 및 영화 예매와 티켓양도거래를 위한 서비스를 제공하는 YD TICKET입니다.</p>"
	content += "<p>저희 (주)예담티켓을 이용해 주셔서 진심으로 감사드립니다.</p>";
	content += "<p>회원가입을 계속 진행하시려면 아래 '메일인증' 버튼을 눌러 회원가입을 완료해 주세요.</p>";
	content += "<p>감사합니다.</p>";
	content += "<a style='text-decoration:none;color:navy;font-size:20px;font-weight:bold;' href='localhost/prj/signup_3.do'><button style='width:500px;height:70px' onclick='location.href='localhost/prj/signup_3.do''>메일인증</button></a><br>"
	content += "<p>본 메일은 발신전용이며, 문의에 대한 회신은 처리되지 않습니다.</p>";
	content += "<p>(주)예담티켓과 관련하여 궁금하신 점이나 불편한 사항은 언제든지 문의바랍니다.</p>"
	content += "<br>";
	content += "<hr>";
	content += "<br>";
	content += "<p>&copy;YEDAMTICKET Corp.All rights reserved</p>";
	content += "</div>"
	document.getElementById("content").value = content;
}
</script>
</html> 