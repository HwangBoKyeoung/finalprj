<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<c:forEach items="${point}" var="pt">
					<table class="table table-sm">
						<thead>
							<tr>
								<th scope="col">예매번호</th>
								<th scope="col">예매일</th>
								<th scope="col">영화명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${pt.pay}</td>
								<td>${pt.payDt}</td>
								<td>${pt.charge}</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
	
</body>
</html>