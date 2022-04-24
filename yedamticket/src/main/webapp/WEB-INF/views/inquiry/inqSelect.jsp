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
	color: transparent;
	text-shadow: 0 0 0 black;
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
		<h4 style="font-size: 70px;">1:1문의 내용</h4>
				<form id="frm" action="inqUpdateForm.do">
					<input type="hidden" name="inNo" id="inNo" value="${inqs.inNo}">
					<table class="table">
						<tr>
							<th>작성일자</th>
							<td>${inqs.inDt }</td>
						</tr>
						<tr>
							<th>문의유형</th>
							<c:choose>
								<c:when test="${inqs.kind == 'mv' }">
									<td>영화</td>
								</c:when>
								<c:when test="${inqs.kind == 'pf' }">
									<td>공연</td>
								</c:when>
								<c:when test="${inqs.kind == 'pt' }">
									<td>포인트</td>
								</c:when>
								<c:when test="${inqs.kind == 'de' }">
									<td>배송</td>
								</c:when>
							</c:choose>
						</tr>
						<tr>
							<th>제목</th>
							<td>${inqs.title}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="10" cols="90" id="content"
									name="content" disabled>${inqs.content }</textarea></td>
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
		
		<div class="container2" style="display:none">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-9">
					<br>
					<table class="table">
						<tr>
							<th>답변</th>
							<td colspan="3"><textarea rows="4" cols="87"
									readonly="readonly" id="txt" disabled></textarea></td>
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
			var successCnt = 1
			if(successCnt == 1){
				$("#txt").val(result.ans);
				$(".container2").show()
			}
			console.log(result);
		}
	});


</script>
</body>
</html>