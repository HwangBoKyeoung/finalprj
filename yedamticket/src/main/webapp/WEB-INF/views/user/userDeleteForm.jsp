<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/users/css/style.css">
</head>

<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat');

/*-------------------------------- END ----*/
#body-row {
	margin-left: 0;
	margin-right: 0;
}

#sidebar-container {
	min-height: 100vh;
	background-color: #132644;
	padding: 0;
	/* flex: unset; */
}

.sidebar-expanded {
	width: 230px;
}

.sidebar-collapsed {
	/*width: 60px;*/
	width: 100px;
}

/* ----------| Menu item*/
#sidebar-container .list-group a {
	height: 50px;
	color: white;
}

/* ----------| Submenu item*/
#sidebar-container .list-group li.list-group-item {
	background-color: #132644;
}

#sidebar-container .list-group .sidebar-submenu a {
	height: 45px;
	padding-left: 30px;
}

.sidebar-submenu {
	font-size: 0.9rem;
}

/* ----------| Separators */
.sidebar-separator-title {
	background-color: #132644;
	height: 35px;
}

.sidebar-separator {
	background-color: #132644;
	height: 25px;
}

.logo-separator {
	background-color: #132644;
	height: 60px;
}

a.bg-dark {
	background-color: #132644 !important;
}

label{
	font-weight: bold;
	color: black;
	font-size: 15px;
}
</style>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" style="height: 1000px;">
			<div class="custom-menu"></div>
			<div class="p-4 pt-5">
				<h1>
					<a href="userPage.do" class="logo">회원정보</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li><a href="userUpdateForm.do">회원정보수정</a></li>
					<li><a href="userDeleteForm.do">회원 탈퇴</a></li>
					<li><a href="userPage.do">마이페이지</a></li>
				</ul>

				<div class="mb-5">
					<h4 class="h6"></h4>
					<h4 class="h6"></h4>
					<h2 class="h6"></h2>
					<span></span><br> <span> </span><br> <span></span>

					<div class="form-group d-flex">
						<div class="icon">
							<span class="icon-paper-plane"></span>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<div class="modal fade" id="defaultModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">알림</h4>
					</div>
					<div class="modal-body">
						<p class="modal-contents"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<div class="col-4" style="margin-left: auto; margin-right: auto;">
		<br><h2>회원탈퇴</h2><br>
			<form class="frm" action="userDelete.do" method="POST" role="form">
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="pwd" name="pwd"
							data-rule-required="true" placeholder="패스워드" maxlength="10">
					</div>
				</div>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
						확인</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="pwd2" name="pwd2"
							data-rule-required="true" placeholder="패스워드 확인" maxlength="10">
							<input type="hidden" class="form-control" name="UId" id="UId"
					value="${sessionId}">
					</div>
				</div><br>
				<button type="submit" id="subBtn" class="btn btn-primary">탈퇴</button>
			</form>
		</div>
		</div>
	
	
	
	
	

	<script>
		/* $("#subBtn").attr('disabled', true);
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

		}) */

		function alertt() {
			alert("회원 탈퇴가 정상 처리 되엇습니다.")
		}

		$(function() {
			//모달을 전역변수로 선언
			var modalContents = $(".modal-contents");
			var modal = $("#defaultModal");

			$('#pwd').keyup(function(event) {

				var divPassword = $('#divPassword');

				if ($('#pwd').val() == "") {
					divPassword.removeClass("has-success");
					divPassword.addClass("has-error");
				} else {
					divPassword.removeClass("has-error");
					divPassword.addClass("has-success");
				}
			});

			$('#pwd2').keyup(function(event) {

				var passwordCheck = $('#pwd2').val();
				var password = $('#pwd').val();
				var divPasswordCheck = $('#divPasswordCheck');

				if ((passwordCheck == "") || (password != passwordCheck)) {
					divPasswordCheck.removeClass("has-success");
					divPasswordCheck.addClass("has-error");
				} else {
					divPasswordCheck.removeClass("has-error");
					divPasswordCheck.addClass("has-success");
				}
			});
			//------- validation 검사
			$("form").submit(
					function(event) {
						var divPassword = $('#divPassword');
						var divPasswordCheck = $('#divPasswordCheck');
						var divEmail = $('#divEmail');
						var divPhoneNumber = $('#divPhoneNumber');

						//패스워드 검사
						if ($('#pwd').val() == "") {
							modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
							modal.modal('show');

							divPassword.removeClass("has-success");
							divPassword.addClass("has-error");
							$('#pwd').focus();
							return false;
						} else {
							divPassword.removeClass("has-error");
							divPassword.addClass("has-success");
						}

						//패스워드 확인
						if ($('#passwordCheck').val() == "") {
							modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
							modal.modal('show');

							divPasswordCheck.removeClass("has-success");
							divPasswordCheck.addClass("has-error");
							$('#passwordCheck').focus();
							return false;
						} else {
							divPasswordCheck.removeClass("has-error");
							divPasswordCheck.addClass("has-success");
						}

						//패스워드 비교
						if ($('#pwd').val() != $('#pwd2').val()
								|| $('#pwd2').val() == "") {
							modalContents.text("패스워드가 일치하지 않습니다.");
							modal.modal('show');

							divPasswordCheck.removeClass("has-success");
							divPasswordCheck.addClass("has-error");
							$('#passwordCheck').focus();
							return false;
						} else {
							divPasswordCheck.removeClass("has-error");
							divPasswordCheck.addClass("has-success");
						}
					});
		});
	</script>


</body>
</html>