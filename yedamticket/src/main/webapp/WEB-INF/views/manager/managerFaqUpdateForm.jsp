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
			<div class="col-md-9">
<h4 class="card-title"  style="font-size: 50px;">FAQ 수정</h4><br>
<form id="frm" action="managerFaqUpdate.do" method="post">
	<input type="hidden" value="${faqs.FNo}" id="FNo" name="FNo">
			<div>
				<table class="table">
					<tbody>
						<tr>
							<th width="100" style="text-align: left;">유형</th>
							<td style="text-align: left;"><select name="qstCd">
										<option value="티켓예매">티켓예매/발권</option>
										<option value="취소/환불">취소/환불</option>
										<option value="배송/반송" selected="selected">배송/반송</option>
								</select></td>
						</tr>
						<tr>
							<th>제목</th>
							<td style="text-align: left;">
							<input class="form-control" type="text" name="title" name="title" value="${faqs.title }">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" style="text-align: left;">
							 	<textarea rows="10" cols="80" id="content" name="content" >${faqs.content }</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div><br>
			<div align="center">
				<input type="submit"  value="수정" class="btn btn-primary">
				<input type="button" class="btn btn-primary" onclick="location.href='managerFaq.do'" value="목록">
				<input type="reset" value="취소" class="btn btn-primary"><br>
			</div>
		</form>
</body>
</html>