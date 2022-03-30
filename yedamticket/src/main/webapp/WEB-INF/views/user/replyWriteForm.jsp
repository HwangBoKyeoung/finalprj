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
<form id="frm" action="inqReply.do" method="post">
	<div class="col-lg-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Inquiry Select</h4>
				<table class="table">
					<tr>
						<th>TITLE</th>
						<td>
						<input type="text" id="title" name="title">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<th>
						<input type="text" id="UId" name="UId">
						</th>
					</tr>
					<tr>
						<th>CONTENT</th>
						<th>
						<input type="text" id="content" name="content">
						</th>
					</tr>
				</table>
				<br>
			</div>
		</div>
		<div>
				<input type="submit"  value="등록">
				<input type="button" onclick="location.href='inqList.do'" value="목록">
				<input type="button" onclick="location.href='relayForm.do'" value="답변">
				<input type="reset" value="취소">
			</div>
	</div>
	</form>
</body>
</html>