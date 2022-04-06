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
				<h4 class="card-title">Delete List</h4>
				<p class="card-description">삭제 리스트</p>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>번호</th>
							<th>기업아이디</th>
							<th>신청 날짜</th>
							<th>처리상태 </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dels}" var="del">
							<input type="text" name="PNo" id="PNo" value="${del.PNo }">
						<tr onclick="location.href='delSelect.do?delReqNo=${del.delReqNo }'">
							<td><input type="hidden" value="${del.delReqNo }" name="delReqNo">${del.delReqNo }</td>
							<td>${del.CId }</td>
							<td><input type="hidden" value="${del.delDt }" name="delDt">${del.delDt }</td>
							<td><input type="hidden" value="${del.deleteCd }" name="deleteCd">${del.deleteCd }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
			</div>
		</div>
	</div>
	
	<script>
		function deleteJoin(){
			
		}
	</script>
</body>
</html>