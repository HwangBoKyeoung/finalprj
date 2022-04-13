<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {
	resize: none;
}

th {
	width: 120px;
}
</style>
<script src="resources/users/js/core/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<br>
				<form id="frm" action="inqUpdateForm.do">
					<input type="hidden" name="inNo" id="inNo" value="${inqs.inNo}">
					<table class="table">
						<tr>
							<th>작성일자</th>
							<td>${inqs.inDt }</td>
						</tr>
						<tr>
							<th>문의유형</th>
							<td>${inqs.kind }</td> 
						</tr>
						<tr>
							<th>제목</th>
							<td>${inqs.title}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="10" cols="90" id="content"
									name="content">${inqs.content }</textarea></td>
						</tr>
					</table>
					<div align="center">
						<input type="hidden" id="UId" name="UId" value="${sessionId }"
							class="form-control" readonly="readonly">
						<button type="submit" class="btn btn-success">수정</button>
						<button type="button" class="btn btn-warning"
							onclick="location.href='inqDelete.do?inNo=${inqs.inNo}'">삭제</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='inqList.do'">목록가기</button>
					</div>
				</form>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-9">
					<br>
					<table class="table">
						<tr>
							<th>답변</th>
							<td colspan="3"><textarea rows="4" cols="80"
									readonly="readonly" id="txt"></textarea></td>
					</table>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
$.ajax({
	url: "inqReply.do",
	type: "POST",
	data: {inNo:${inqs.inNo }},
	dataType: "json",
	success:function(result){
		console.log(result);
		$("#txt").val(result[0].ans);
	}
});
</script>
</body>
</html>