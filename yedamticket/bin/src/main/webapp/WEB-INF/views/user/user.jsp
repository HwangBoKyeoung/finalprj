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
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">User List</h4>
				<p class="card-description">사용자 리스트</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Eamil</th>
							<th>DATE</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${users}" var="user">
							<tr onclick="location.href='userSelet.do?Uid=${user.uid}'">
								<td>${user.uid}</td>
								<td>${user.name}</td>
								<td>${user.email}</td>
								<td>${user.rdt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div class="col-3">
					<div class="input-group mb-3">
						<select name="key" id="key" class="btn btn-outline-secondary">
							<option value="전체">전체</option>
							<option value="아이디">이메일</option>
							<option value="이름">이름</option>
							<option value="이메일">아이디</option>
						</select> &nbsp; <input type="text" size="5" name="val" id="val"
							class="form-control" aria-label="Text input with dropdown button">
						&nbsp;
						<button type="button" onclick="SearchList()"
							class="btn btn-outline-secondary">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function SearchList(){
		$.ajax({
			url : "ajaxUserSearch.do",
			type: "post",
			data :  {"key" : $("#key").val(), "val": $("#val").val()},
			success : function(result) {
				if(result.length > 0){
					console.log(result);
					jsonHtmlConvert(result);
				}
			}
		});
	}
	function jsonHtmlConvert(result){
		var tb = $("#body");
		$("#body").empty();
		$.each(result, function(index, item){
			console.log(item);
			var tr = $("<tr />").attr({
				onclick : "location.href='userSelect.do?Cid=" + item.uid + "'"
			}).append(
					$("<td />").text(item.uid),
					$("<td />").text(item.name),
					$("<td />").text(item.email),
					$("<td />").text(item.rdt),
			);
			tb.append(tr);
		});
		$("#contents").append(tb);
	}
	</script>
</body>
</html>