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
				<h4 class="card-title">Movie Request List</h4>
				<p class="card-description">영화등록요청 리스트</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="#" var="">
							<tr onclick="#">
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="#?pageNum=${pageVO.startPage-1 }">
							<input type="button" value="이전" class="btn btn-secondary">
						</a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="#?pageNum=${num }"> <input
							type="button" value="${num }" class="btn btn-secondary"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="#?pageNum=${pageVO.endPage+1 }">
							<input type="button" value="다음" class="btn btn-secondary">
						</a>
					</c:if>
				</div>
				<br>
				<form action="#">
					<div class="col-10">
						<div class="searchBar" align="right">
							<select name="searchType" class="btn btn-outline-secondary">
								<option value="ALL"
									${pageVO.cri.searchType eq 'ALL' ? 'selected' : '' }>전체</option>
								<option value="#"
									${pageVO.cri.searchType eq 'NAME' ? 'selected' : '' }>#</option>
								<option value="#"
									${pageVO.cri.searchType eq 'LOC' ? 'selected' : '' }>#</option>
							</select> <input type="text" name="searchName"
								value="${pageVO.cri.searchName }">
							<button type="submit" class="btn btn-primary">검색</button>
							<input type="hidden" name="pageNum" value="1">
							<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
							<input type="hidden" name="amount" value="${pageVO.amount }">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>