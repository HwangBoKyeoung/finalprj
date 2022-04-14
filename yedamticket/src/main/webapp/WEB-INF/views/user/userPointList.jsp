<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="p-4 pt-5">
				<h1>
					<a href="#" class="logo">MyPage</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li>
						<h6>${sessionId }님은회원입니다</h6>
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
			<h2>거래내역</h2>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">결제일자</th>
						<th scope="col">사용처</th>
						<th scope="col">포인트 충전</th>
						<th scope="col">포인트 사용</th>
						<th scope="col">포인트잔액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list3 }" var="point">
						<tr class="plist">
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
							</c:choose>
							<td>+ ${point.charge }</td>
							<td>- ${point.pay }</td>
							<td>${point.tempPoint }</td>
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