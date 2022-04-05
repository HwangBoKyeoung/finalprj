<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div id="pointdiv1" class="section section-signup" style="background-image: url('./resources/users/img/bg11.jpg'); background-size: cover; background-position: top center; min-height: 700px; padding-top: 0; display: flex; align-items: center; justify-content: center;">
		<div id="pointdiv2" style="width: 535px; height: 600px; padding: 1rem; margin: 1rem; float: left;"> 
			<div class="card card-signup" data-background-color="black" style="height:100%; width:100%;">
				<form id="form" action="userpage.do" method="POST">
					<div class="card-header text-center">
						<h3 class="card-title title-up">충전</h3>
					</div>
					<div class="card-header text-center">
						<input type="number" id="point" class="form-control" placeholder="금액을 입력해주세요." required="required" readonly="readonly" name="point" maxlength="7" onkeyup="maxPoint();" oninput="maxLengthChk(this);" 
						 style="background-color: gray; width: 80%; margin-left: auto; margin-right: auto; width: 80%;"/>
					    <input type="hidden" id="Uid" name="Uid" value="${sessionId}"/>
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
						<input type="button" id="payment" class="btn btn-neutral btn-round btn-lg" value="충전" onclick="pay();">
						<input type="reset" id="reset" class="btn btn-neutral btn-round btn-lg" onclick="resetPoint();" value="초기화">
					</div>
				</form>
			</div>
		</div>
	</div>
<script>
function pay(){
	var IMP = window.IMP // 생략가능
	var point = $('#point').val()
	IMP.init("imp08063906")
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	IMP.request_pay({
		pg: "kakao",
		pay_method: "card",
		merchant_uid: "merchant_" + new Date().getTime(),

		// 결제창에서 보여질 이름
		// name: '주문명 : ${auction.a_title}',
		name: "YD TICKET에서 " + point + " 원을 충전합니다",

		// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		// amount: ${bid.b_bid},
		amount: point,
		// 가격
		// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
		// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
		buyer_name: "${sessionId}",

	}, function(rsp) {
		console.log(rsp)
		if (rsp.success) {
			var msg = "결제가 완료되었습니다."
			msg += "결제 금액 : " + rsp.paid_amount
			// success.submit();
			// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
			// 자세한 설명은 구글링으로 보시는게 좋습니다.
			$("form").submit();
		} else {
			var msg = "결제에 실패하였습니다."
			msg += "에러내용 : " + rsp.error_msg
		}
		alert(msg)
	})
}

//세션아이디 값의 유무를 체크
/* function chkSessionId(){
	if($('#Uid').val() == ''){
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