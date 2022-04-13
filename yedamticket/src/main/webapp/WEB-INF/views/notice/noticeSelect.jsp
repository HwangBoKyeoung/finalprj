<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {
	resize: none;
}

th {
	width: 120px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<br>
				<form id="frm" action="noticeUpdateForm.do">
					<input type="hidden" name="noticeNo" id="noticeNo"
						value="${notice.noticeNo}">
					<table class="table ">
						<tr>
							<th>작성자</th>
							<td>${notice.writer }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${notice.wrDt }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${notice.title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="10" cols="90" id="content"
									name="content">${notice.content }</textarea></td>
						</tr>
					</table>
					<div align="center">
						<button type="button" class="btn btn-primary"
							onclick="location.href='noticeList.do'">목록가기</button>
						<button type="submit" class="btn btn-success">수정</button>
						<button type="button" class="btn btn-warning"
							onclick="location.href='noticeDelete.do?noticeNo=${notice.noticeNo}'">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>