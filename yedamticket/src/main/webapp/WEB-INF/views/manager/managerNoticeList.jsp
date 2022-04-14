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
				<h4 class="card-title">Notice List</h4>
				<p class="card-description">공지사항 관리</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일자</th>
							<th>삭제</th>
						</tr>
					</thead>
					<c:forEach items="${list }" var="list">
						<tr
							onclick="location.href='managerNoticeUpdateForm.do?noticeNo=${list.noticeNo }'">
							<td>${list.noticeNo}</td>
							<td>${list.title }</td>
							<td>${list.wrDt }</td>
							<td><button
									onclick="location.href='managerNoticeDel.do?noticeNo=${list.noticeNo}'">삭제</button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<br>
				<div align="right" class="subBtn">
					<button type="button" class="btn btn-primary"
						onclick="location.href='managerNoticeWriteForm.do'">글등록</button>
				
				<form id="actionForm" action="managerNotice.do" method="get">
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
					</div>
				</div>
				<div class="col-5">
				<form action="managerNotice.do">
					<div class="input-group mb-3" align="right">
							<select name="searchType" class="btn btn-outline-secondary">
							<option value="title"
								${pageVO.cri.searchType eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content"
								${pageVO.cri.searchType eq 'content' ? 'selected' : '' }>내용</option>
							<option value="writer"
								${pageVO.cri.searchType eq 'writer' ? 'selected' : '' }>작성자</option>
							<option value="titcont"
								${pageVO.cri.searchType eq 'titcont' ? 'selected' : '' }>제목+내용</option>
						</select> <input type="text" name="searchName"
							value="${pageVO.cri.searchName }">
						<button type="submit" class="btn btn-outline-secondary">검색</button>
						<!-- hidden으로 숨겨서 들어갈 값 -->
						<input type="hidden" name="pageNum" value="1">
						<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
						<input type="hidden" name="amount" value="${pageVO.amount }">
					</div>
				</form>
				</div>
			</div>
			</div>
			<script>
				let actionForm = $("#actionForm");
				$("#content a").on(
						"click",
						function(e) {
							e.preventDefault();
							console.log("click");
							console.log($(this).attr("href"));
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));

							actionForm.submit();
						});

				let searchForm = $("#searchForm");
				$("#searchForm button").on("click", function(e) {
					if (!searchForm.find("input[name='searchName']").val()) {
						alert('키워드를 입력하세요.');
						return false;
					}

					searchForm.find("input[name='pageNum']").val("1");
					e.preventDefault();

					searchForm.submit();
				})
			</script>
</body>
</html>