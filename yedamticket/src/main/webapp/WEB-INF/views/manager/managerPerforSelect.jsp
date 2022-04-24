<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">공연 상세정보</h4>
				<table class="table">
					<tr>
						<th>공연 이름</th>
						<td>${pers.name}</td>
					</tr>
					<tr>
						<th>공연 내용</th>
						<td>${pers.content}</td>
					</tr>
					<tr>
						<th>출연자</th>
						<td>${pers.actor}</td>
					</tr>
					<tr>
						<th>공연장</th>
						<td>${pers.loc}</td>
					</tr>
					<tr>
						<th>공연상세주소</th>
						<td>${pers.addr}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>