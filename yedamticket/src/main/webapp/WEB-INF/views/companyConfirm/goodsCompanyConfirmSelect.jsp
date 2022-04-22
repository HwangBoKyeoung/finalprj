<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/users/js/core/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="col-md-10 grid-margin stretch-card">
<div class="card">
	<div class="card-body">
		<h4 class="card-title">굿즈 승인요청 상태</h4>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">굿즈번호</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="mvNo" name="mvNo" value="${comS.GNo }" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">굿즈이름</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="name" name="name" value="${comS.name }" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">영화/굿즈 구분</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="goodsCd" name="goodsCd" value="${comS.goodsCd }" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">기업 아이디</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="CId" name="CId" value="${comS.CId }" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">가격</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="price" name="price" value="${comS.price }" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">요청상태</label>
			<div class="col-sm-6">
				<select class="col-md-10" id="selectedval" name="confirm"
					data-loc="#" disabled="disabled">
					<option value="대기" <c:if test="${comS.confirm == '대기' }">selected</c:if>>대기</option>
					<option value="승인" <c:if test="${comS.confirm == '승인' }">selected</c:if>>승인</option>
					<option value="거부" <c:if test="${comS.confirm == '거부' }">selected</c:if>>거부</option>
				</select>
			</div>
		</div>
		<%-- <c:if test="${comS.confirm == '대기' }">
				<div class="form-group row">
				<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">요청현황</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" placeholder="--" id="refuseRs" name="refuseRs" value="심사중" readonly="readonly">
					</div>
				</div>
			</c:if> --%>
			<c:if test="${comS.confirm == '거부' }">
				<div class="form-group row">
					<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">거부사유</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="refuseRs" name="refuseRs" value="${comS.refuseRs }" readonly="readonly">
					</div>
				</div>
			</c:if>
	</div>
	</div>
	</div>
</body>
</html>