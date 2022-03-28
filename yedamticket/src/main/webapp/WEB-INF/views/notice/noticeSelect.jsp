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
	<div align="center"></div>
	<div>
		<h1>게시글 상세</h1>
	</div>
	<form id="frm" action="noticeUpdateForm.do">
	<input type="hidden" name="noticeNo" id="noticeNo" value="${notice.noticeNo}">
		<c:if test="${empty notice.noticeNo }">
			<h1>선택한 게시글이 존재하지 않습니다</h1>
		</c:if>
		<c:if test="${not empty notice.noticeNo }">
			<div>
				<table border="1">

					<tr>

						<th width="100">작성자</th>
						<td align="center" width="150">${notice.writer }</td>
						<th width="100">작성일자</th>
						<td align="center" width="150">${notice.wrDt }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${notice.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="10" cols="80" readonly="readonly">${notice.content }</textarea>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
		<br>
		<div>
			<button type="button" onclick="location.href='noticeList.do'">목록가기</button>
			<button type="submit" >수정</button>
			<button type="button"
				onclick="location.href='noticeDelete.do?noticeNo=${notice.noticeNo}'">삭제</button>
		</div>
	</form>
	<script>
		let writer = document.getElementById("writer");
		console.log(writer.value);
	</script>
</body>
</html>