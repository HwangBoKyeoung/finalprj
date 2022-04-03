// 세션아이디 값의 유무를 체크

/* function chkSessionId(){
	if($('#id').val() == ''){
		alert("세션값이 없다!")
		return false;
	}else{			
		alert("현재 세션 값 : ${sessionId} , 결제 페이지로 이동합니다.")
		return true;
	}
} */


// 포인트 부분 변수 선언 후 시작할 때 제출 버튼 비 활성화
t1 = $("#point").val()
$("#submit").attr("disabled", true);

// t1의 값이 비어있을 때 버튼 비 활성화, 값이 들어갔을 때 활성화
function btnChk() {
	if (t1 !== '') {
		$("#submit").attr("disabled", false);
	} else {
		$("#submit").attr("disabled", true);
	}
}

// reset버튼을 눌렀을 시 t1값을 0으로 초기화 후 btnChk 실행(0으로 비교)	
function resetPoint() {
	t1 = 0;
	$("#point").val(t1)
	if (t1 !== 0) {
		$("#submit").attr("disabled", false);
	} else {
		$("#submit").attr("disabled", true);
	}
}

// 최대 입력가격 검사기능
function maxPoint() {
	if (t1 > 2000000) {
		alert("최대 입력가격은 200만 원 입니다.")
		t1 = 2000000
		$("#point").val(t1)
	}
}

// 최대 입력 글자수 제한(readonly 이후 필요성x)
function maxLengthChk(object) {
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength)
	}
}

// 5천원 추가
function fiveThousand() {
	if (t1 == "") {
		t1 = 5000
		$("#point").val(t1)
	} else {
		t1 = t1 + 5000
		maxPoint()
		$("#point").val(t1)
	}
	btnChk();
}

// 만원 추가
function tenThousand() {
	if (t1 == "") {
		t1 = 10000
		$("#point").val(t1)
	} else {
		t1 = t1 + 10000
		maxPoint()
		$("#point").val(t1)
	}
	btnChk();
}

// 5만원 추가
function fiftyThousand() {
	if (t1 == "") {
		t1 = 50000
		$("#point").val(t1)
	} else {
		t1 = t1 + 50000
		maxPoint()
		$("#point").val(t1)
	}
	btnChk();
}

// 10만원 추가
function oneHundredThousand() {
	if (t1 == "") {
		t1 = 100000
		$("#point").val(t1)
	} else {
		t1 = t1 + 100000
		maxPoint()
		$("#point").val(t1)
	}
	btnChk();
}
