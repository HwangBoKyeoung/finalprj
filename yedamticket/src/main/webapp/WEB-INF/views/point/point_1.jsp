<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./resources/point/js/point_1.js"></script>
</head>
<body>
	<div id="pointdiv1" class="section section-signup" 
		style="
		background-image: url('./resources/users/img/bg11.jpg');
		background-size: cover;
		background-position: top center;
		min-height: 700px;
		padding-top: 0;
		display: flex;
		align-items: center;
		justify-content: center;">
		<div id="pointdiv2" style="width: 535px; height: 600px; padding: 1rem; margin: 1rem; float: left;"> 
			<div class="card card-signup" data-background-color="black" style="height:100%; width:100%;">
				<form id="frm" action="point_2.do" method="POST">
					<div class="card-header text-center">
						<h3 class="card-title title-up">충전</h3>
					</div>
					<div class="card-header text-center">
						<input type="number" id="point" class="form-control" placeholder="금액을 입력해주세요." required="required" readonly="readonly" name="point" maxlength="7" onkeyup="maxPoint();" oninput="maxLengthChk(this);" 
						 style="background-color: gray; width: 80%; margin-left: auto; margin-right: auto; width: 80%;"/>
					    <input type="hidden" id="id" name="id" value="${sessionId}"/>
							<button class="btn" type="button" onclick="fiveThousand();">+5천 원</button>
						    <button class="btn" type="button" onclick="tenThousand();">+1만 원</button>
						    <button class="btn" type="button" onclick="fiftyThousand();">+5만 원</button>
						    <button class="btn" type="button" onclick="oneHundredThousand();">+10만 원</button>
					</div>
					<div class="card-footer text-center">
						<img alt="kakaopay" src="./resources/kakaopay/payment_icon_yellow_large.png">
					</div>
					<div id="divfooter1" class="card-footer text-center" style="
						position: absolute;
						bottom: 11px;
						margin-right: auto;
						margin-left: auto;
						left: 0;
						right: 0;">
						<input type="submit" id="submit" class="btn btn-neutral btn-round btn-lg" value="충전">
						<input type="reset" id="reset" class="btn btn-neutral btn-round btn-lg" onclick="resetPoint();" value="초기화">
					</div>
				</form>
			</div>
		</div>
	</div>
<script>
//세션아이디 값의 유무를 체크

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
</script>
</body>
</html>