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
							<th>영화 이름</th>
							<th>장르</th>
							<th>관람등금</th>
							<th>감독</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${mvs }" var="mv">
							<tr onclick="location.href='cMvSelect.do?mvNo=${mv.mvNo}' ">
								<td>${mv.name}</td>
								<td>${mv.genre}</td>
								<td>${mv.rating}</td>
								<td>${mv.director}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="CMvList.do?pageNum=${pageVO.startPage-1 }"> <input
							type="button" value="이전" class="btn btn-secondary"></a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="CMvList.do?pageNum=${num }"> <input type="button"
							value="${num }" class="btn btn-secondary"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="CMvList.do?pageNum=${pageVO.endPage+1 }"> <input
							type="button" value="다음" class="btn btn-secondary"></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>