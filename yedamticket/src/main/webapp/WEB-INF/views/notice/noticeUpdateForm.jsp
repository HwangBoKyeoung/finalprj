<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" action="noticeUpdate.do" method="post">
	<input type="hidden" value="${notice.noticeNo}" id="noticeNo" name="noticeNo">
			<div>
				<table border="1">
					<tr>
						<th width="100">작성자</th>
						<td width="150">
							<input type="text" id="writer" name="writer" value="${notice.writer }" readonly="readonly">
						</td>
						<th width="100">작성일자</th>
						<td width="150">
							<input type="date" id="wrDt" name="wrDt" value="${notice.wrDt }" readonly="readonly"> 
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" size="75" id="title" name="title" value="${notice.title }"> 
						</td>	
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
						 	<textarea rows="10" cols="80" id="content" name="content" >${notice.content }</textarea>
						</td>
					</tr>	
				</table>
			</div><br>
			<div>
				<input type="submit"  value="수정">
				<input type="button" onclick="location.href='noticeList.do'" value="목록">
				<input type="reset" value="취소">
			</div>
		</form>
</body>
</html>