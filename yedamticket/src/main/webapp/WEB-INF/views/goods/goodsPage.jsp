<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<h4 class="card-title">Goods List</h4>
				<p class="card-description">굿즈 리스트</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>굿즈 이름</th>
							<th>기업명</th>
							<th>상품 구분</th>
							<th>가 격</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${gods }" var="gds">
							<tr onclick="location.href='goodsSelect.do?gNo=${gds.GNo}&goodsCd=${gds.goodsCd }' ">
								<td>${gds.name}</td>
								<td>${gds.seller}</td>
								<td>&nbsp;&nbsp;&nbsp;<c:set var="goodsCd" value="" />
								<c:if test="${gds.goodsCd eq'0'}">
									<c:out value="영화"/>
								</c:if>
								<c:set var="goodsCd" value="" />
								<c:if test="${gds.goodsCd eq'1'}">
									<c:out value="공연"/>
								</c:if></td>
								<%-- <td>${gds.goodsCd}</td> --%>
								<td>${gds.price}원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>