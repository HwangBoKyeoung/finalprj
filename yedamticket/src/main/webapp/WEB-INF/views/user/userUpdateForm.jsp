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
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="./resources/users/css/style.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat');

/*-------------------------------- END ----*/
*{
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

label{
	font-weight: bold;
	color: black;
	font-size: 15px;
}
</style>
</head>
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
		<!-- 모달창 -->
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
		<!-- /.modal -->
		<!--// 모달창 -->

		<!-- MAIN -->
		
		<div class="col-4" style="margin-left: auto; margin-right: auto;">
		<br><h2>회원정보 수정</h2><br>
			<form class="form-horizontal" role="form" method="post" id="form"
				action="userUpdate.do" onsubmit="return updateTest();">
				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-2 control-label">아이디</label>
					<div class="col-lg-10">
						<input type="text" class="form-control " id="UId" name="UId"
							value="${sessionId}" data-rule-required="true"
							readonly="readonly">
					</div>
				</div>
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="pwd" name="pwd"
							data-rule-required="true" placeholder="패스워드" maxlength="100"
							onkeyup="passConfirm1();" required="required">
					</div>
				</div>
				<p id="pppp" style="display: none;">비밀번호는 8자 이상이어야 하며, 숫자/특수문자를
					모두 포함해야 합니다</p>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
						확인</label>

					<div class="col-lg-10">
						<input type="password" class="form-control" id="pwd2" name="pwd2"
							data-rule-required="true" placeholder="패스워드 확인" maxlength="100"
							onkeyup="passConfirm2();" required="required">
					</div>
				</div>
				<div class="form-group" id="divName">
					<label for="inputName" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-10">
						<input type="text" class="form-control " id="name" name="name"
							value="${user.name }" data-rule-required="true" maxlength="15"
							readonly="readonly">
					</div>
				</div>

				<div class="form-group" id="divEmail">
					<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-10">
						<input type="email" class="form-control" id="email" name="email"
							value="${user.email }" data-rule-required="true"
							placeholder="이메일" maxlength="40" readonly="readonly">
					</div>
				</div>
				<div class="form-group" id="divPhoneNumber">
					<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
						번호</label>
					<div class="col-lg-10">
						<input type="tel" class="form-control onlyNumber"
							value="${user.phone }" id="phone" name="phone"
							data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."
							maxlength="11" onkeyup="phoneConfirm();">
					</div>
				</div>
				<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons location_pin"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="주소" required="required" id="addr" name="addr" maxlength="20" value="${user.addr }">
								<input type="text" class="form-control" placeholder="상세주소" required="required" id="addr2" name="addr2">
								<input type="hidden" id="sample6_extraAddress">
								<input type="hidden" id="sample6_postcode">
								<input type="button" id="AddrSample" onclick="findAddr();" value="주소찾기"> 
								<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>
							</div>

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10"><br>
						<button type="submit" class="btn btn-primary" id="submit_input">수정</button>
					</div>
				</div>
			</form>



		</div>
		<!-- Main Col END -->

	</div>
	<!-- body-row END -->


	<script>
		let passCnum1 = 1;
		let passCnum2 = 1;
		let phoneCnum = 1;

		$(function() {
			//모달을 전역변수로 선언
			var modalContents = $(".modal-contents");
			var modal = $("#defaultModal");
		});
		//------- validation 검사

		// 비밀번호 유효성 검사
		function passConfirm1() {
			var pw = $("#pwd").val();
			passCnum1 = 1
			var reg = /^(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			$("#pwd").parent().css("margin-bottom", 0)
			$("#pppp").css("display", "")
			$("#pppp").css("color", "#FE0A03")
			$("#pppp").css("font-size", "smaller")
			$("#pppp").css("text-align", "center")
			$("#pppp").text("비밀번호는 8자 이상이어야 하며, 숫자/특수문자를 모두 포함해야 합니다.")
			if (false === reg.test(pw)) {
				$("#pwd").css("color", "#FE0A03")
				$('#pwd').css("font-weight", "bold")
				console.log('비밀번호는 8자 이상이어야 하며, 숫자/특수문자를 모두 포함해야 합니다.');
			} else if (/(\w)\1\1\1/.test(pw)) {
				$("#pwd").css("color", "#FE0A03")
				passCnum1 = 1;
				console.log('같은 문자를 4번 이상 사용하실 수 없습니다.');
				return false;
			} else if (pw.search(/\s/) != -1) {
				$("#pwd").css("color", "#FE0A03")
				passCnum1 = 1;
				console.log("비밀번호는 공백 없이 입력해주세요.");
				return false;
			} else if (hangulcheck.test(pw)) {
				$("#pwd").css("color", "#FE0A03")
				passCnum1 = 1;
				console.log("비밀번호에 한글을 사용 할 수 없습니다.");
			} else {
				console.log("통과");
				$("#pwd").css("color", "#adeb4f")
				$('#pwd').css("font-weight", "bold")
				$("#pppp").text("조건을 충족합니다.")
				$("#pppp").css("color", "#adeb4f")
				$('#pppp').css("font-weight", "bold")
				$('#pppp').css("font-size", "15px")
				
				passCnum1 = 0;
			}
			console.log("passConfirm > " + passCnum1)
		}

		// 비밀번호 재 확인		
		function passConfirm2() {
			passCnum2 = 1;
			var password = document.getElementById('pwd'); //비밀번호
			var passwordConfirm = document.getElementById('pwd2'); //비밀번호 확인 값
			var passwordConfirmClassName = $('#pwd2').attr('name');
			if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
				$('#pwd2').css("color", "#adeb4f")
				passCnum2 = 0;
			} else {
				$('#pwd2').css("color", "#FE0A03")
				$('#pwd2').css("font-weight", "bold")
				passCnum2 = 1;
			}
			console.log("passConfirm2 > " + passCnum2)
		}

		// 휴대폰 번호 유효성 검사
		function phoneConfirm() {
			phoneCnum = 1;
			var phone = document.getElementById('phone').value;
			var regTel = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			if (!regTel.test(phone)) {
				console.log('올바른 전화번호를 입력하세요.');
				$('#phone').css("color", "#FE0A03");
				$('#phone').css("font-weight", "bold")
				phoneCnum = 1;
			} else {
				console.log('정상적인 전화번호입니다..!');
				$('#phone').css("color", "greenyellow")
				phoneCnum = 0;
			}
			console.log("phoneConfirm > " + phoneCnum)
		}

		function updateTest() {
			if (passCnum1 == 1) {
				alert("비밀번호를 확인해주세요.")
				return false;
			} else if (passCnum2 == 1) {
				alert("비밀번호를 확인해주세요.")
				return false;
			} else if (phoneCnum == 1) {
				alert("전화번호를 확인해주세요.")
				return false;
			} else {
				return true;
			}

		}
		
		// 주소찾기
	    function findAddr() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr2").focus();
	            }
	        }).open();
	    }
	</script>
</body>
</html>