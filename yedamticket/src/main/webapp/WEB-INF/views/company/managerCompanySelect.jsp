<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="col-lg-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Company</h4>
				<table class="table">
					<tbody>
						<tr>
							<th>회원 아이디</th>
							<td>${com.CId}</td>
						</tr>
						<tr>
							<th>기업 이메일</th>
							<td>${com.email}</td>
						</tr>
						<tr>
							<th>기업이름</th>
							<td>${com.name}</td>
						</tr>
						<tr>
							<th>기업 주소</th>
							<td>${com.addr}</td>
						</tr>
						<tr>
							<th>기업 연락처</th>
							<td>${com.phone}</td>
						</tr>
						<tr>
							<th>기업 사업자 번호</th>
							<td>${com.bizno}</td>
						</tr>
						<tr>
							<th>가입일자</th>
							<td>${com.rdt}</td>
						</tr>
						<tr>
							<th>개인간의 거래 승인 여부</th>
							<td>${com.dealAgreeCd}</td>
						</tr>
					</tbody>
				</table>
			</div>
		<div>
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">영화 목록</h4>
				<table class="table">
					<tr>
						<th>영화 이름</th>
						<th>영화 장르</th>
						<th>영화 감독</th>
						<th>영화 상영시간</th>
					</tr>
<%-- 				<c:forEach items="${mv }" var="mv"> --%>
<!-- 					<tr> -->
<%-- 						<td>${mv.name}</td> --%>
<%-- 						<td>${mv.genre}</td> --%>
<%-- 						<td>${mv.director}</td> --%>
<%-- 						<td>${mv.startDate}</td> --%>
<!-- 					</tr> -->
<%-- 					</c:forEach> --%>
				</table>
			</div>
		</div>
		</div>
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">공연 목록</h4>
				<table class="table">
					<tr>
						<th>공연 이름</th>
						<th>공연 감독</th>
						<th>공연 가격</th>
					</tr>
<%-- 					<c:forEach items="${pf }" var="pf"> --%>
<!-- 					<tr> -->
<%-- 						<td>${pf.name}</td> --%>
<%-- 						<td>${pf.content}</td> --%>
<%-- 						<td>${pf.price}</td> --%>
<!-- 					</tr> -->
<%-- 					</c:forEach> --%>
				</table>
			</div>
		</div>
		</div>

		</div>
</body>
</html>