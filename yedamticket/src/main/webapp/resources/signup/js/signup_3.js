// 리캡챠 및 submit버튼 확인
function check_recaptcha() {
	if ($("#idChk").val() == 'N') {
		alert('아이디 중복체크 하세요.');
		return false;
	}

	if (passCnum == 1) {
		alert("비밀번호를 확인해주세요.")
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

// id 중복확인
function fn_idChk() {
	var chk = 0;
	$.ajax({
		url: "idChk",
		type: "post",
		dataType: "json",
		data: {
			"Uid": $("#Uid").val()
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

// 비밀번호 확인		
function passConfirm() {
	var password = document.getElementById('pwd'); //비밀번호
	var passwordConfirm = document.getElementById('pwd2'); //비밀번호 확인 값
	var passwordConfirmClassName = $('#pwd2').attr('name');
	if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
		$('#pwd2').css("color", "greenyellow")
		passCnum = 0;
	} else {
		$('#pwd2').css("color", "#FE0A03")
		$('#pwd2').css("font-weight", "bold")
		passCnum = 1;
	}
}
