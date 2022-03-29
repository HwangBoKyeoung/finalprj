<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Inquiry List</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>NO</th>
							<th>TITLE</th>
							<th>DATE</th>
							<th>ID</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${inqs }" var="inq">
						<tr onclick="location.href='inqSelect.do?inNo=${inq.inNo }'">
							<td>${inq.inNo }</td>
							<td>${inq.title}</td>
							<td>${inq.inDt }</td>
							<td>${inq.UId }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<button type="button" onclick="location.href='inqWriteForm.do'">글등록</button>
		</div>
	</div>
</body>
</html>