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
				<h4 class="card-title">Company List</h4>
				<p class="card-description">기업회원 리스트</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>기업아이디</th>
							<th>기업이름</th>
							<th>이메일</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${companys }" var="com">
							<tr onclick="location.href='companySelect.do?Cid=${com.cid}' ">
								<td>${com.cid}</td>
								<td>${com.name}</td>
								<td>${com.email}</td>
								<td>${com.phone}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div id="content" align="center">
							<c:if test="${pageVO.prev }">
								<!-- 이전버튼 활성화 여부 -->
								<a href="company.do?pageNum=${pageVO.startPage-1 }"> 
								<input type="button" value="이전" class="btn btn-secondary"></a>
							</c:if>
							<!-- pageNum -->
							<c:forEach var="num" begin="${pageVO.startPage }"
								end="${pageVO.endPage }">
								<a class="${pageVO.pageNum == num ? 'active': '' }" href="user.do?pageNum=${num }"> 
								<input type="button" value="${num }" class="btn btn-secondary"></a>
							</c:forEach>
							<!-- 다음버튼 -->
							<c:if test="${pageVO.next }">
								<a href="user.do?pageNum=${pageVO.endPage+1 }"> 
								<input type="button" value="다음" class="btn btn-secondary"></a>
							</c:if>
						</div>
				<div class="col-3">
					<div class="input-group mb-3">
						<select name="key" id="key" class="btn btn-outline-secondary">
							<option value="전체">전체</option>
							<option value="이메일">이메일</option>
							<option value="기업이름">기업이름</option>
							<option value="기업아이디">기업아이디</option>
						</select> &nbsp; 
						<input type="text" size="5" name="val" id="val" class="form-control" aria-label="Text input with dropdown button">
						&nbsp;
						<button type="button" onclick="SearchList()" class="btn btn-outline-secondary">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	function SearchList(){
		$.ajax({
			url : "ajaxCompanySearch.do",
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
				onclick : "location.href='companySelect.do?Cid=" + item.cid + "'"
			}).append(
					$("<td />").text(item.cid),
					$("<td />").text(item.name),
					$("<td />").text(item.email),
					$("<td />").text(item.phone),
			);
			tb.append(tr);
		});
		$("#contents").append(tb);
	}
</script>
</body>
</html>