<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/users/js/core/jquery.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="col-lg-10 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Inquiry List</h4>
				<table class="table table-hover" id="contents">
					<thead >
						<tr>
							<th>NO</th>
							<th>TITLE</th>
							<th>DATE</th>
							<th>ID</th>
						</tr>
					</thead>
					<tbody id="body">
					<c:forEach items="${inquirys }" var="inq">
						<tr id="tbod" onclick="location.href='inquirySelect.do?inNo=${inq.inNo }'">
							<td>${inq.inNo }</td>
							<td>${inq.title}</td>
							<td>${inq.inDt }</td>
							<td>${inq.UId }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table><br>
				<div id="content" align="center">
							<c:if test="${pageVO.prev }">
								<!-- 이전버튼 활성화 여부 -->
								<a href="inquiry.do?pageNum=${pageVO.startPage-1 }"> 
								<input type="button" value="이전" class="btn btn-secondary"></a>
							</c:if>
							<!-- pageNum -->
							<c:forEach var="num" begin="${pageVO.startPage }"
								end="${pageVO.endPage }">
								<a class="${pageVO.pageNum == num ? 'active': '' }" href="inquiry.do?pageNum=${num }"> 
								<input type="button" value="${num }" class="btn btn-secondary"></a>
							</c:forEach>
							<!-- 다음버튼 -->
							<c:if test="${pageVO.next }">
								<a href="inquiry.do?pageNum=${pageVO.endPage+1 }"> 
								<input type="button" value="다음" class="btn btn-secondary"></a>
							</c:if>
						</div>
				<div class="col-3">
					<div class="input-group mb-3">			
						<select name="key" id="key" class="btn btn-outline-secondary">
							<option value="전체">전체</option>
							<option value="제목">제목</option>
							<option value="아이디">아이디</option>
						</select> &nbsp;
				<input type="text" size="5" name ="val" id = "val" class="form-control" aria-label="Text input with dropdown button"> &nbsp;
				<button type="button" onclick="InqSearchList()" class="btn btn-outline-secondary">검색</button>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function InqSearchList() {
			//$('#tbod').remove();
			$.ajax({
				url : "ajaxInqSearch.do",
				type : "post",
				data : {"key" : $("#key").val(), "val": $("#val").val()},
				dataType : "json",
				success : function(result){
					if(result.length > 0) {
						console.log(result);
						jsonHtml(result);
					}
				}
			});			
		}
		function jsonHtml(result){
			var tb = $("#body");
			$("#body").empty();
			$.each(result, function(index, item){
				console.log(index)
				console.log(item);
				var tr = $("<tr />").attr({
					onclick : "location.href='inquirySelect.do?inNo=" + item.inNo + "'"
				}).append(
					$("<td />").text(item.inNo),
					$("<td />").text(item.title),
					$("<td />").text(item.inDt),
					$("<td />").text(item.uid),
				);
				tb.append(tr);
			});
			$("#contents").append(tb);
		}
	</script>
</body>
</html>