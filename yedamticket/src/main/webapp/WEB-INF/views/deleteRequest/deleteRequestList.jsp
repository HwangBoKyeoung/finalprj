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
				<h4 class="card-title">Delete List</h4>
				<p class="card-description">삭제 리스트</p>
				<!-- 검색기능 -->
				<div class="col-3">
					<div class="input-group mb-3" align="right">
						<select name="searchType" class="btn btn-outline-secondary">
							<option value="ALL"
								${pageVO.cri.searchType eq 'ALL' ? 'selected' : '' }>전체</option>
							<option value="CONTENT"
								${pageVO.cri.searchType eq 'CONTENT' ? 'selected' : '' }>사유</option>
							<option value="C_ID"
								${pageVO.cri.searchType eq 'C_ID' ? 'selected' : '' }>기업회원
								아이디</option>
						</select> <input type="text" name="searchName"
							value="${pageVO.cri.searchName }" class="form-control"
							aria-label="Text input with dropdown button">
						<button type="submit" class="btn btn-outline-secondary">검색</button>
						<input type="hidden" name="pageNum" value="1">
						<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
						<input type="hidden" name="amount" value="${pageVO.amount }">
					</div>
				</div>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>번호</th>
							<th>기업아이디</th>
							<th>신청 날짜</th>
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dels}" var="del">
							<input type="hidden" name="PNo" id="PNo" value="${del.PNo }">
							<tr
								onclick="location.href='deleteRequestSelect.do?delReqNo=${del.delReqNo }'">
								<td><input type="hidden" value="${del.delReqNo }"
									name="delReqNo">${del.delReqNo }</td>
								<td><input type="hidden" value="${del.CId }" name="CId">${del.CId }</td>
								<td><input type="hidden" value="${del.delDt }" name="delDt">${del.delDt }</td>
								<td><input type="hidden" value="${del.deleteCd }"
									name="deleteCd">${del.deleteCd }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="deleteRequestList.do?pageNum=${pageVO.startPage-1 }">
							<input type="button" value="이전" class="btn btn-secondary">
						</a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="deleteRequestList.do?pageNum=${num }"> <input
							type="button" value="${num }" class="btn btn-secondary"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="deleteRequestList.do?pageNum=${pageVO.endPage+1 }"> <input
							type="button" value="다음" class="btn btn-secondary"></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<script>
		function deleteJoin() {

		}
	</script>
</body>
</html>