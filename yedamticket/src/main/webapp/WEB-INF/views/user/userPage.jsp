<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/users/css/style.css">
</head>
<style>
.ui-tooltip {
	padding: 10px 20px;
	color: #fff;
	border-radius: 5px;
	background: #000;
}

@font-face {
	font-family: Poppins-Regular;
	src:
		url(https://colorlib.com/etc/tb/Table_Responsive_v2/fonts/poppins/Poppins-Regular.ttf)
}

@font-face {
	font-family: Poppins-Bold;
	src:
		url(https://colorlib.com/etc/tb/Table_Responsive_v2/fonts/poppins/Poppins-Bold.ttf)
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body, html {
	height: 100%;
	font-family: sans-serif
}

a:hover {
	text-decoration: none
}

h1, h2, h3, h4, h5, h6 {
	margin: 0
}

p {
	margin: 0
}

ul, li {
	margin: 0;
	list-style-type: none
}

iframe {
	border: none !important
}

.limiter {
	width: 100%;
	margin: 0 auto
}

.container-table100 {
	width: 100%;
	min-height: 30vh;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	padding: 33px 30px
}

.wrap-table100 {
	width: 700px;
	height: 300px;
	border-radius: 10px;
	overflow: hidden
}

.table {
	width: 100%;
	display: table;
	margin: 0
}

@media screen and (max-width:768px) {
	.table {
		display: block
	}
}

.row {
	display: table-row;
	background: #fff
}

@media screen and (max-width:768px) {
	.row {
		display: block
	}
	.row.header {
		padding: 0;
		height: 0
	}
	.row.header .cell {
		display: none
	}
	.row .cell:before {
		font-family: Poppins-Bold;
		font-size: 12px;
		color: gray;
		line-height: 1.2;
		text-transform: uppercase;
		font-weight: unset !important;
		margin-bottom: 13px;
		content: attr(data-title);
		min-width: 98px;
		display: block
	}
}

.cell {
	display: table-cell
}

@media screen and (max-width:768px) {
	.cell {
		display: block
	}
}

.row .cell {
	font-family: Poppins-Regular;
	font-size: 15px;
	color: #666;
	line-height: 1.2;
	font-weight: unset !important;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #f2f2f2
}

.row.header .cell {
	font-family: Poppins-Regular;
	font-size: 18px;
	color: #fff;
	line-height: 1.2;
	font-weight: unset !important;
	padding-top: 19px;
	padding-bottom: 19px
}

.row .cell:nth-child(1) {
	width: 350px;
	padding-left: 40px
}

.row .cell:nth-child(2) {
	width: 160px
}

.row .cell:nth-child(3) {
	width: 250px
}

.row .cell:nth-child(4) {
	width: 190px
}

.table, .row {
	width: 100% !important
}

/* .row:hover {
    background-color: #ececff;
    cursor: pointer
} */
@media ( max-width :768px) {
	.row {
		border-bottom: 1px solid #f2f2f2;
		padding-bottom: 18px;
		padding-top: 30px;
		padding-right: 15px;
		margin: 0
	}
	.row .cell {
		border: none;
		padding-left: 30px;
		padding-top: 16px;
		padding-bottom: 16px
	}
	.row .cell:nth-child(1) {
		padding-left: 30px
	}
	.row .cell {
		font-family: Poppins-Regular;
		font-size: 18px;
		color: #555;
		line-height: 1.2;
		font-weight: unset !important
	}
	.table, .row, .cell {
		width: 100% !important
	}
}

* {
	box-sizing: border-box;
}

.que:first-child {
	border-top: 1px solid black;
}

.que {
	position: relative;
	padding: 17px 0;
	cursor: pointer;
	font-size: 14px;
	border-bottom: 1px solid #dddddd;
}

.que::before {
	display: inline-block;
	content: 'Q';
	font-size: 14px;
	color: #006633;
	margin-right: 5px;
}

.que.on>span {
	font-weight: bold;
	color: #006633;
}

.anw {
	display: none;
	overflow: hidden;
	font-size: 14px;
	background-color: #f4f4f2;
	padding: 27px 0;
}

.anw::before {
	display: inline-block;
	content: 'A';
	font-size: 14px;
	font-weight: bold;
	color: #666;
	margin-right: 5px;
}

.logo {
	color: white;
}
</style>

<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="custom-menu"></div>
			<div class="p-4 pt-5">
				<h1>
					<a href="userPage.do" class="logo">마이페이지</a>
				</h1>
				<div>	
					<h6>${sessionId }님의</h6>
					<fmt:formatNumber value="${user.point }" var="Point"/>
					<h6>보유 포인트${Point }P</h6>
					<br>
				</div>
				<ul class="list-unstyled components mb-5">
					<li><a href="userInfoCheckForm.do">회원정보수정</a></li>
					<li><a href="pfReservList.do">공연예매내역</a></li>
					<li><a href="mvReservList.do">영화예매내역</a></li>
					<li><a href="ticketassignment_1.do">내 티켓 보기 / 내 예약 정보</a></li>
					<li><a href="userPointList.do">거래내역</a></li>
					<li><a href="#">티켓거래내역</a></li>
				</ul>

				<div class="mb-5">
					<h4 class="h6"></h4>
					<h4 class="h6"></h4>
					<h2 class="h6"></h2>
					<span></span><br> <span> </span><br> <span></span>

					<div class="form-group d-flex">
						<div class="icon">
							<span class="icon-paper-plane"></span>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<div class="container">
			<c:if test="${not empty prList}">
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
							<c:forEach items="${prList}" var="pr" begin="0" end="1">
								<tr>
									<td id="Lname" scope="row">${pr.name}</td>
									<td id="LPReservNo">${pr.PReservNo}</td>
									<td id="LfrDt">${pr.frDt}</td>
									<td id="LseatNo">${pr.seatNo}</td>
									<c:set var="seatCnt" value="${fn:split(pr.seatNo, ',') }" />
									<c:set var="seatCnt2" value="0" />
									<c:forEach var="seatCntFor" items="${seatCnt }">
										<c:set var="tt" value="${seatCnt2 = seatCnt2 + 1 }" />
									</c:forEach>
									<td id="Lloc">${pr.loc}</td>
									<td id="Lprice">${pr.price * seatCnt2}</td>
									<td id="LUId" hidden="">${pr.UId}</td>
									<td><input type="button" id="chargebtn"
										class="btn btn-primary" onclick="selectedFnc();"
										data-toggle="modal" data-target="#prInfoModal" value="결제"></td>
									<td><input type="button" id="cancelbtn"
										class="btn btn-primary" onclick="selectedFnc2();"
										data-toggle="modal" data-target="#prCancelModal" value="취소"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<br> <br>
			<c:if test="${empty prList}">
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
							<tr style="text-align: center;">
								<td colspan="9">결제 대기중인 티켓이 없습니다</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
			<br>
			<c:if test="${not empty mvList}">
				<span>영화예매내역</span>
				<div class="main-content">
					<div class="cols-12">
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col">예매번호</th>
									<th scope="col">예매일</th>
									<th scope="col">영화명</th>
									<th scope="col">관람일</th>
									<th scope="col">상영시간</th>
									<th scope="col">좌석번호</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mvList}" var="mv" begin="0" end="1">
									<tr>
										<td class="text-center">${mv.mvReservNo}</td>
										<td class="text-center"><fmt:formatDate
												value="${mv.reservDt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td class="text-center"
											onClick="location.href='movieDetail.do?docId=${mv.docId }'">${mv.name}
										</td>
										<td class="text-center">${mv.schDate}</td>
										<td class="text-center">${mv.schTime}</td>
										<td>${mv.seatName}</td>
										<!-- <td><input type="button" class="checkBtn" value="더보기" class="btn btn-primary" ></td> -->
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<br> <br>
			<c:if test="${empty mvList}">
				<span>영화예매내역</span>
				<div class="main-content">
					<div class="cols-12">
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col">예매번호</th>
									<th scope="col">예매일</th>
									<th scope="col">영화명</th>
									<th scope="col">관람일</th>
									<th scope="col">상영시간</th>
									<th scope="col">좌석번호</th>
								</tr>
							</thead>
							<tbody>
								<tr style="text-align: center;">
									<td colspan="6">영화 예매 내역이 없습니다</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<br> <br>
			<c:if test="${not empty pfList}">
				<span>공연예매내역</span>
				<div class="main-content">
					<div class="cols-12">
						<table class="table table-sm tblMemSearch">
							<thead>
								<tr>
									<th scope="col">예매번호</th>
									<th scope="col">예매일</th>
									<th scope="col">공연명</th>
									<th scope="col">관람일</th>
									<th scope="col">상영시간</th>
									<th scope="col">좌석번호</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="pf" items="${pfList}">
									<tr>
										<td>${pf.performanceReservationVO.PReservNo}</td>
										<td><fmt:formatDate
												value="${pf.performanceReservationVO.reserveDttm}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${pf.name}</td>
										<td>${pf.performanceScheduleVO.frDt}</td>
										<td>${pf.performanceScheduleVO.time}</td>
										<td>${pf.performanceReservationVO.seatNo}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			<br>
			<c:if test="${empty pfList}">
				<span>공연예매내역</span>
				<div class="main-content">
					<div class="cols-12">
						<table class="table table-sm">
							<thead>
								<tr>
									<th scope="col">예매번호</th>
									<th scope="col">예매일</th>
									<th scope="col">공연명</th>
									<th scope="col">관람일</th>
									<th scope="col">상영시간</th>
									<th scope="col">좌석번호</th>
								</tr>
							</thead>
							<tbody>
								<tr style="text-align: center";>
									<td colspan="6">공연 예매 내역이 없습니다</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>


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