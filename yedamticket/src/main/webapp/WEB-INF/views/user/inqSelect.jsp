<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
</head>
<body>
<form id="frm" action="inqUpdateForm.do">
	<input type="hidden" name="inNo" id="inNo" value="${inqs.inNo}">
	<div class="col-lg-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Inquiry Select</h4>
				<table class="table">
					<tr>
						<th>NO</th>
						<td>${inqs.inNo }</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<td>${inqs.title}</td>
					</tr>
					<tr>
						<th>DATE</th>
						<td>${inqs.inDt }</td>
					</tr>
					<tr>
						<th>CONTENT</th>
						<th>${inqs.content }</th>
					</tr>
				</table>
				<br>
			</div>
		</div>
		<div>
			<button type="button" onclick="location.href='inqList.do'">목록가기</button>
			<button type="submit" >수정</button>
			<button type="button" onclick="location.href='replyWriteForm.do'">답글달기</button>
			<button type="button"
				onclick="location.href='inqDelete.do?inNo=${inqs.inNo}'">삭제</button>
		</div>
	</div>
	</form>
</body>
</html>