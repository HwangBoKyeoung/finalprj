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
						<th>rhddus</th>
							<th>공연 이름</th>
							<th>출연진</th>
							<th>공연지역</th>
							<th>공연가격</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${pers }" var="per">
							<tr onclick="location.href='pserSelect.do?PNo=${per.PNo}' ">
								<td>${per.PNo }</td>
								<td>${per.name}</td>
								<td>${per.actor}</td>
								<td>${per.loc}</td>
								<td>${per.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="conPage.do?pageNum=${pageVO.startPage-1 }"> <input
							type="button" value="이전" class="btn btn-secondary"></a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="conPage.do?pageNum=${num }"> <input type="button"
							value="${num }" class="btn btn-secondary"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="conPage.do?pageNum=${pageVO.endPage+1 }"> <input
							type="button" value="다음" class="btn btn-secondary"></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<button onclick="location.href='CMvList.do'">영화</button>
</body>
</html>