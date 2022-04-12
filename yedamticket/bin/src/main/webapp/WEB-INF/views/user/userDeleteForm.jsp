<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
=======
>>>>>>> develop
</head>
<style>
/* 사이드바 */
.sidenav {
	position: absolute;
	width: 200px;
	height: 100%;
	margin-left: -20px;
	margin-top: 50px
}
/* 본문 */
.page {
	margin-top: 50px;
	margin-left: 250px;
}
</style>
<body>
	<div class="container-fluid">
		<nav class="col-sm-3 sidenav">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="userUpdateForm.do">회원정보수정</a></li>
			</ul>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="userDeleteForm.do">회원탈퇴</a></li>
			</ul>
		</nav>
		<div class="col-sm-9 page">
			<div class="col-6">
				<h4 class="mb-3" align="left">회원탈퇴</h4><br>
				<form class="frm" action="userDelete.do" method="POST"
					onsubmit="alertt();">
					<div class="row g-3">
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control pw" name="pwd"
									id="pwd1" value="" placeholder="password" required>
							</div>
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호확인</label>&nbsp;&nbsp;<font
								id="checkPw" size="2"></font>
							<div class="input-group has-validation">
								<input type="password" class="form-control pw" name="pwd2"
									id="pwd2" value="" placeholder="password">
							</div>
							<input type="hidden" class="form-control" name="Uid" id="Uid" value="${sessionId}">
							<div align="right">
								<button type="submit" id="subBtn" class="btn btn-primary">탈퇴</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$("#subBtn").attr('disabled', true);
		$('.pw').keyup(function() {
			let pass1 = $("#pwd1").val();
			let pass2 = $("#pwd2").val();

			if (pass1 != "" || pass2 != "") {
				if (pass1 == pass2) {
					$("#checkPw").html('일치');
					$("#checkPw").attr('color', 'green');
					$("#subBtn").attr('disabled', false);
				} else {
					$("#checkPw").html('불일치');
					$("#checkPw").attr('color', 'red');
					$("#subBtn").attr('disabled', true);
				}
			}

		})

		function alertt() {
			alert("회원 탈퇴가 정상 처리 되엇습니다.")
		}
	</script>


</body>
</html>