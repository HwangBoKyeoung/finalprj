<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<h1>티켓 양도</h1>
<input id="sessionId" type="hidden" value="${sessionId }">

<form action="ticketassignment_personal_2.do" method="post">
<input id="ownerAddr" name="ownerAddr" type="hidden">
<input id="buyerAddr" name="buyerAddr" type="hidden">
	<div align="left">
		<div class="card" style="width: 40rem;">
			<div class="card-body">
				<p class="card-text">예약번호 : ${PReservNo }</p>
				<input id="PReservNo" type="hidden" name="PReservNo">
				
				<p class="card-text">공연명 : ${name }</p>
				<input id="name" type="hidden" name="name">
				
				<p class="card-text">양도할 아이디 : <input name="Uid" id="Uid" type="text">
				<button type="button" class="idChk" id="idChk" value="N" onclick="fn_idChk(); ">중복체크</button>
				</p>
				
				<p class="card-text">공연일정 : ${date }</p>
				<input id="date" type="hidden" name="date">
				<input id="today" type="hidden" name="today">				
				
				<p class="card-text">좌석번호 : ${seatNo }</p>
				<input id="seatNo" type="hidden" name="seatNo">
				
				<p class="card-text">좌석구역 : ${loc }</p>
				<input id="loc" type="hidden" name="loc">
				
				<p class="card-text">가 격 : ${price }</p>
				<input id="price" type="hidden" name="price">
				
				<input id="inpBtn" type="submit" class="btn btn-primary" value="선택">
			</div>
		</div>
	</div>
</form>
	<script>
	$("#inpBtn").attr("disabled", true);
	var today = new Date();

	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '/' + month  + '/' + day;
	
	var PReservNo = $(".card-text")[0].innerText.substr(7);
	var name = $(".card-text")[1].innerText.substr(6);
	var date = $(".card-text")[3].innerText.substr(7);
	var seatNo = $(".card-text")[4].innerText.substr(7);
	var loc = $(".card-text")[5].innerText.substr(7);
	var price = $(".card-text")[6].innerText.substr(6);
	
	$("#PReservNo").val(PReservNo)
	$("#name").val(name)
	$("#date").val(date)
	$("#today").val(dateString)
	$("#seatNo").val(seatNo)
	$("#loc").val(loc)
	$("#price").val(price)
	
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
					alert("양도 가능한 아이디입니다!");
					idCnum = 1;

					$.ajax({
						url: "loginChk",
						type: "post",
						dataType: "text",
						data: {
							"Uid": $("#Uid").val()
						},
						success: function(data) {
							console.log(data)
							$("#buyerAddr").val(data)
						}
					})
					
					$("#inpBtn").attr("disabled", false);
				} else if (data == 0 || data == '') {
					$("#idChk").val('Y');
					alert("없는 아이디입니다!");
					idCnum = 0;
					$("#inpBtn").attr("disabled", true);
				} else {
					alert("아이디를 입력해주세요.");
				}
			}
		})
	}
	$.ajax({
		url: "loginChk",
		type: "post",
		dataType: "text",
		data: {
			"Uid": '${sessionId}'
		},
		success: function(data) {
			console.log(data)
			$("#ownerAddr").val(data)
		}
	})
	</script>
</body>
</html>