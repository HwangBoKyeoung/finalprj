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
	<h1>공연굿즈</h1>
	<div class="album py-5 bg-light">
		<div class="container">

			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach var="i" items="${cGoods }">
				<c:if test="${i.goodsCd eq 'pf' }">
					<div class="col-4">
						<div class="card shadow-sm" >
						
						<img src="/upload/${i.fileRe }" width="100%" height="225">
							<div class="card-body">
								<p class="card-text">${i.content}</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button class="btn btn-danger">view</button>
										<button class="btn btn-danger">Edit</button>
										
									</div>
									<p><b>${i.price}원</b></p>
								</div>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>