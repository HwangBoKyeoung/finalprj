<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<style>
/* 사이드바 */
.sidenav {
	position: absolute;
	width: 200px;
	height: 100%;
	margin-left: 20px;
	margin-top: 50px
}
/* 본문 */
.page {
	margin-top: 50px;
	margin-left: 250px;
}
</style>
</head>
<body>
	<div class="container-flUId">
		<nav class="col-sm-3 sidenav">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="userUpdateForm.do">회원정보수정</a></li>
			</ul>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="userDeleteForm.do">회원탈퇴</a></li>
			</ul>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="userPage.do">마이페이지</a></li>
			</ul>
		</nav>

		<div class="col-sm-9 page">
			<div class="col-6">
				<h4 class="mb-3" align="left">회원정보수정</h4>
				<form class="frm" action="userUpdate.do" method="POST"
					onsubmit="alertt();" id="frms">

					<div class="row g-3">
						<div class="col-12" align="left">
							<label for="UId" class="form-label">아이디</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="UId" id="UId"
									value="${sessionId}" placeholder="Id" readonly="readonly">
							</div>
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control pw" name="pwd"
									id="pwd" value="" placeholder="password" required="required"
									maxlength="10">
							</div>
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호확인</label>&nbsp;&nbsp;<font
								id="checkPw" size="2"></font>
							<div class="input-group has-validation">
								<input type="password" class="form-control pw" name="pwd2"
									id="pwd2" value="" placeholder="password" maxlength="10" required="required"
									onkeyup="passConfirm()">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="username" class="form-label">이름</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="name" name="name"
									value="${user.name }" placeholder="Username"
									readonly="readonly">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="phone" class="form-label">이메일</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="email" id="email" onkeyup="emailConfirm()"
									value="${user.email }" placeholder="your@email.com.." required="required">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="phone" class="form-label">전화번호</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="phone" id="phone"
									value="${user.phone }" placeholder="phone" required="required"
									maxlength="11" onkeyup="phoneConfirm()">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="addr" class="form-label">주소</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="addr" id="addr"
									value="${user.addr }" placeholder="address..." required>
								<input type="button" onclick="execDaumPostcode()" class="btn-sm"
									value="주소찾기">
							</div>
							<div align="right">
								<button id="updateBtn" type="submit" class="btn btn-primary"
									onclick="fn_submit()">수정</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		/* 	let data = {
		 UId: $("#UId").val(),
		 pwd: $("#pwd").val(),
		 name:$("#name").val(),
		 addr: $("#addr").val(),
		 phone: $("#phone").val(),
		 email: $("#email").val()
		 }
		 */

		/* $.ajax({
			type:"POST",
			url:"userUpdate.do",
			 data: JSON.stringify($("#frms").serialize()),
		     contentType: "application/json; charset=utf-8",
		     dataType: "json",
			success : function(res){
				if(res.length>0){
					alert("회원정보 수정이 완료되었습니다");	
				}
			},
			error:function(){
				alert("실패");
			} 
			
		});*/

		// 휴대폰 번호 유효성 검사
		function phoneConfirm() {
			var phone = document.getElementById('phone').value;
			var regTel = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			if (!regTel.test(phone)) {
				console.log('올바른 전화번호를 입력하세요.');
				$('#phone').css("color", "#FE0A03");
				$('#phone').css("font-weight", "bold")
				$("#updateBtn").attr('disabled',true);
				phoneCnum = 1;
			} else {
				console.log('정상적인 전화번호입니다..!');
				$('#phone').css("color", "rgb(4 0 255)")
				$("#updateBtn").attr('disabled',false);
				phoneCnum = 0;
			}
		}

		// 비밀번호 확인		
		function passConfirm() {
			var password = document.getElementById('pwd'); //비밀번호
			var passwordConfirm = document.getElementById('pwd2'); //비밀번호 확인 값
			var passwordConfirmClassName = $('#pwd2').attr('name');
			if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
				$('#pwd2').css("color", "green")
				$("#checkPw").html('일치');
				$("#checkPw").attr('color', 'green');
				$("#updateBtn").attr('disabled',false);
				passCnum = 0;

			} else {
				$('#pwd2').css("color", "#FE0A03")
				$('#pwd2').css("font-weight", "bold")
				$("#checkPw").html('불일치');
				$("#checkPw").attr('color', '#FE0A03');
				$("#updateBtn").attr('disabled',true);
				
				passCnum = 1;

			}
		}
		
		function emailConfirm() {
			var email = document.getElementById('email').value;

			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if (!regEmail.test(email)) {
				console.log('올바른 이메일를 입력하세요.');
				$('#email').css("color", "#FE0A03");
				$('#email').css("font-weight", "bold")
				$("#updateBtn").attr('disabled',true);
				phoneCnum = 1;
			} else {
				console.log('정상적인 이메일입니다..!');
				$('#email').css("color", "rgb(4 0 255)")
				$("#updateBtn").attr('disabled',false);
				phoneCnum = 0;
			}
		}
		
		
		
		

		/* $("#updateBtn").attr('disabled',true);
		$('.pw').keyup(function(){
			let pass1 = $("#pwd1").val();
		    let pass2 = $("#pwd2").val();
		    
		    if (pass1 != "" || pass2 != ""){
		    	if (pass1 == pass2){
		        	$("#checkPw").html('일치');
		        	$("#checkPw").attr('color','green');
		        	$("#updateBtn").attr('disabled',false);
		        } else {
		        	$("#checkPw").html('불일치');
		            $("#checkPw").attr('color','red');
		            $("#updateBtn").attr('disabled',true);
		        }
		    }
		
		}) 
		 */

		function alertt() {
			alert("회원정보가 수정되었습니다.")
		}

		function execDaumPostcode() {
			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						$("#addr").val(data.roadAddress);
					}
				}).open();
			});
		}
	</script>
</body>
</html>