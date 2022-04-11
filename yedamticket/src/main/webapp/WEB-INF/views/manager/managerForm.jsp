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
	<div class="col-md-10 grid-margin stretch-card">
		<div class="card">
		
			<div class="card-body">
				<h4 class="card-title">Admin Insert</h4>
				<p class="card-description">Horizontal form layout</p>
				<form class="forms-sample" action="managerInsert.do" method="post" onsubmit="return chec_id();">
				
					<div class="form-group row">
						<label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="MId" name="MId" placeholder="ID">
							<button type="button" class="btn btn-light" id="idCheck" name="idCheck" onclick="fn_idCheck();" value="N">중복체크</button>
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label">Password</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputConfirmPassword2"
							class="col-sm-3 col-form-label">Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputEmail2" class="col-sm-3 col-form-label">Depart</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="depart" name="depart">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label">Phone</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone" placeholder="Mobile number">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label">AuthCode</label>
						<div class="input-group-prepend">
							<select name="authCd" id="selected">
								<option value="movie">영화담당자</option>
								<option value="consert">공연담당자</option>
								<option value="goods">굿즈담당자</option>
							</select>
						</div>
					</div>
					
					<button type="submit" class="btn btn-gradient-primary me-2">INSERT</button>
					<button class="btn btn-light" type="reset">Cancel</button>
					
				</form>
			</div>
		</div>
	</div>
	
	<script>
		let selected = $("#selected option:selected").val();
		console.log(selected);
		
		function chec_id(){
			if($("#idCheck").val() == 'N'){
				alert('아이디중복체크를 하세요');
				return false;
			}
			return true;
		}

		function fn_idCheck() {
			$.ajax({
				url : "idCheck.do",
				type : "POST",
				dataType : "json",
				data : {
					"MId" : $("#MId").val()
				},
				success : function(data) {
					if (data >= 1) {
						alert('중복');
					} else if (data == 0) {
						$("#idCheck").val('Y');
						alert("사용가능한 아이디 입니다");
					}
				}
			})
		}
	</script>
</body>
</html>