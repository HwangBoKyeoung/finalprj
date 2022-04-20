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
	<div>
		<div class="col-md-10 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">관리자 영화 승인요청 상세 페이지</h4>
					<input type="hidden" name="#" id="#" value="#">
					<input type="button" name="mvNo" id="mvNo" value="상세보기">
					<input type="hidden" name="#" id="#" value="#">
					<p class="card-description"></p>
					<form class="forms-sample" action="#" method="post">
					<input type="hidden" name="#" id="#" value="#" >
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">---</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="#" name="#" value="#">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">---</label>
							<div class="col-sm-6">
						 	<input type="date" class="form-control" id="#" name="#" value="#" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">#</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="#" name="#" value="#">
							</div>
						</div>						
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">---</label>
							<div class="col-sm-9">
								<select class="col-md-10" id="#" name="#"
										data-loc="#">
									<option value="대기" <c:if test="#">selected</c:if>>대기</option>
									<option value="승인" <c:if test="#">selected</c:if>>승인</option>
									<option value="거절" <c:if test="#">selected</c:if>>거절</option>
								</select>
							</div>
						</div>
						<button type="submit" class="btn btn-gradient-primary me-2">요청처리</button>
						<button class="btn btn-light" type="reset">Cancel</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>