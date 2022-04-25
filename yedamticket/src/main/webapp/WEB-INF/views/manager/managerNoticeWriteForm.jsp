<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<style>
textarea {
    resize: none;
  }
</style>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-8">
			<h2 class="card-title">공지사항 작성</h2><br>
			<form id="frm" action="managerNoticeWrite.do" method="post">
				<table class="table">
				<tbody>
					<tr>
						<td>작성자</td>
						<td style="text-align: left;"><input type="text" id="writer" name="writer" 
							value="관리자" readonly="readonly"></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td style="text-align: left;"><input type="date" id="wrDt" name="wrDt"
							readonly="readonly" value=""></td>
					</tr>
					<tr>
						<td>제목</td>
						<td style="text-align: left;"><input type="text" size="55" id="title" name="title"
							required="required"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td style="text-align: left;"><textarea rows="20" cols="90" id="content" name="content"
								></textarea></td>
					</tr>
					<tr>

						<td colspan="2" class="text-center"><input type="submit"
							value="등록" class="btn btn-primary"> <input type="button"
							onclick="location.href='managerNotice.do'" value="목록"
							class="btn btn-primary"></td>
					</tr>
</tbody>
				</table>
			</form>
		</div>
	</div>
	</div>
</body>
<script>
	document.getElementById('wrDt').valueAsDate = new Date();
</script>
</html>