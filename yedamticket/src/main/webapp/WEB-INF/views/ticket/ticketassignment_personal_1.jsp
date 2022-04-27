<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
* {
	list-style: none;
}

.footer {
	position: fixed;
}

.hr-sect {
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
	<div class="container">
		<h1 class="hr-sect">개인양도</h1>
		<hr>

		<input id="sessionId" type="hidden" value="${sessionId }">

		<form action="ticketassignment_personal_2.do" method="post">
			<input id="ownerAddr" name="ownerAddr" type="hidden"> <input
				id="buyerAddr" name="buyerAddr" type="hidden">
			<div align="center" style="margin-bottom: 50px; margin-top: 20px;">
				<div class="card" style="width: 40rem;">
					<div class="card-body">
						<p class="card-text">예약번호 : ${PReservNo }</p>
						<input id="PReservNo" type="hidden" name="PReservNo">

						<p class="card-text">공연명 : ${name }</p>
						<input id="name" type="hidden" name="name">

						<p class="card-text">
							양도할 아이디 : <input name="RId" id="RId" type="text">
							<button type="button" class="idChk" id="idChk" value="N"
								onclick="fn_idChk(); ">중복체크</button>
						</p>

						<p class="card-text">공연일정 : ${date }</p>
						<input id="date" type="hidden" name="date"> <input
							id="today" type="hidden" name="today">

						<p class="card-text">좌석번호 : ${seatNo }</p>
						<input id="seatNo" type="hidden" name="seatNo">

						<p class="card-text">좌석구역 : ${loc }</p>
						<input id="loc" type="hidden" name="loc">

						<p class="card-text">가 격 : ${price }</p>
						<input id="price" type="hidden" name="price"> <input
							id="inpBtn" type="submit" class="btn"
							style="background: #301e4e;" value="선택">
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		$("#inpBtn").attr("disabled", true);
		var today = new Date();

		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);

		var dateString = year + '/' + month + '/' + day;

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
			var sessionid = '${sessionId}'
			if ($("#RId").val() == sessionid) {
				swal("예.담.티.켓.", '본인에게는 양도할 수 없습니다.');

				$(".swal-button--confirm").on("click", function() {
					return false;
				});

			}

			var chk = 0;
			$.ajax({
				url : "idChk",
				type : "post",
				dataType : "json",
				data : {
					"UId" : $("#RId").val()
				},
				success : function(data) {
					if (data == 1) {
						$("#idChk").val('N');
						swal("예.담.티.켓.", '양도 가능한 아이디입니다!');
						idCnum = 1;

						$.ajax({
							url : "loginChk",
							type : "post",
							dataType : "text",
							data : {
								"UId" : $("#RId").val()
							},
							success : function(data) {
								console.log(data)
								$("#buyerAddr").val(data)
							}
						})
						$(".swal-button--confirm").on("click", function() {
							$("#inpBtn").attr("disabled", false);
						});

					} else if (data == 0 || data == '') {
						$("#idChk").val('Y');
						swal("예.담.티.켓.", '존재하지 않는 아이디입니다!');
						idCnum = 0;
						$(".swal-button--confirm").on("click", function() {
							$("#inpBtn").attr("disabled", true);
						});
					}
				}
			})
		}
		$.ajax({
			url : "loginChk",
			type : "post",
			dataType : "text",
			data : {
				"UId" : '${sessionId}'
			},
			success : function(data) {
				console.log(data)
				$("#ownerAddr").val(data)
			}
		})
	</script>
</body>
</html>
