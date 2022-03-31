<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center"></div>
	<div>
		<h1>게시글 상세</h1>
	</div>
	<form id="frm" action="faqUpdateForm.do">
	<input type="hidden" name="FNo" id="FNo" value="${faqs.FNo}">
		<c:if test="${empty faqs.FNo }">
			<h1>선택한 게시글이 존재하지 않습니다</h1>
		</c:if>
		<c:if test="${not empty faqs.FNo }">
			<div>
				<table border="1">

					<tr>
						<th width="100">유형</th>
						<td align="center" width="150">${faqs.qstCd }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${faqs.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="10" cols="80" readonly="readonly">${faqs.content }</textarea>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
		<br>
		<div>
			<button type="button" onclick="location.href='faqList.do'">목록가기</button>
			<button type="submit" >수정</button>
			<button type="button"
				onclick="location.href='faqDelete.do?FNo=${faqs.FNo}'">삭제</button>
		</div>
	</form>
</body>
</html> 