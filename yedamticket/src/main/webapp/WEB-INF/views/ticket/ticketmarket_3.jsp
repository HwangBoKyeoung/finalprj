<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	*{
    list-style: none;
    }
    .hr-sect{
	color: #7a5ecf;
	text-align: left;
	margin-top: 50px;
	margin-bottom: 5px;
	font-family: 'Gowun Dodum', sans-serif;
	width: 1400px;
	font-size: 3.5em;
	}
</style>
</head>
<body>
<form id="chargeFrm" action="ticketmarket_4.do" method="POST">
<input type="hidden" id="PReservNo" name="PReservNo" value=${PReservNo }>
<input type="hidden" id="point" name="point" value=${point }>
<input type="hidden" id="price" name="price" value=${price }>
<input type="hidden" id="UId" name="UId" value=${UId }>
<input type="hidden" id="date" name="date" value=${date }>
<div class="container">
	<div align="center" style="margin-top: 30px; margin-bottom: 50px;">
	<h1 class="hr-sect">선택 티켓 확인</h1><hr>
		<div class="card" style="width: 20rem;">
			<div class="card-body">
				<p class="card-title" >공연 명 : ${name }</p>
				<p class="card-text" >예매번호 : ${PReservNo}</p>
				<p class="card-text">공연일정 : ${date }</p>
				<p class="card-text">좌석번호 : ${seatNo }</p>
				<p class="card-text">좌석구역 : ${loc }</p>
				<p class="card-text">가  격 : ${price }</p>
				<input type="button" class="btn btn-secondary" onclick="chargeChk();" value="결제">
				<input type="button" onclick="location.href='ticketmarket_1.do'" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal2" value="취소">
			</div>
		</div>
	</div>
</div>
</form>

	<script>
	var point = parseInt($("#point").val())
	var price = parseInt($("#price").val())
	
	function chargeChk(){
		 if(point - price < 0){
			var pointChk = confirm("잔액이 부족합니다. 포인트를 충전하시겠습니까?")
			if(pointChk == true){
				location.href="point_1.do"
			}else{
				location.href="userPage.do";
			}
		}else{
			$('#chargeFrm').submit();
		}
	}
		
	</script>
</body>
</html>