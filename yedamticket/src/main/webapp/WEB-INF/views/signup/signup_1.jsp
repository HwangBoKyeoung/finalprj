<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" sizes="76x76" href="./resources/users/img/apple-icon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="icon" type="image/png" href="./resources/users/img/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
*{
	list-style:none;
}
.card[data-background-color] {
    background-color: #301e4e ;
}
 
#id::placeholder{
	color:white;
}

#email::placeholder{
	color:white;
} 

</style>
</head>

<div class="section section-signup" style="background-image : url('./resources/users/img/ssp7_ab.jpg'); height: 100vh;background-repeat : no-repeat; background-size : cover;background-position: top center;">
	<div class="container">
		<div class="row">
			<div class="card card-signup" data-background-color="blue" style="padding-bottom: 10px;">
				<form class="form" name="join" action="mailSending.do" method="post" onsubmit="return btnFnc()">
					<div class="card-header text-center">
						<h3 class="card-title title-up" style="color:white;">회원가입</h3>
					</div>
					<div class="card-header text-center">
						<h4 class="card-title title-up" style="color:white;">이메일을 입력해주세요.</h4>
					</div>
					<div class="card-body">
						<div class="input-group no-border">
							<input type="text" id="id" name="id" class="form-control" placeholder="아이디" required="required" onkeyup="idcheck();" maxlength="13">
							<input type="text" id="email" name="email" class="form-control" placeholder="주소 (@ 생략)" style="color:white;">
							<input type="hidden" name="content" id="content" required="required">
							<input type="hidden" name="subject" id="subject" required="required">
						</div>
						<div class="form-group">
						<select class="form-control" id="selmail" name = "email" onchange="email_change()" style="color:white;">
							<option value="0" style="color : black">선택하세요</option>
							<option value="9" style="color : black">직접입력</option>
							<option value="naver.com" style="color : black">naver.com</option>
							<option value="nate.com" style="color : black">nate.com</option>
							<option value="gmail.com" style="color : black">gmail.com</option>
						</select>
						</div>
					</div>
					<div class="card-footer text-center">
						<input type="submit" id="submitBtn" class="btn btn-neutral btn-round btn-lg" style="color: black" value="이메일 발송"/>
						<input type="hidden" name = "all">
					</div>
					<a href="signupB_1.do" style="padding-left: 350px;">기업회원이십니까?</a> 
				</form>
			</div>
		</div>
		<div class="col text-center">
			
		</div>
	</div>
</div>

<script>
$("#submitBtn").attr("disabled", true)
$("#email").attr("disabled", true)
let chked = 0;
let chked2 = 0;


// 이메일 아이디 체크
function idcheck(){
	let id = $("#id").val()
	let selector = $("#selmail").val()
	let RegExp = /^[a-zA-Z0-9]{4,12}$/;
	
	if(! RegExp.test(id)){
		console.log("id조건 영어, 4자리이상 12자리이하.")
		$('#id').css("color", "#FE0A03");
		$('#id').css("font-weight", "bold");
		$("#submitBtn").attr("disabled", true);
		chked = 0;
	}else{
		console.log("정상적인 아이디입니다.");
		$('#id').css("color", "greenyellow");
		$("#submitBtn").attr("disabled", false);
		chked = 1;
		}
	console.log("idcheck() > chked : " + chked)
}
	

// select 태그에서 이메일 변경을 위한 함수
function email_change() {
	console.log("chked : " + chked)
	let id = $("#id").val()
	let selector = $("#selmail").val()
	
	console.log("selector : " + selector)
	
	// 이메일 if문 재설정
	if(selector == 0){
		$("#email").attr("disabled", true)
		$("#submitBtn").attr("disabled", true)
	} else if(selector == '9' && chked == 1){
		$("#email").val("");
		$("#email").attr("disabled", false);
		$("#email").attr("required", true);	
	} else if(selector == 'naver.com' && chked == 1){
		$("#email").attr("disabled", true)
		$("#email").attr("required", true)	
		$("#email").val("naver.com");
	} else if(selector == 'nate.com' && chked == 1){
		$("#email").attr("disabled", true)
		$("#email").attr("required", true)
		$("#email").val("nate.com");
	} else if(selector == 'gmail.com' && chked == 1){
		$("#email").attr("disabled", true)
		$("#email").attr("required", true)	
		$("#email").val("gmail.com");
	} else {
		$("#email").attr("disabled", true)
	}
}

//전송 버튼을 눌렀을 때 메일을 html 형식으로 보내는 함수
function btnFnc() {
	var all = "";
	var id = document.getElementsByName("id")[0].value;
	var mail = document.getElementsByName("email")[1].value;
	all = id + "@" + mail;
	if(mail == 0){
		alert("이메일을 입력해주세요.")
		return false;
	}
	
	if(all != null){
		var subject = "YD TICKET 회원가입 이메일 입니다.";
		document.getElementById('subject').value = subject;
		
		var content = "<div align='center' style='border: 2px solid purple; width: 70%; height: 600px'>"
		content += "<p class='fontSizeUp' style='font-size:35px; text-align:center;'><b>이메일 인증 링크 전송</b></p><br>";
		content += "<p>안녕하세요. 공연 및 영화 예매와 티켓양도거래를 위한 서비스를 제공하는 YD TICKET입니다.</p>"
		content += "<p>저희 (주)예담티켓을 이용해 주셔서 진심으로 감사드립니다.</p>";
		content += "<p>회원가입을 계속 진행하시려면 아래 '메일인증' 버튼을 눌러 회원가입을 완료해 주세요.</p>";
		content += "<p>감사합니다.</p>";
		content += "<a style='text-decoration:none;color:navy;font-size:20px;font-weight:bold;' href='http://3.39.54.67:8080/yedamticket/signup_3.do'><button style='width:500px;height:70px' onclick='location.href='http://3.39.54.67:8080/yedamticket/signup_3.do''>메일인증</button></a><br>"
		content += "<p>본 메일은 발신전용이며, 문의에 대한 회신은 처리되지 않습니다.</p>";
		content += "<p>(주)예담티켓과 관련하여 궁금하신 점이나 불편한 사항은 언제든지 문의바랍니다.</p>"
		content += "<br>";
		content += "<hr>";
		content += "<br>";
		content += "<p>&copy;YEDAMTICKET Corp.All rights reserved</p>";
		content += "</div>"
		document.getElementById("content").value = content;
		
		$("#submitBtn").attr("disabled", true)
	}else{
		alert("이메일을 확인해주세요")		
	}
}

</script>
</html> 