<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<div><h1>게 시 글 작성</h1></div>
	<div>
		<form id="frm" action="faqWrite.do" method="post">
			<div>
				<table border="1">
					<tr>
						<th width="100">제목</th>
						<td width="150">
							<input type="text" id="title" name="title" required="required">
						</td>
						<th width="100">유형</th>
						<td width="150">
							<input type="text" id="qstCd" name="qstCd" required="required"> 
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
						 	<textarea rows="10" cols="80" id="content" name="content"></textarea>
						</td>
					</tr>	
				</table>
			</div><br>
			<div>
				<input type="submit"  value="등록">
				<input type="button" onclick="location.href='faqList.do'" value="목록">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
</div>	
</body>
</html>