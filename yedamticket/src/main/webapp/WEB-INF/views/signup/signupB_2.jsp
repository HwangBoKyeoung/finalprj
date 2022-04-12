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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>
	<div class="section section-signup" style="background-image: url('./resources/users/img/bg8.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
		<div class="container">
			<div class="row">
				<div class="card card-signup" data-background-color="black">
					<form class="form" method="POST" action="signupB_3.do" onsubmit='return check_recaptcha();'>
						<div class="card-header text-center">
							<h3 class="card-title title-up">기업회원가입</h3>
							<div class="social-line">
								<img src="./resources/yedamticket.png">
							</div>
						</div>
						<div class="card-body">
							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="기업명" required="required" id="name" name="name">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" placeholder="아이디" class="form-control" required="required" id="CId" name="CId" onkeyup="idbtnC();"/>
								<button type="button" class="cidChk" id="cidChk" value="N" onclick="fn_idChk()">중복체크</button>
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
								<input type="text" class="form-control" placeholder="연락처" required="required" id="phone" name="phone" onkeyup="phoneConfirm()">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons business_badge"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="사업자등록번호('-'기호 제거후 입력)" required="required" id="bizno" name="bizno">
								<button type="button" class="bizChk" id="bizChk" value="N" onclick="biznoConfirm()">중복체크</button>
							</div>

							<div class="input-group no-border">
								
								<p style="font-size: 13px; width : 100vw; margin : 0">개인 간 양도 / 양수 계약에 동의하십니까?</p>
								
								<div class="form-check form-check-radio">
									<label class="form-check-label"> 
										<input class="form-check-input" type="radio" name="dealAgreeCd" id="dealagreecd" value="Y"> 
											<span class="form-check-sign"></span> 
												<font color="white">예</font>
									</label>
								</div>

								<div class="form-check form-check-radio">
									<label class="form-check-label"> 
										<input class="form-check-input" type="radio" name="dealAgreeCd" id="dealagreecd" value="N" checked> 
											<span class="form-check-sign"></span> 
												<font color="white">아니오</font>
									</label>
								</div>
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
				<a href="login.do"
					class="btn btn-outline-default btn-round btn-white btn-lg"
					target="_blank">로그인 페이지로</a>
			</div>
		</div>
	</div>
	<script>
	// 리캡챠 및 submit버튼 확인
	function check_recaptcha() {
		if ($('#cidChk').val() == 'N') {
			alert('아이디 중복체크 하세요')
			return false;
		}

		if (passCnum == 1) {
			alert("비밀번호를 확인해주세요.")
			return false
		}

		if ($('#bizChk').val() == 'N') {
			alert('사업자 등록번호 중복체크 하세요.')
			return false
		}

		var v = grecaptcha.getResponse()
		if (v.length == 0) {
			alert("자동가입방지를 체크해주세요.")
			return false;
		} else {
			return true;
		}
	}

	// 아이디 중복확인
	function fn_idChk() {
		$.ajax({
			url: "cidChk",
			type: "post",
			dataType: "json",
			data: {
				"CId": $("#CId").val()
			},
			success: function(data) {
				if (data == 1) {
					$("#cidChk").val('N');
					alert("중복된 아이디 입니다..");
					idCnum = 1;
				} else if (data == 0) {
					$("#cidChk").val('Y');
					alert("사용가능한 아이디 입니다.");
					idCnum = 0;
				} else {
					alert("아이디를 입력해주세요.");
				}
			}
		})
	}

	// 시작 시 비활성화로 시작
	$('#idChk').attr("disabled", true)
	
	// id가 비어있을 때 중복확인 버튼 비활성화
	function idbtnC(){
		if($('#UId').val().length < 1){
			$('#idChk').attr("disabled", true)
		}else{
			$('#idChk').attr("disabled", false)
		}
	}
	
	// 휴대폰 번호 유효성 검사
	function phoneConfirm() {
		var phone = document.getElementById('phone').value;
		var regTel = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		if (!regTel.test(phone)) {
			console.log('올바른 전화번호를 입력하세요.');
			$('#phone').css("color", "#FE0A03");
			$('#phone').css("font-weight", "bold")
			phoneCnum = 1;
		} else {
			console.log('정상적인 전화번호입니다..!');
			$('#phone').css("color", "greenyellow")
			phoneCnum = 0;
		}
	}

	// 비밀번호 확인
	function passConfirm() {
		var password = document.getElementById('pwd'); //비밀번호 
		var passwordConfirm = document.getElementById('pwd2'); //비밀번호 확인 값
		var passwordConfirmClassName = $('#pwd2').attr('name');
		if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			$('#pwd2').css("color", "greenyellow")
			passCnum = 0;
		} else {
			$('#pwd2').css("color", "red")
			passCnum = 1;
		}
	}

	// 사업자등록번호 유효성 검사
	function biznoConfirm() {
		// 샘플용 사업자등록번호(카카오) : 5048600471 
		var bizno = $('#bizno').val()
		var data = {
			b_no: [bizno],
		}

		$.ajax({
			url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=N%2FyDCz6DnRrV45AM81yqvJ9T0C1jPO6x8V8bh1ZUPRwTHQg9C%2B3vOgc6%2FtZcvfaQAwypSKSxXNUW2cpmJBqoZA%3D%3D",
			type: "POST",
			data: JSON.stringify(data), // json 을 string으로 변환하여 전송
			dataType: "JSON",
			contentType: "application/json",
			accept: "application/json",
			success: function(result) {
				var bnum = result.data[0].b_stt_cd
				if (bnum == 1) {
					$('#bizChk').val("Y")
					alert("확인되었습니다.")

				} else {
					$('#bizChk').val("N")
					alert("존재하지 않는 사업자등록번호 정보입니다.")
				}
			},
			error: function(result) {
				console.log(result.responseText) //responseText의 에러메세지 확인
			},
		})
	}

	</script>
</body>
</html>
