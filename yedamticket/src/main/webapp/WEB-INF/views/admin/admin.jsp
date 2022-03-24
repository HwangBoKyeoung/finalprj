<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Admin List</h4>
				<p class="card-description">
					관리자 리스트
				</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>AuthCode</th>
							<th>Depart</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${managers}" var="mana">
						<tr>
							<td>${mana.MId}</td>
							<td>${mana.name}</td>
							<td>${mana.phone}</td>
							<td>${mana.depart}</td>
						</tr>
					</c:forEach>						
					</tbody>
				</table><br>
				<input type="button" onclick="location.href='adminForm.do'" value="등록" class="btn btn-gradient-primary me-2">
			</div>
		</div>
	</div>
</body>
</html>