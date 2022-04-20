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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="section section-signup" style="background-image : url('./resources/users/img/bg8.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
		<div class="container">
			<div class="row">
				<div class="card card-signup" data-background-color="black">
					<form class="form" method="POST" action="signup_4.do" onsubmit='return check_recaptcha();'>
						<div class="card-header text-center">
							<h3 class="card-title title-up">회원가입</h3>
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
								<input type="text" class="form-control" placeholder="이름" required="required" id="name" name="name" maxlength="8" onkeyup="nameConfirm()">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" placeholder="아이디" class="form-control" required="required" id="UId" name="UId" maxlength="10" onkeyup="idbtnC();"/>
								<button type="button" class="idChk" id="idChk" value="N" onclick="fn_idChk(); ">중복체크</button>
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								<input type="password" class="form-control" placeholder="비밀번호" required="required" id="pwd" name="pwd" maxlength="100" onkeyup="passConfirm1()">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								
								<input type="password" class="form-control" placeholder="비밀번호 확인" required="required" id="pwd2" name="pwd2" onkeyup="passConfirm2()" maxlength="100">
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
								<input type="text" class="form-control" placeholder="상세주소" required="required" id="addr2" name="addr2">
								<input type="hidden" id="sample6_extraAddress">
								<input type="hidden" id="sample6_postcode">
								<input type="button" id="AddrSample" onclick="findAddr();" value="주소찾기"> 
								<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>
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
								<input type="date" class="form-control" placeholder="생년월일" required="required" id="birthDt" name="birthDt" maxlength="8" onkeyup="birthConfirm()" max="2022-03-30">
							</div>

							<!-- CAPTCHA -->
							<div class="g-recaptcha" align="center" data-sitekey="6LfYlAwfAAAAACBsy1BXNVfkU1LhB6cYOzfPBAGN"></div>
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
	<script>
	// 주소찾기
    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
	
	// 리캡챠 및 submit버튼 확인
	function check_recaptcha() {
		if ($("#idChk").val() == 'N') {
			alert('아이디 중복체크 하세요.');
			return false;
		}

		if (nameCnum == 1){
			alert("이름을 확인해주세요.")
			return false;
		}
		
		if (uidCnum == 1){
			alert("아이디를 확인해주세요")
		}
		
		if (passCnum2 == 1) {
			alert("비밀번호를 확인해주세요.")
			return false
		}

		if (phoneCnum == 1){
			alert("전화번호를 확인해주세요.")
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

	// 시작 시 비활성화로 시작
	$('#idChk').attr("disabled", true)
	
	// id가 비어있을 때 중복확인 버튼 비활성화
	function idbtnC(){
		if($('#UId').val().length < 1){
			$('#idChk').attr("disabled", true)
		}else{
			$('#idChk').attr("disabled", false)
			idConfirm();
		}
	}
	
	function idConfirm(){
		var id = document.getElementById("UId").value;
		var RegExp = /^[a-zA-Z0-9]{4,12}$/;
		if(! RegExp.test(id)){
			console.log("올바른 아이디를 입력하세요.")
			$('#UId').css("color", "#FE0A03");
			$('#UId').css("font-weight", "bold")
			uidCnum = 1;
		}else{
			console.log("정상적인 이름입니다.")
			$('#UId').css("color", "greenyellow")
			uidCnum = 0;
		}
	}	
	
	// id 중복확인
	function fn_idChk() {
		var chk = 0;
		$.ajax({
			url: "idChk",
			type: "post",
			dataType: "json",
			data: {
				"UId": $("#UId").val()
			},
			success: function(data) {
				if (data == 1) {
					$("#idChk").val('N');
					alert("중복된 아이디 입니다..");
					idCnum = 1;
				} else if (data == 0) {
					$("#idChk").val('Y');
					alert("사용가능한 아이디 입니다.");
					idCnum = 0;
				} else {
					alert("아이디를 입력해주세요.");
				}
			}
		})
	}

	// 이름 유효성 검사
	function nameConfirm(){
		var name = document.getElementById("name").value;
		var n_RegExp = /^[가-힣]{2,15}$/; //이름 유효성검사 정규식
		if(! n_RegExp.test(name)){
			console.log("올바른 이름을 입력하세요.")
			$('#name').css("color", "#FE0A03");
			$('#name').css("font-weight", "bold")
			nameCnum = 1;
		}else{
			console.log("정상적인 이름입니다.")
			$('#name').css("color", "greenyellow")
			nameCnum = 0;
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

	// 생년월일 번호 유효성 검사
	function birthConfirm() {
		var birth = document.getElementById('birthDt').value;
		var regBirth = /^(19[0-9][0-9]|20[0-2][0-2])(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/

		if (!regBirth.test(birth)) {
			console.log('올바른 생년월일을 입력하세요.');
			$('#birthDt').css("color", "#FE0A03");
			$('#birthDt').css("font-weight", "bold")
			birthCnum = 1;
		}
		else {
			if (birth < 20220329) {
				console.log('정상적인 생년월일입니다..!');
				$('#birthDt').css("color", "greenyellow")
				birthCnum = 0;
			}
		}
	}

	// 비밀번호 유효성 검사
	function passConfirm1(){
		var pw = $("#pwd").val();
		var passCnum1 = 1
		var reg = /^(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		 
		if(false === reg.test(pw)) {
		$("#pwd").css("color", "#FE0A03")
		$('#pwd').css("font-weight", "bold")
		console.log('비밀번호는 8자 이상이어야 하며, 숫자/특수문자를 모두 포함해야 합니다.');
		}else if(/(\w)\1\1\1/.test(pw)){
			$("#pwd").css("color", "#FE0A03")
			passCnum1 = 1;
		 	console.log('같은 문자를 4번 이상 사용하실 수 없습니다.');
		 	return false;
		 }else if(pw.search(/\s/) != -1){
			 $("#pwd").css("color", "#FE0A03")
			 passCnum1 = 1;
		 	console.log("비밀번호는 공백 없이 입력해주세요.");
		 	return false;
		 }else if(hangulcheck.test(pw)){
			 $("#pwd").css("color", "#FE0A03")
			 passCnum1 = 1;
		 	console.log("비밀번호에 한글을 사용 할 수 없습니다."); 
		 }else {
		 	console.log("통과");
		 	$("#pwd").css("color", "greenyellow")
		 	passCnum1 = 0;
		 }
	}
	
	// 비밀번호 재 확인		
	function passConfirm2() {
		var password = document.getElementById('pwd'); //비밀번호
		var passwordConfirm = document.getElementById('pwd2'); //비밀번호 확인 값
		var passwordConfirmClassName = $('#pwd2').attr('name');
		if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			$('#pwd2').css("color", "greenyellow")
			passCnum2 = 0;
		} else {
			$('#pwd2').css("color", "#FE0A03")
			$('#pwd2').css("font-weight", "bold")
			passCnum2 = 1;
		}
	}
	</script>
</body>
</html>
