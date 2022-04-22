<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>

<head>
<title>Sidebar 02</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<style>
.ui-tooltip {
	padding: 10px 20px;
	color: #fff;
	border-radius: 5px;
	background: #000;
}
</style>

<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="p-4 pt-5">
				<h1>
					<a href="#" class="logo">MyPage</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li>
						<h6>${sessionId }님은회원 입니다</h6>
						<h6>
							보유 포인트${user.point }P
							<button class="btn btn-primary btn-sm"
								onclick="location.href='point_1.do'">충전</button>
						</h6> <br>
					</li>
					<li><a href="userInfoCheckForm.do">회원정보수정</a></li>
					<li><a href="pfReservList.do">공연예매내역</a></li>
					<li><a href="mvReservList.do">영화예매내역</a></li>
					<li><a href="userBuyList.do">거래내역 삭제 예정</a></li>
					<li><a href="ticketassignment_1.do">내 티켓 보기 / 내 예약 정보</a></li>
					<li><a href="userPointList.do">거래내역</a></li>
					<li><a href="#">티켓거래내역</a></li>
				</ul>
				<div class="mb-5">
					<div class="form-group d-flex">
						<div class="icon">
							<span class="icon-paper-plane"></span>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<div class="container">
			<span>결제대기티켓</span>
			<div class="cols-12">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">공연제목</th>
							<th scope="col">예매번호</th>
							<th scope="col">공연일자</th>
							<th scope="col">좌석번호</th>
							<th scope="col">좌석구역</th>
							<th scope="col">원 가격</th>
							<th scope="col">결제 <i class="fas fa-exclamation-circle"
								title="10% 수수료가 부가됩니다!" style="cursor: pointer;"
								aria-hidden="true"></i>
							</th>
							<th scope="col">취소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${prList}" var="pr" begin="0" end="2">
								<tr>
									<td id="Lname" scope="row">${pr.name}</td>
									<td id="LPReservNo" >${pr.PReservNo}</td>
									<td id="LfrDt" >${pr.frDt}</td>
									<td id="LseatNo" >${pr.seatNo}</td>
									<c:set var="seatCnt" value="${fn:split(pr.seatNo, ',') }"/>
										<c:set var="seatCnt2" value="0"/>
										<c:forEach var="seatCntFor" items="${seatCnt }">
											<c:set var="tt" value="${seatCnt2 = seatCnt2 + 1 }"/>
										</c:forEach>
									<td id="Lloc">${pr.loc}</td>
									<td id="Lprice">${pr.price * seatCnt2}</td>
									<td id="LUId" hidden="">${pr.UId}</td>
									<td><input type="button" id="chargebtn" class="btn btn-primary" onclick="selectedFnc();" data-toggle="modal" data-target="#prInfoModal" value="결제"></td>
									<td><input type="button" id="cancelbtn" class="btn btn-primary" onclick="selectedFnc2();" data-toggle="modal" data-target="#prCancelModal" value="취소"></td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="prInfoModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="닫기">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form action="reservedticket_1.do" method="POST">
							<div class="modal-body">

								<h5 class="modal-title" id="Mname"></h5>
								<input type="hidden" id="name" name="name">

								<p id="MPReservNo"></p>
								<input type="hidden" id="PReservNo" name="PReservNo">

								<p id="MfrDt"></p>
								<input type="hidden" id="frDt" name="frDt">

								<p id="Mseat"></p>
								<input type="hidden" id="seatNo" name="seatNo">

								<p id="Mloc"></p>
								<input type="hidden" id="loc" name="loc">

								<p id="Mprice"></p>
								<input type="hidden" id="price" name="price">

								<p id="MUId"></p>
								<input type="hidden" id="UId" name="UId">

							</div>
							<div class="modal-footer" style="display: block">
								<p>
									정보가 맞으시면 확인 버튼을 눌러주세요. <i class="fas fa-exclamation-circle"
										title="10% 수수료가 부가된 가격입니다!" style="cursor: pointer;"
										aria-hidden="true"></i>
								</p>
								<br>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<input type="submit" class="btn btn-primary" value="확인">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Modal End -->

			<!-- Modal2 -->
			<div class="modal fade" id="prCancelModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="닫기">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form action="cancelticket_1.do" method="POST">
							<div class="modal-body">

								<h5 class="modal-title" id="Mname"></h5>
								<input type="hidden" id="name" name="name">

								<p id="MPReservNo"></p>
								<input type="hidden" id="CPReservNo" name="CPReservNo">

								<p id="MfrDt"></p>
								<input type="hidden" id="frDt" name="frDt">

								<p id="Mseat"></p>
								<input type="hidden" id="seatNo" name="seatNo">

								<p id="Mloc"></p>
								<input type="hidden" id="loc" name="loc">

								<p id="Mprice"></p>
								<input type="hidden" id="price" name="price">

								<p id="MUId"></p>
								<input type="hidden" id="UId" name="UId">

							</div>
							<div class="modal-footer" style="display: block">
								<p>예약을 취소하시겠습니까?</p>
								<br>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소</button>
								<input type="submit" class="btn btn-primary" value="확인">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Modal2 End -->
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$(".fa-exclamation-circle").tooltip();
		});

		$(".que").click(function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		});

		function selectedFnc() {
			var Lname = $(event.target).parent().parent().children().eq(0)
					.text();
			var LPReservNo = $(event.target).parent().parent().children().eq(1)
					.text();
			var LfrDt = $(event.target).parent().parent().children().eq(2)
					.text();
			var LseatNo = $(event.target).parent().parent().children().eq(3)
					.text();
			var Lloc = $(event.target).parent().parent().children().eq(4)
					.text();
			var Lprice = $(event.target).parent().parent().children().eq(5)
					.text();
			var LUId = $(event.target).parent().parent().children().eq(6)
					.text();

			var Lprice2 = parseInt(Lprice) * 1.1

			$("#Mname").text("공연제목 : " + Lname)
			$("#MPReservNo").text("예매번호 : " + LPReservNo)
			$("#MfrDt").text("공연일자 : " + LfrDt)
			$("#MseatNo").text("좌석번호 : " + LseatNo)
			$("#Mloc").text("좌석구역 : " + Lloc)
			$("#Mprice").text("가격 : " + Lprice2)

			$("#name").val(Lname)
			$("#PReservNo").val(LPReservNo)
			$("#frDt").val(LfrDt)
			$("#seatNo").val(LseatNo)
			$("#loc").val(Lloc)
			$("#price").val(Lprice2)
			$("#UId").val(LUId)
		}

		function selectedFnc2() {
			var Lname = $(event.target).parent().parent().children().eq(0)
					.text();
			var LPReservNo = $(event.target).parent().parent().children().eq(1)
					.text();
			var LfrDt = $(event.target).parent().parent().children().eq(2)
					.text();
			var LseatNo = $(event.target).parent().parent().children().eq(3)
					.text();
			var Lloc = $(event.target).parent().parent().children().eq(4)
					.text();
			var Lprice = $(event.target).parent().parent().children().eq(5)
					.text();
			var LUId = $(event.target).parent().parent().children().eq(6)
					.text();

			var Lprice2 = parseInt(Lprice) * 1.1

			$("#name").val(Lname)
			$("#CPReservNo").val(LPReservNo)
			$("#frDt").val(LfrDt)
			$("#seatNo").val(LseatNo)
			$("#loc").val(Lloc)
			$("#price").val(Lprice2)
			$("#UId").val(LUId)

			console.log("LPReservNo : " + LPReservNo)
			console.log("아이디에 담기는 값 : " + $("#CPReservNo").val())
		}
	</script>
</body>

</html>