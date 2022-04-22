<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/users/css/style.css">
<style>
.plist td:nth-child(4) {
	color: purple;
	font-weight: bold;
}

.plist td:nth-child(3) {
	color: green;
	font-weight: bold;
}

.plist td:nth-child(5) {
	font-weight: bold;
}
</style>
</head>
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
			<br>
			<h2>거래내역</h2>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">결제번호</th>
						<th scope="col">결제일</th>
						<th scope="col">사용처</th>
						<th scope="col">포인트 충전</th>
						<th scope="col">포인트 사용</th>
						<th scope="col">포인트잔액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list3 }" var="point">
						<fmt:formatNumber value="${point.charge }" var="charge"
							pattern="#,###" />
						<fmt:formatNumber value="${point.pay }" var="pay" pattern="#,###" />
						<fmt:formatNumber value="${point.tempPoint }" var="tempPoint"
							pattern="#,###" />

						<%-- <fmt:parseDate var="payDt" pattern="yyyy-MM-dd HH:mm:ss.SSS" value="${point.payDt }"/>
						<fmt:parseDate var="chargeDt" pattern="yyyy-MM-dd HH:mm:ss.SSS" value="${point.chargeDt }"/> --%>
						<tr class="plist">
							<td>${point.payNo }</td>
							<c:choose>
								<c:when test="${point.chargeDt == null}">
									<td>${point.payDt }</td>
								</c:when>
								<c:otherwise>
									<td>${point.chargeDt }</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${point.buyCtntCd == 'mv' }">
									<td>영화결제</td>
								</c:when>
								<c:when test="${point.buyCtntCd == 'pf' }">
									<td>공연결제</td>
								</c:when>
								<c:when test="${point.buyCtntCd == 'pt' }">
									<td>포인트충전</td>
								</c:when>
								<c:when test="${point.buyCtntCd == 'gd' }">
									<td>포인트충전</td>
								</c:when>
							</c:choose>
							<td>+ ${charge}</td>
							<td>- ${pay }</td>
							<td>${tempPoint }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="content" align="center">
				<c:if test="${pageVO.prev }">
					<!-- 이전버튼 활성화 여부 -->
					<a href="userPointList.do?pageNum=${pageVO.startPage-1 }"> <input
						type="button" value="이전" class="btn btn-secondary"></a>
				</c:if>
				<!-- pageNum -->
				<c:forEach var="num" begin="${pageVO.startPage }"
					end="${pageVO.endPage }">
					<a class="${pageVO.pageNum == num ? 'active': '' }"
						href="userPointList.do?pageNum=${num }"> <input type="button"
						value="${num }" class="btn btn-secondary"></a>
				</c:forEach>
				<!-- 다음버튼 -->
				<c:if test="${pageVO.next }">
					<a href="userPointList.do?pageNum=${pageVO.endPage+1 }"> <input
						type="button" value="다음" class="btn btn-secondary"></a>
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>