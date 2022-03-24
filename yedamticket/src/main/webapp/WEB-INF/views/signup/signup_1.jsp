<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
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
<link href="resources/users/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="resources/users/assets/css/now-ui-kit.css?v=1.3.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="resources/users/assets/demo/demo.css" rel="stylesheet" />
</head>


</head>
<h1>회원가입</h1>
<form name="join" action="mailSending.do" method="post">
	<input type="text" name="id" required="required"> 
	@ 
	<input type="text" name="email" disabled>
	
	<!-- Hidden의 value값을 이용하여 값 삽입 -->	
	<input type="hidden" name="content" id="content" required="required">  
	<input type="hidden" name="subject" id="subject" required="required"> 
		<select name="email" onchange="email_change()">
			<option value="0">선택하세요</option>
			<option value="9">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="nate.com">nate.com</option>
			<option value="gmail.com">gmail.com</option>
		</select>
	<div>
		<input type="button" onclick="location.href='home.do'" value="홈으로" />
		<input type="submit" value="이메일 발송" /> <input type="reset" value="취소" />
	</div>

</form>
<div>
	<a href="businessmemberInsertForm">기업회원이십니까?</a>
</div>
</body>
<script type="text/javascript">
	function email_change() {
		if (document.join.email.options[document.join.email.selectedIndex].value == '0') {
			document.join.email2.disabled = true;
			document.join.email2.value = "";
		}
		if (document.join.email.options[document.join.email.selectedIndex].value == '9') {
			document.join.email2.disabled = false;
			document.join.email2.value = "";
			document.join.email2.focus();
		} else {
			document.join.email2.disabled = true;
			document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
		}
	}
	var subject = 'YDTICKET 회원가입 이메일 입니다.';
	document.getElementById('subject').value = subject;

	var content = 'http://localhost/prj/signup_3.do';
	document.getElementById('content').value = content;
	
</script>

</html>