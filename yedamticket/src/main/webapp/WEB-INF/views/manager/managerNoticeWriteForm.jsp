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
		<div class="col-md-2"></div>
		<div class="col-md-8"><br>
			<h2 class="text-center">공지사항 작성</h2>
			<form id="frm" action="noticeWrite.do" method="post">
				<table class="table">
					<tr>
						<td>작성자</td>
						<td><input type="text" id="writer" name="writer" 
							value="관리자" readonly="readonly"></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><input type="date" id="wrDt" name="wrDt"
							readonly="readonly" value=""></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" size="75" id="title" name="title"
							required="required"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="75" id="content" name="content"
								></textarea></td>
					</tr>
					<tr>

						<td colspan="2" class="text-center"><input type="submit"
							value="등록" class="btn btn-success"> <input type="reset"
							value="취소" class="btn btn-warning"> <input type="button"
							onclick="location.href='noticeList.do'" value="목록"
							class="btn btn-primary"></td>
					</tr>

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