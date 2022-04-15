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
				<h4 class="card-title">FAQ List</h4>
				<p class="card-description">FAQ 관리</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>유형</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${faqs}" var="faq">
							<tr>
								<td onclick="location.href='managerFaqSelect.do?FNo=${faq.FNo}'">${faq.FNo}</td>
								<td onclick="location.href='managerFaqSelect.do?FNo=${faq.FNo}'">${faq.title }</td>
								<td onclick="location.href='managerFaqSelect.do?FNo=${faq.FNo}'">${faq.qstCd}</td>
								<td><button onclick="location.href='faqDelete.do?FNo=${faq.FNo}'">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div align="right" class="subBtn">
					<button type="button" class="btn btn-primary"
						onclick="location.href='managerFaqWriteForm.do'">글등록</button>
						</div>
				<form id="actionForm" action="managerFaq.do" method="get">
					<input type="hidden" name="pageNum" value="${pageVO.pageNum }">
					<input type="hidden" name="amount" value="${pageVO.amount }">
					<input type="hidden" name="searchType"
						value="${pageVO.cri.searchType }"> <input type="hidden"
						name="searchName" value="${pageVO.cri.searchName }">
				</form>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="${pageVO.startPage-1 }"> <input type="button"
							value="이전" class="btn btn-secondary"></a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }" href="${num }">
							<input type="button" value="${num }" class="btn btn-secondary">
						</a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="${pageVO.endPage+1 }"> <input type="button"
							value="다음" class="btn btn-secondary"></a>
					</c:if>
				</div>
				<div class="col-5">
					<form action="managerFaq.do">
						<div class="input-group mb-3" align="left">
							<select name="searchType" class="btn btn-outline-secondary">
								<option value="ALL"
									${pageVO.cri.searchType eq 'ALL' ? 'selected' : '' }>전체</option>
								<option value="QSTCD"
									${pageVO.cri.searchType eq 'QSTCD' ? 'selected' : '' }>분야</option>
								<option value="TITLE"
									${pageVO.cri.searchType eq 'TITLE' ? 'selected' : '' }>제목</option>
							</select> <input type="text" name="searchName"
								value="${pageVO.cri.searchName }" class="form-control"
								aria-label="Text input with dropdown button">
							<button type="submit" class="btn btn-outline-secondary">검색</button>
							<input type="hidden" name="pageNum" value="1">
							<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
							<input type="hidden" name="amount" value="${pageVO.amount }">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>