<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>

</head>
<style>
textarea {
	resize: none;
}

th {
	width: 120px;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<br>
				<h4 style="font-size: 70px;">1:1문의 작성</h4><br>
				<form id="frm" action="inqWrite.do" method="post">
					<table class="table">
						<tr>
							<th>작성일자</th>
							<td><input type="date" id="inDt" name="inDt"
								class="form-control" readonly="readonly" value=""></td>
						</tr>
						<tr>
							<th>문의유형</th>
							<td><select name="kind" id="kind" class="form-control">
									<option value="mv" selected="selected">영화</option>
									<option value="pf">공연</option>
									<option value="gs">굿즈</option>
									<option value="pt">포인트</option>
									<option value="de">배송</option>
							</select></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" size="75" id="title" name="title"
								class="form-control" required="required"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="10" cols="75" id="content"
									name="content"></textarea></td>
						</tr>
						<tr>


							<td colspan="2" class="text-center">
							<input type="hidden" id="UId" name="UId" value="${sessionId }"
							class="form-control" readonly="readonly">
							<input type="submit" value="등록" class="btn" style="background: #301e4e;"> 
							<input type="reset" class="btn" value="취소" style="background: #301e4e;"> 
							<input type="button" onclick="location.href='inqList.do'" style="background: #301e4e;" value="목록" class="btn">
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div><br><br>
<script>
	document.getElementById('inDt').valueAsDate = new Date();
</script>
</body>
</html>