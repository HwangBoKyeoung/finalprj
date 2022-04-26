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
* {
	list-style: none;
}

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

label {
	font-weight: bold;
	color: black;
	font-size: 15px;
}

.form-control {
	border: 1px solid #cec5e9;
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
		
		<div class="col-4" style="margin-left: auto; margin-right: auto;">
			<br>
			<h2>회원탈퇴</h2>
			<br>
			<p class="lead">회원탈퇴를 하실려면 비밀번호를 입력해주세요.</p>
			<form class="frm" action="userDelete.do" method="POST" id="deleteForm" >
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-4 control-label">패스워드</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="pwd" name="pwd"
							data-rule-required="true" placeholder="패스워드" maxlength="10">
					</div>
				</div>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-4 control-label">패스워드
						확인</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="pwd2" name="pwd2"
							data-rule-required="true" placeholder="패스워드 확인" maxlength="10">
						<input type="hidden" class="form-control" name="UId" id="UId"
							value="${sessionId}">
					</div>
				</div>
				<br>
				 <button type="button" id="deletee" name="delete" class="btn btn-primary">회원탈퇴</button>
			</form>
		</div>
	</div>






	<script>
	
	$(document).ready(function(){
		
		$("#deletee").on("click", function(){
			
			if($("#pwd").val()==""){
				swal('회원정보 수정', '비밀번호를 입력해주세요');
				$(".swal-button--confirm").on("click", function(){
					location.href= reload()
				});
				$("#pwd").focus();
				return false
			}
			
			if($("#pwd2").val()==""){
				swal("비밀번호 확인을 입력해주세요");
				$(".swal-button--confirm").on("click", function(){
					location.href= reload()
				});
				$("#pwd2").focus();
				return false
			}
			
			if ($("#pwd").val() != $("#pwd2").val()) {
				swal("비밀번호가 일치하지 않습니다.");
				$(".swal-button--confirm").on("click", function(){
					location.href= reload()
				});
				$("#pwd").focus();
				 
				return false;
				}
			
			$.ajax({
				url : "pwdCheck.do",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success: function(data){
					
					if(data==0){
						swal("비밀번호를 확인해주세요.");
						$(".swal-button--confirm").on("click", function(){
							location.href= reload()
						});
						return;
					}else{
						  swal({
						         title: "정말 탈퇴 하시겠습니까?",
						         icon: "warning",
						         buttons: true,
						         dangerMode: true,
						       })
						       .then((willDelete) => {
						         if (willDelete) {
						           swal("회원탈퇴가 정상 처리 되었습니다", {
						             icon: "success",
						           });
						           $("#deleteForm").submit();
						         } else {
						           swal("취소하셨습니다");
						         }
						       });
						
					}
				}
			})
		});
	})
	
	</script>
</body>
</html>