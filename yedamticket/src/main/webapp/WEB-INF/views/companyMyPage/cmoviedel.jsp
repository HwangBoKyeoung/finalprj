
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-6 grid-margin stretch-card">
		<form action="mvdeleInsert.do" method="post">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">삭제 신청 페이지</h4>
					<input type="text" id="CId" name="CId" value="${CId}">
					<p class="card-description">Movie</p>
					<table class="table">
					
						<tr>
							<th>삭제 사유</th>
							<td><input type="text" name="content" id="content"></td>
							<th><input type="text" name="mvNo" id="mvNo" value="${del}"></th>
							 	
						</tr>
						<tr>
							<th>구분 코드</th>
							<td><input type="text" name="deleteCd" id="deleteCd"
								readonly="readonly" value="신청"></td>
						</tr>
						<tr>
							<th>삭제신청날짜</th>
							<td><input type="date" name="delDt" id="delDt"></td>
						</tr>
					</table>
					<br>
					<button type="submit" class="btn btn-gradient-primary me-2">요청</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		document.getElementById('delDt').valueAsDate = new Date();
	</script>
</body>
</html>