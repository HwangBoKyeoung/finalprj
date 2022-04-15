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
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<br>
					<input type="hidden" name="noticeNo" id="noticeNo"
						value="${notice.noticeNo}">
					<table class="table">
						<tr>
							<th width="100">작성자</th>
							<td width="150">${notice.writer }</td>
							<th width="100">작성일자</th>
							<td width="150">${notice.wrDt }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">${notice.title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea rows="10" cols="80"
									readonly="readonly">${notice.content }</textarea></td>
					</table>
					<div align="center">
						<button type="button" class="btn btn-primary"
							onclick="location.href='noticeList.do'">목록가기</button>
					</div>
			</div>
		</div>
	</div>
</body>
</html>