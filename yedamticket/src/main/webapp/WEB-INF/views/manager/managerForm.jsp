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
				<h4 class="card-title">관리자 등록</h4>
				<form class="forms-sample" action="managerInsert.do" method="post" onsubmit="return chec_id();">
				
					<div class="form-group row">
						<label for="exampleInputUsername2" class="col-sm-3 col-form-label">아이디</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="MId" name="MId" placeholder="ID">
							<button type="button" class="btn btn-light" id="idCheck" name="idCheck" onclick="fn_idCheck();" value="N">중복체크</button>
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputPassword2" class="col-sm-3 col-form-label">비밀번호</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required="required">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputConfirmPassword2"
							class="col-sm-3 col-form-label">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name" required="required">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputEmail2" class="col-sm-3 col-form-label">부서</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="depart" name="depart" required="required">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label">전화번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone" placeholder="Mobile number" required="required">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="exampleInputMobile" class="col-sm-3 col-form-label">권한</label>
						<div class="input-group-prepend">
							<select name="authCd" id="selected">
								<option value="movie">영화담당자</option>
								<option value="performance">공연담당자</option>
							</select>
						</div>
					</div>
					
					<button type="submit" class="btn btn-gradient-primary me-2">등록</button>
					<input type="button" class="btn btn-light" type="reset" value="취소" onclick="location.href='manager.do'">					
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