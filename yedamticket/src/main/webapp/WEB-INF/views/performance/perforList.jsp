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
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Performance List</h4>
				<p class="card-description">공연 리스트</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>공연 이름</th>
							<th>출연진</th>
							<th>공연지역</th>
							<th>공연가격</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${pers }" var="per">
							<tr onclick="location.href='pserSelect.do?PNo=${per.PNo}' ">
								<td>${per.name}</td>
								<td>${per.actor}</td>
								<td>${per.loc}</td>
								<td>${per.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<button onclick="location.href='CMvList.do'">영화</button>
</body>
</html>