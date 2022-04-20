<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/users/js/core/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<form action="managerInquiryList.do">
				<div class="card-body">
					<h4 class="card-title">Inquiry List</h4>
					<table class="table table-hover" id="contents">
						<thead>
							<tr>
								<th>NO</th>
								<th>TITLE</th>
								<th>DATE</th>
								<th>ID</th>
								<th>KIND</th>
							</tr>
						</thead>
						<tbody id="body">
							<c:forEach items="${inquirys }" var="inq">
								<tr id="tbod"
									onclick="location.href='inquirySelect.do?inNo=${inq.inNo }'">
									<td>${inq.inNo }</td>
									<td>${inq.title}</td>
									<td>${inq.inDt }</td>
									<td>${inq.UId }</td>
									<td>${inq.kind }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
					<div id="content" align="center">
						<c:if test="${pageVO.prev }">
							<!-- 이전버튼 활성화 여부 -->
							<a href="managerInquiryList.do?pageNum=${pageVO.startPage-1 }">
								<input type="button" value="이전" class="btn btn-secondary">
							</a>
						</c:if>
						<!-- pageNum -->
						<c:forEach var="num" begin="${pageVO.startPage }"
							end="${pageVO.endPage }">
							<a class="${pageVO.pageNum == num ? 'active': '' }"
								href="managerInquiryList.do?pageNum=${num }"> <input
								type="button" value="${num }" class="btn btn-secondary"></a>
						</c:forEach>
						<!-- 다음버튼 -->
						<c:if test="${pageVO.next }">
							<a href="managerInquiryList.do?pageNum=${pageVO.endPage+1 }">
								<input type="button" value="다음" class="btn btn-secondary">
							</a>
						</c:if>
					</div>
					<div class="col-3">
						<div class="input-group mb-3" align="right">
							<select name="searchType" class="btn btn-outline-secondary">
								<option value="ALL"
									${pageVO.cri.searchType eq 'ALL' ? 'selected' : '' }>전체</option>
								<option value="TITLE"
									${pageVO.cri.searchType eq 'TITLE' ? 'selected' : '' }>제목</option>
								<option value="KIND"
									${pageVO.cri.searchType eq 'KIND' ? 'selected' : '' }>유형</option>
							</select> <input type="text" name="searchName"
								value="${pageVO.cri.searchName }" class="form-control"
								aria-label="Text input with dropdown button">
							<button type="submit" class="btn btn-outline-secondary">검색</button>
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