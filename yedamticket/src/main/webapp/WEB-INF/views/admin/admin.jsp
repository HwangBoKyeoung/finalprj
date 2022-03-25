<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Admin List</h4>
				<p class="card-description">
					관리자 리스트
				</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Depart</th>
						</tr>
					</thead>
					<tbody id="body">
					<c:forEach items="${managers}" var="mana">
						<tr onclick="location.href='managerSelet.do?MId=${mana.MId}'">
							<td>${mana.MId}</td>
							<td>${mana.name}</td>
							<td>${mana.phone}</td>
							<td>${mana.depart}</td>
						</tr>
					</c:forEach>						
					</tbody>
				</table><br>
				<input type="button" onclick="location.href='adminForm.do'" value="등록" class="btn btn-gradient-primary me-2">
				
			
		<div class="col-3">
		<div class="input-group mb-3">			
			<select name="key" id="key" class="btn btn-outline-secondary">
				<option value="전체">전체</option>
				<option value="부서">부서</option>
				<option value="이름">이름</option>
				<option value="아이디">아이디</option>
			</select> &nbsp;
			<input type="text" size="5" name ="val" id = "val" class="form-control" aria-label="Text input with dropdown button"> &nbsp;
			<button type="button" onclick="SearchList()" class="btn btn-outline-secondary">검색</button>	
		</div>
		</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function SearchList() {
			$.ajax({
				url : "ajaxManagerSerch.do",
				type : "post",
				data : {"key" : $("#key").val(), "val": $("#val").val()},
				dataType : "json",
				success : function(result) {
					if(result.length > 0) {
						console.log(result);
						jsonHtmlConvert(result);
					}
				}
			});
		}
		
		function jsonHtmlConvert(result) {
			var tb = $("#body");
			$("#body").empty();
			$.each(result, function(index, item){
				console.log(item.MId);
				var tr = $("<tr />").attr({
					onclick : "'managerSelet.do?MId=${item.MId}'"
				}).append(
					$("<td />").text(item.MId),
					$("<td />").text(item.name),
					$("<td />").text(item.phone),
					$("<td />").text(item.depart),
				);
				tb.append(tr);
			});
			$("#contents").append(tb);
			
		}
	</script>
</body>
</html>