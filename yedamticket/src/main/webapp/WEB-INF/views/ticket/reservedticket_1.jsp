<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div align="center">
		<div class="card"  style="width: 20rem;">
			<div class="card-body">
				<p class="card-title" >공연 명 : ${name }</p>
				<p class="card-text" >예매번호 : ${PReservNo}</p>
				<p class="card-text">공연일정 : ${frDt }</p>
				<p class="card-text">좌석번호 : ${seatNo }</p>
				<p class="card-text">좌석구역 : ${loc }</p>
				<p class="card-text">가  격 : ${price }</p>
				<button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="거래를 예정중인 티켓입니다!">선택</button>
				<input type="button" onclick="selectedFnc2()" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal2" value="취소">
			</div>
		</div>
	</div>
</body>
</html>