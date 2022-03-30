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
	<form action="noticeList.do">
		<div>
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
		</div>

		<!-- hidden으로 숨겨서 들어갈 값 -->
		<input type="hidden" name="pageNum" value="1">
		<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
		<input type="hidden" name="amount" value="${pageVO.amount }">

	</form>

	<table class="table table-bordered" style="text-align: center;">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<c:forEach items="${list }" var="list">
			<tr onclick="noticeSearch('${list.noticeNo }')">
				<td>${list.noticeNo}</td>
				<td>${list.title }</td>
				<td>${list.writer }</td>
				<td>${list.wrDt}</td>
				<td>${list.hit}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<form>
		<div>
			<c:if test="${pageVO.prev }">
				<!-- 이전버튼 활성화 여부 -->
				<a href="noticeList.do?pageNum=${pageVO.startPage-1 }"> <input
					type="button" value="이전" class="btn btn-secondary"></a>
			</c:if>
			<!-- pageNum -->
			<c:forEach var="num" begin="${pageVO.startPage }"
				end="${pageVO.endPage }">
				<a class="${pageVO.pageNum == num ? 'active': '' }"
					href="noticeList.do?pageNum=${num }"> <input type="button"
					value="${num }" class="btn btn-secondary"></a>
			</c:forEach>
			<!-- 다음버튼 -->
			<c:if test="${pageVO.next }">
				<a href="noticeList.do?pageNum=${pageVO.endPage+1 }"> <input
					type="button" value="다음" class="btn btn-secondary"></a>
			</c:if>
		</div>
	</form>
	<script>
		window.onload = function() {
			if (history.state == '')
				return; // 메시지를 출력했다면 함수종료

			var msg = '<c:out value="${msg }" />';

			if (msg != '') {
				alert(msg);
				// 기존 기록을 삭제하고 새로운 기록을 추가 ( 이렇게 변경된 값은 history.state로 데이터를 확인가능 )
				history.replaceState('', null, null); // 브라우저 기록컨트롤 (추가할데이터, 제목, url주소)
				// console.log(history.state);
			}
		}
	</script>
</body>
</html>