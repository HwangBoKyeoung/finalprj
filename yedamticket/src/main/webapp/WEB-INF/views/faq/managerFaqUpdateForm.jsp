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
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<form id="frm" action="managerFaqUpdate.do" method="post">
					<input type="hidden" value="${faqs.FNo}" id="FNo" name="FNo">
					<div>
						<table class="table">
							<tbody>
								<tr>
									<th width="100">유형</th>
									<td><input type="text" name="qstCd" name="qstCd"
										value="${faqs.qstCd }"></td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input type="text" name="title" name="title"
										value="${faqs.title }"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3"><textarea rows="10" cols="80" id="content"
											name="content">${faq.content }</textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<div>
						<input type="submit" value="수정"> <input type="button"
							onclick="location.href='faqList.do'" value="목록"> <input
							type="reset" value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>