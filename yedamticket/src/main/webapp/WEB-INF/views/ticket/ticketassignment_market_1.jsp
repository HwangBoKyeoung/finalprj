<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<h1>자유 시장에 올리기</h1>
<input id="sessionId" type="hidden" value="${sessionId }">

<form action="ticketassignment_market_2.do" method="post">
<input id="ownerAddr" name="ownerAddr" type="hidden">
	<div align="left">
		<div class="card" style="width: 40rem;">
			<div class="card-body">
				<p class="card-text">예약번호 : ${PReservNo }</p>
				<input id="PReservNo" type="hidden" name="PReservNo">
				
				<p class="card-text">공연명 : ${name }</p>
				<input id="name" type="hidden" name="name">
				
				<p class="card-text">공연일정 : ${date }</p>
				<input id="date" type="hidden" name="date">
				<input id="today" type="hidden" name="today">				
				
				<p class="card-text">좌석번호 : ${seatNo }</p>
				<input id="seatNo" type="hidden" name="seatNo">
				
				<p class="card-text">좌석구역 : ${loc }</p>
				<input id="loc" type="hidden" name="loc">
				
				<p class="card-text">가 격 : ${price }</p>
				<input id="price" type="hidden" name="price">
				
				<input id="inpBtn" type="submit" class="btn btn-primary" value="확인">
				<input type="button" class="btn btn-danger" onclick="location.href='ticketassignment_1.do'" value="취소">
			</div>
		</div>
	</div>
</form>
	<script>
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '/' + month  + '/' + day;
	
	var PReservNo = $(".card-text")[0].innerText.substr(7);
	var name = $(".card-text")[1].innerText.substr(6);
	var date = $(".card-text")[2].innerText.substr(7);
	var seatNo = $(".card-text")[3].innerText.substr(7);
	var loc = $(".card-text")[4].innerText.substr(7);
	var price = $(".card-text")[5].innerText.substr(6);
	
	$("#PReservNo").val(PReservNo)
	$("#name").val(name)
	$("#date").val(date)
	$("#today").val(dateString)
	$("#seatNo").val(seatNo)
	$("#loc").val(loc)
	$("#price").val(price)
	
	$.ajax({
		url: "loginChk",
		type: "post",
		dataType: "text",
		data: {
			"UId": '${sessionId}'
		},
		success: function(data) {
			console.log(data)
			$("#ownerAddr").val(data)
		}
	})
	</script>
</body>
</html>