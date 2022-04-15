<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
<title>Sidebar 02</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<style>
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
						<h6>보유 포인트${user.point }P</h6> <br>
					</li>
					<li><a href="userUpdateForm.do">회원정보수정</a></li>
					<li><a href="pfReservList.do">공연예매내역</a></li>
					<li><a href="mvReservList.do">영화예매내역</a></li>
					<li><a href="userBuyList.do">거래내역</a></li>
					<li><a href="userPointList.do">포인트충전내역</a></li>
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
			<span>최근 공연 예매내역</span>
			<button class="btn btn-primary btn-sm"
				onclick="location.href='pfReservList.do'">더보기</button>
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
						<c:forEach var="pf" items="${pfList}" begin="0" end="2">
							<tr>
								<td>${pf.performanceReservationVO.PReservNo}</td>
								<td>${pf.performanceReservationVO.reserveDttm}</td>
								<td>${pf.name}</td>
								<td>${pf.performanceScheduleVO.frDt}</td>
								<td>${pf.performanceScheduleVO.time}</td>
								<td>${pf.performanceReservationVO.seatNo}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br> <span>최근 영화 예매내역</span>
			<button class="btn btn-primary btn-sm"
				onclick="location.href='mvReservList.do'">더보기</button>
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
						<c:forEach items="${mvList}" var="mv" begin="0" end="2">
							<tr>
								<td scope="row">${mv.mvReservNo}</td>
								<td>${mv.reservDt}</td>
								<td>${mv.name}</td>
								<td>${mv.schDate}</td>
								<td>${mv.schTime}</td>
								<td>${mv.seatName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br> <br> <span>티켓거래내역</span>
			<button class="btn btn-primary btn-sm">더보기</button>
			<div class="cols-12">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">거래날짜</th>
							<th scope="col">구매상품</th>
							<th scope="col">구분</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>2022.02.20</td>
							<td>스파이더맨</td>
							<td>영화</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(".que").click(function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
		});
	</script>



</body>

</html>