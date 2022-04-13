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
<div id="content">
			<form action="managerNotice.do">
				<div class="searchBar" align="right">
					<select name="searchType">
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
					<button type="submit" class="btn btn-primary">검색</button>
					<!-- hidden으로 숨겨서 들어갈 값 -->
					<input type="hidden" name="pageNum" value="1">
					<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
					<input type="hidden" name="amount" value="${pageVO.amount }">
				</div>

				
						
					<table class="table" style="text-align: center;">
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
								onclick="location.href='noticeSelect.do?noticeNo=${list.noticeNo }'">
								<td>${list.noticeNo}</td>
								<td>${list.title }</td>
								<td>${list.wrDt }</td>
								<td><button onclick="location.href='managerNoticeDel.do?noticeNo=${list.noticeNo}'">삭제</button></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<br>
					<div align="right" class="subBtn">
					<button type="button" class="btn btn-primary"
						onclick="location.href='managerNoticeWriteForm.do'">글등록</button>
				</div>
					<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="managerNotice.do?pageNum=${pageVO.startPage-1 }"> <input
							type="button" value="이전" class="btn btn-secondary"></a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="managerNotice.do?pageNum=${num }"> <input type="button"
							value="${num }" class="btn btn-secondary"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="managerNotice.do?pageNum=${pageVO.endPage+1 }"> <input
							type="button" value="다음" class="btn btn-secondary"></a>
					</c:if>
				</div>
			</form>
		</div>
</body>
</html>