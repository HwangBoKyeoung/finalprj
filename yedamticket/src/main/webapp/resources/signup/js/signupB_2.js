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
			"Cid": $("#Cid").val()
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
