<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- iamport.payment.js -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<h1>Pay Test!</h1>

	<button id="check_module" type="button">TESTBTN</button>

	<h2>아이디 : ${id }</h2>
	<h2>포인트 : ${point }</h2>

</body>
<script>
	$("#check_module").click(function() {
		var IMP = window.IMP // 생략가능
		IMP.init("imp08063906")
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg : "kakao",
			pay_method : "card",
			merchant_uid : "merchant_" + new Date().getTime(),

			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			name :"${point}원을 충전합니다",

			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			// amount: ${bid.b_bid},
			amount : "${point}",
			// 가격
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_name : "${id}",

		}, function(rsp) {
			console.log(rsp)
			if (rsp.success) {
				var msg = "결제가 완료되었습니다."
				msg += "결제 금액 : " + rsp.paid_amount
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = "결제에 실패하였습니다."
				msg += "에러내용 : " + rsp.error_msg
			}
			alert(msg)
		})
	})
</script>
</html>