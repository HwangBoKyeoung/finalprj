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
			<form action="user.do">
				<div class="card-body">
					<h4 class="card-title">User List</h4>
					<p class="card-description">사용자 리스트</p>
					<table class="table table-hover" id="contents">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Eamil</th>
								<th>DATE</th>
							</tr>
						</thead>
						<tbody id="body">
							<c:forEach items="${users}" var="user">
								<tr onclick="location.href='userSelet.do?uid=${user.uid}'">
									<td>${user.uid}</td>
									<td>${user.name}</td>
									<td>${user.email}</td>
									<td>${user.rdt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<div id="content" align="center">
						<c:if test="${pageVO.prev }">
							<!-- 이전버튼 활성화 여부 -->
							<a href="user.do?pageNum=${pageVO.startPage-1 }"> <input
								type="button" value="이전" class="btn btn-secondary"></a>
						</c:if>
						<!-- pageNum -->
						<c:forEach var="num" begin="${pageVO.startPage }"
							end="${pageVO.endPage }">
							<a class="${pageVO.pageNum == num ? 'active': '' }"
								href="user.do?pageNum=${num }"> <input type="button"
								value="${num }" class="btn btn-secondary"></a>
						</c:forEach>
						<!-- 다음버튼 -->
						<c:if test="${pageVO.next }">
							<a href="user.do?pageNum=${pageVO.endPage+1 }"> <input
								type="button" value="다음" class="btn btn-secondary"></a>
						</c:if>
					</div>
					<div class="col-5">
						<div class="searchBar" align="right">
							<select name="searchType" class="btn btn-outline-secondary">
								<option value="ALL" ${pageVO.cri.searchType eq 'ALL' ? 'selected' : '' }>전체</option>
								<option value="UID" ${pageVO.cri.searchType eq 'UID' ? 'selected' : '' }>아이디</option>
								<option value="NAME" ${pageVO.cri.searchType eq 'NAME' ? 'selected' : '' }>이름</option>
								<option value="EMAIL" ${pageVO.cri.searchType eq 'EMAIL' ? 'selected' : '' }>이메일</option>
							</select> <input type="text" name="searchName"
								value="${pageVO.cri.searchName }">
							<button type="submit" class="btn btn-primary">검색</button>
							<input type="hidden" name="pageNum" value="1">
							<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
							<input type="hidden" name="amount" value="${pageVO.amount }">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>