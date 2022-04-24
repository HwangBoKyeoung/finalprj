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
				<h4 class="card-title" style="font-size: 40px;">일반 회원 정보</h4><br>
				<table class="table">
					<tr>
						<th>회원 아이디</th>
						<td>${users.UId}</td>
					</tr>
					<tr>
						<th>회원 이메일</th>
						<td>${users.email}</td>
					</tr>
					<tr>
						<th>회원 생년월일</th>
						<td>${users.birthDt}</td>
					</tr>
					<tr>
						<th>회원이름</th>
						<td>${users.name}</td>
					</tr>
					<tr>
						<th>회원 주소</th>
						<td>${users.addr}</td>
					</tr>
					<tr>
						<th>회원 멤버십</th>
						<td>${users.membership}</td>
					</tr>
					<tr>
						<th>보유 포인트</th>
						<td>${users.point}</td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td>${users.rdt}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div align="center">
		<button class="btn-sm btn-primary" onclick="location.href='managerUser.do'">목록</button>
		</div>
</body>
</html>