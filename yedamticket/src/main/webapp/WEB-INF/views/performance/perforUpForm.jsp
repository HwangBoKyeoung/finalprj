<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/users/js/core/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div>
		<div class="col-md-10 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Performance Update</h4>
					<p class="card-description"></p>
					<form class="forms-sample" action="performanceUpdate.do"
						method="post">
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">공연번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="PNo" name="PNo"value="${pers.PNo}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">공연이름</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name"value="${pers.name}">
							</div>
						</div>
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputPassword2" -->
<!-- 								class="col-sm-3 col-form-label">공연설명</label> -->
<!-- 							<div class="col-sm-9"> -->
<!-- 								<input type="text" class="form-control" id="content" name="content" -->
<%-- 									value="${pers.content}" placeholder="Password"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputConfirmPassword2" -->
<!-- 								class="col-sm-3 col-form-label">출연자이름</label> -->
<!-- 							<div class="col-sm-9"> -->
<%-- 								<input type="text" class="form-control" id="actor" name="actor" value="${pers.actor }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputConfirmPassword2" -->
<!-- 								class="col-sm-3 col-form-label">공연장</label> -->
<!-- 							<div class="col-sm-9"> -->
<%-- 								<input type="text" class="form-control" id="loc" name="loc" value="${pers.loc }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputConfirmPassword2" -->
<!-- 								class="col-sm-3 col-form-label">공연장 상세주소</label> -->
<!-- 							<div class="col-sm-9"> -->
<%-- 								<input type="text" class="form-control" id="addr" name="addr" value="${pers.addr }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputConfirmPassword2" -->
<!-- 								class="col-sm-3 col-form-label">공연가격</label> -->
<!-- 							<div class="col-sm-9"> -->
<%-- 								<input type="text" class="form-control" id="price" name="price" value="${pers.price }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputConfirmPassword2" -->
<!-- 								class="col-sm-3 col-form-label">공연이미지</label> -->
<!-- 							<div class="col-sm-9"> -->
<%-- 								<input type="file" class="form-control" id="price" name="price" value="${pers.price }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputConfirmPassword2" -->
<!-- 								class="col-sm-3 col-form-label">공연일정</label> -->
<!-- 							<div class="col-sm-9"> -->
<%-- 								<input type="date" class="form-control" id="price" name="price" value="${pers.price }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="exampleInputConfirmPassword2" -->
<!-- 								class="col-sm-3 col-form-label">공연영상</label> -->
<!-- 							<div class="col-sm-9"> -->
<%-- 								<input type="file" class="form-control" id="price" name="price" value="${pers.price }"> --%>
<!-- 							</div> -->
<!-- 						</div> -->
						<button type="submit" class="btn btn-gradient-primary me-2">Update</button>
						<button class="btn btn-light" type="reset">Cancel</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>