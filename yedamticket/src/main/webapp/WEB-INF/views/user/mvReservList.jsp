<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>영화예매내역</h2>
		<div class="cols-12">
			<c:forEach items="${mvList}" var="mv">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">예매번호</th>
							<th scope="col">예매일</th>
							<th scope="col">영화명</th>
							<th scope="col">관람일</th>
							<th scope="col">상영시간</th>
							<th scope="col">좌석이름</th>
							<th scope="col">더보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${mv.mvReservNo}</th>
							<td>${mv.reservDt}</td>
							<td>${mv.name}</td>
							<td>${mv.schDate}</td>
							<td>${mv.schTime}</td>
							<td>${mv.seatName}</td>
							<td><button class="btn-primary btn-sm">더보기</button></td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>