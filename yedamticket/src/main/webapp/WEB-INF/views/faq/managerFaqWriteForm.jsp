<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<br>
				<h2 class="text-center">FAQ 작성</h2>
				<form id="frm" action="managerFaqWrite.do" method="post">
					<table class="table">
						<tbody>
							<tr>
								<td>제목</td>
								<td><input type="text" id="title" name="title"
									required="required"></td>
							</tr>
							<tr>
								<td>유형</td>
								<td><select name="qstCd">
										<option value="티켓예매">티켓예매/발권</option>
										<option value="취소/환불">취소/환불</option>
										<option value="배송/반송" selected="selected">배송/반송</option>
								</select></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="10" cols="75" id="content"
										name="content"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
								<input type="submit" value="등록" class="btn btn-success"> 
								<input type="button" onclick="location.href='managerFaq.do'" value="목록" class="btn btn-primary">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>