<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group row">
	<c:if test="${not empty GNo}">
		<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">굿즈 승인 요청</label>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">#</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="#" name="#" value="#" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">#</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="#" name="#" value="#" readonly="readonly">
			</div>
		</div>
			<div class="col-sm-9">
				<select class="col-md-10" id="selectedval" name="confirm"
					data-loc="#">
					<option value="대기" <c:if test="#">selected</c:if>>대기</option>
					<option value="승인" <c:if test="#">selected</c:if>>승인</option>
					<option value="거절" <c:if test="#">selected</c:if>>거절</option>
				</select>
			</div>
		<div class="col-sm-9" id="show">
			<textarea rows="7" cols="20" class="form-control"
				placeholder="거부사유" id="refusal" name="refuseRs" >${refuseRs }</textarea>
		</div>
	</c:if>
	<c:if test="${not empty PNo}">
		<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">---</label>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">#</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="#" name="#" value="#" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">#</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="#" name="#" value="#" readonly="readonly">
			</div>
		</div>
			<div class="col-sm-9">
				<select class="col-md-10" id="selectedval" name="confirm"
					data-loc="#">
					<option value="대기" <c:if test="#">selected</c:if>>대기</option>
					<option value="승인" <c:if test="#">selected</c:if>>승인</option>
					<option value="거절" <c:if test="#">selected</c:if>>거절</option>
				</select>
			</div>
		<div class="col-sm-9" id="show">
			<textarea rows="7" cols="20" class="form-control"
				placeholder="거부사유" id="refusal" name="refuseRs" >${refuseRs }</textarea>
		</div>
	</c:if>
	<c:if test="${not empty MvNo}">
		<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">---</label>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">#</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="#" name="#" value="#" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="exampleInputUsername2" class="col-sm-3 col-form-label">#</label>
			<div class="col-sm-6">
		 	<input type="text" class="form-control" id="#" name="#" value="#" readonly="readonly">
			</div>
		</div>
			<div class="col-sm-9">
				<select class="col-md-10" id="selectedval" name="confirm"
					data-loc="#">
					<option value="대기" <c:if test="#">selected</c:if>>대기</option>
					<option value="승인" <c:if test="#">selected</c:if>>승인</option>
					<option value="거절" <c:if test="#">selected</c:if>>거절</option>
				</select>
			</div>
		<div class="col-sm-9" id="show">
			<textarea rows="7" cols="20" class="form-control"
				placeholder="거부사유" id="refusal" name="refuseRs" >${refuseRs }</textarea>
		</div>
	</c:if>
	</div>
</body>
<script type="text/javascript">
$("#selectedval").change(function() {
	/* alert($(this).val()); */
	if($(this).val()=='거절'){
		$("#refusal").show();
	} else{
		$("#show").empty();
	}
	});
</script>
</html>