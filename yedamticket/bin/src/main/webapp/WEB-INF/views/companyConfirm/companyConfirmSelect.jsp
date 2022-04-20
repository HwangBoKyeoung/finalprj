<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		<div class="col-sm-9">
			<textarea rows="7" cols="20" class="form-control"
				placeholder="거부사유" id="#" name="#" >#</textarea>
		</div>
	</div>
</body>
</html>