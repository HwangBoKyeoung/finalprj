<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		</div>
		
	</div>

</body>
</html>