<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/users/js/core/jquery.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="col-md-10 grid-margin stretch-card">		
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Admin Insert</h4>
				<p class="card-description">Horizontal form layout</p>
				<form class="forms-sample" action="adminInsert.do">
					<div class="form-group row">
						<label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								id="mId" name="mId" placeholder="ID">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label">Password</label>
						<div class="col-sm-9">
							<input type="password" class="form-control"
								id="pwd" name="pwd" placeholder="Password">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Name</label>
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
							<input type="text" class="form-control" id="phone" name="phone"
								placeholder="Mobile number">
						</div>
					</div>
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label">AuthCode</label>
						<div class="input-group-prepend">
                          	<select name="authCd" id="selected">
	                          	<option value="영화" >영화담당자</option>
	                          	<option value="공연">공연담당자</option>
	                          	<option value="굿즈">굿즈담당자</option>
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
	</script>
</body>
</html>