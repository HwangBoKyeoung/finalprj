<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.blist td:nth-child(4) {
	color: purple;
	font-weight: bold;
}

.plist td:nth-child(3) {
	color: green;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="p-4 pt-5">
				<h1>
					<a href="#" class="logo">MyPage</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li>
						<h6>${sessionId }님은회원입니다</h6>
						<h6>보유 포인트${userPoint.point }P</h6> <br>
					</li>
					<li><a href="userUpdateForm.do">회원정보수정</a></li>
					<li><a href="pfReservList.do">공연예매내역</a></li>
					<li><a href="mvReservList.do">영화예매내역</a></li>
					<li><a href="userBuyList.do">거래내역</a></li>
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
			<span>거래내역</span>
			<div class="cols-12">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">예약번호</th>
							<th scope="col">결제일자</th>
							<th scope="col">사용처</th>
							<th scope="col">포인트 사용</th>
							<th scope="col">총포인트</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list1 }" var="pf">
							<tr class="blist">
								<td>${pf.PReservNo }</td>
								<td>${pf.payDt }</td>
								<td>${pf.name }</td>
								<td>- ${pf.pay }</td>
								<td>${pf.point }</td>
							</tr>
						</c:forEach>
						<c:forEach items="${list2 }" var="mv">
							<tr class="blist">
								<td>${mv.mvReservNo }</td>
								<td>${mv.payDt }</td>
								<td>${mv.name }</td>
								<td>- ${mv.pay }</td>
								<td>${mv.point }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
			</div>
			<br> <span>포인트 충전내역</span>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">결제일자</th>
						<th scope="col">사용처</th>
						<th scope="col">포인트 충전</th>
						<th scope="col">총포인트</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list3 }" var="point">
						<tr class="plist">
							<td>${point.chargeDt }</td>
							<td>포인트충전</td>
							<td>+ ${point.charge }</td>
							<td>${point.point }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>