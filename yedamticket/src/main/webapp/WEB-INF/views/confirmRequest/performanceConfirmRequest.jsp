<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h4 class="card-title">관리자 공연 승인요청 상세 페이지</h4>
					<input type="hidden" name="pNo" id="pNo" value="${conS.PNo }">
					<p class="card-description"></p>
					<form class="forms-sample" action="perforConfirmUpdate.do" method="post">
					<input type="hidden" name="pNo" id="pNo" value="${conS.PNo }">
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">공연번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="pNo" name="pNo" value="${conS.PNo }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">담당기업</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="CId" name="CId" value="${conS.CId }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">공연제목</label>
							<div class="col-sm-6">
						 	<input type="text" class="form-control" id="name" name="name" value="${conS.name }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">공연설명</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="content" name="content" value="${conS.content }" readonly="readonly">
							</div>
						</div>		
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">공연장소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="addr" name="addr" value="${conS.addr }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">가격</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="price" name="price" value="${conS.price }" readonly="readonly">
							</div>
						</div>
						<%-- <div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">공연포스터</label>
							<div class="col-sm-6">
								<input type="file" class="form-control" id="fileCd" name="fileCd" value="${conS.fileCd }">
							</div>
						</div> --%>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">요청상태</label>
							<div class="col-sm-9">
								<select class="col-md-10" id="selectedval" name="confirm"
										data-loc="#">
									<option value="대기" <c:if test="${conS.confirm == '대기' }">selected</c:if>>대기</option>
									<option value="승인" <c:if test="${conS.confirm == '승인' }">selected</c:if>>승인</option>
									<option value="거부" <c:if test="${conS.confirm == '거부' }">selected</c:if>>거부</option>
								</select>
							</div>
						</div>
							<div class="form-group row" id="selectedShow" style="display:none">
								<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">거부사유</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="거부사유" id="refuseRs" name="refuseRs" value="${conS.refuseRs }">
									</div>
								</div>
						<button type="submit" class="btn btn-gradient-primary me-2">요청처리</button>
						<button class="btn btn-light" type="reset">Cancel</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$("#selectedval").change(function() {
		if($(this).val()=='거부'){
			$("#selectedShow").show();
		} else{
			$("#selectedShow").empty();
		}
		});
	</script>
</body>
</html>