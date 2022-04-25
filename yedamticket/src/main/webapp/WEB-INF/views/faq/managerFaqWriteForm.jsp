<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title {
	margine:
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 class="card-title" style="font-size: 50px;">FAQ 작성</h2>
			<br>
			<div class="col-md-8">
				<form id="frm" action="managerFaqWrite.do" method="post">
					<table class="table">
						<tbody>
							<tr>
								<td>제목</td>
								<td style="text-align: left;"><input type="text" id="title"
									name="title" required="required" class="form-control"></td>
							</tr>
							<tr>
								<td>유형</td>
								<td style="text-align: left;"><select name="qstCd">
										<option value="회원가입"selected="selected">회원가입</option>
										<option value="티켓예매/발권">티켓예매/발권</option>
										<option value="구매/결제">구매/결제</option>
										<option value="취소/환불">취소/환불</option>
										<option value="배송/반송">배송/반송</option>
										<option value="판매방법">판매방법</option>
										<option value="상품등록/수정">상품등록/수정</option>
								</select></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="20" cols="100" id="content"
										name="content"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center"><input type="submit"
									value="등록" class="btn btn-primary"> <input
									type="button" onclick="location.href='managerFaq.do'"
									value="목록" class="btn btn-primary"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>