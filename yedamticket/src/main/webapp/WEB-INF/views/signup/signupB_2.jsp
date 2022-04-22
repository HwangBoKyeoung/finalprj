<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" sizes="76x76" href="./resources/users/img/apple-icon.png">
<link rel="icon" type="image/png" href="./resources/users/img/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> -->
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="section section-signup" style="background-image: url('./resources/users/img/bg8.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
		<div class="container">
			<div class="row">
				<div class="card card-signup" data-background-color="black">
					<form class="form" method="POST" action="signupB_3.do" onsubmit='return check_recaptcha();'>
						<input type="hidden" name="bizno" id="bizno">
						<div class="card-header text-center">
							<h3 class="card-title title-up">기업회원가입</h3>
							<div class="social-line">
								<img src="./resources/yedamticket.png">
							</div>
						</div>
						<div class="card-body">
							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="기업명(담당인)" required="required" id="name" name="name">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons users_circle-08"></i>
									</span>
								</div>
								<input type="text" placeholder="아이디" class="form-control" required="required" id="CId" name="CId" onkeyup="idbtnC();"/>
								<button type="button" class="cidChk" id="cidChk" value="N" onclick="fn_idChk()">중복체크</button>
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								<input type="password" class="form-control" placeholder="비밀번호" required="required" id="pwd" name="pwd">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_lock-circle-open"></i>
									</span>
								</div>
								<input type="password" class="form-control" placeholder="비밀번호 확인" required="required" id="pwd2" name="pwd2" onkeyup="passConfirm()">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons ui-1_email-85"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="이메일" value="${all }" readonly="readonly" id="email" name="email">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons location_pin"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="주소" required="required" id="addr" name="addr">
								<input type="text" class="form-control" placeholder="상세주소" required="required" id="addr2" name="addr2">
								<input type="hidden" id="sample6_extraAddress">
								<input type="hidden" id="sample6_postcode">
								<input type="button" id="AddrSample" onclick="findAddr();" value="주소찾기"> 
								<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons tech_mobile"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="연락처" required="required" id="phone" name="phone" onkeyup="phoneConfirm()">
							</div>

							<div class="input-group no-border">
								<div class="input-group-prepend">
									<span class="input-group-text"> 
										<i class="now-ui-icons business_badge"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="사업자등록번호('-'기호 제거후 입력)" required="required" id="nono" name="nono">
								<button type="button" class="bizChk" id="bizChk" value="N" onclick="biznoConfirm()">중복체크</button>
							</div>

							<div class="input-group no-border" align="center"> 
								<p style="font-size: 13px; width : 100vw; margin : 0">개인 간 양도 / 양수 계약에 대한 동의 <button type="button" data-toggle="modal" data-target="#modal">읽기</button> </p>
								<input type="hidden" id="transferChk" value="N">
								<!-- Modal -->
								      
								<div class="modal fade" id="modal">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      안녕하세요. 공연 및 영화 예매와 티켓양도거래를 위한 서비스를 제공하는 YD TICKET입니다. 저희 (주)예담티켓을 이용해 주셔서 진심으로 감사드립니다.
								      (주)예담티켓을 이용하시기 위해서는 귀 사의 영화, 공연티켓과 굿즈를 일반회원들 간 거래가 가능하도록 양도 허가를 해주셔야 회원가입이 가능합니다.
								      </div>
								      <div class="modal-footer" style="display:block">
								      	<p>동의하시면 확인을 눌러주세요.</p><br>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								        <input type="button" class="btn btn-primary" onclick="transferAgree();" value="확인">
								      </div>
								    </div>
								  </div>
								</div>
								<!-- Modal End -->					
							</div>

							<!-- CAPTCHA -->
							<div class="g-recaptcha" align="center" data-sitekey="6LfYlAwfAAAAACBsy1BXNVfkU1LhB6cYOzfPBAGN"></div>
							</div>

						<div class="card-footer text-center">
							<input type="submit" id="submit_input" class="btn btn-neutral btn-round btn-lg">
						</div>
					</form>
				</div>
			</div>
			<div class="col text-center">
				<a href="login.do"
					class="btn btn-outline-default btn-round btn-white btn-lg"
					target="_blank">로그인 페이지로</a>
			</div>
		</div>
	</div>
	
	<script>
	// 이메일(세션값) 값 검증
	$(document).ready(function(){
		var email = $("#email").val()
		if(email == ''){
			alert("세션이 만료되었습니다 이메일을 확인해 주세요..")
			return $(location).attr('href', 'signupB_1.do')
		}
	})
		
	// 양도 권한
	function transferAgree(){
		$("#transferChk").val("Y")
		$('#modal').modal('hide')
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
	
	// 리캡챠 및 submit버튼 확인
	function check_recaptcha() {
		if ($('#cidChk').val() == 'N') {
			alert('아이디 중복체크 하세요')
			return false;
		}
		if (passCnum == 1) {
			alert("비밀번호를 확인해주세요.")
			return false
		}
		if ($('#bizChk').val() == 'N') {
			alert('사업자 등록번호 중복체크 하세요.')
			return false
		}
		if ($('#transferChk').val() == 'N') {
			alert('양도 계약에 동의해 주세요.')
			return false
		}
		
		var v = grecaptcha.getResponse()
		if (v.length == 0) {
			alert("자동가입방지를 체크해주세요.")
			return false;
		} else {
			return true;
		}
	}
	// 아이디 중복확인
	function fn_idChk() {
		$.ajax({
			url: "cidChk",
			type: "post",
			dataType: "json",
			data: {
				"CId": $("#CId").val()
			},
			success: function(data) {
				if (data == 1) {
					$("#cidChk").val('N');
					alert("중복된 아이디 입니다..");
					idCnum = 1;
				} else if (data == 0) {
					$("#cidChk").val('Y');
					alert("사용가능한 아이디 입니다.");
					idCnum = 0;
				} else {
					alert("아이디를 입력해주세요.");
				}
			}
		})
	}
	// 시작 시 비활성화로 시작
	$('#idChk').attr("disabled", true)
	
	// id가 비어있을 때 중복확인 버튼 비활성화
	function idbtnC(){
		if($('#UId').val().length < 1){
			$('#idChk').attr("disabled", true)
		}else{
			$('#idChk').attr("disabled", false)
		}
	}
	
	// 휴대폰 번호 유효성 검사
	function phoneConfirm() {
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
	}
	// 비밀번호 확인
	function passConfirm() {
		var password = document.getElementById('pwd'); //비밀번호 
		var passwordConfirm = document.getElementById('pwd2'); //비밀번호 확인 값
		var passwordConfirmClassName = $('#pwd2').attr('name');
		if (password.value == passwordConfirm.value) {//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			$('#pwd2').css("color", "greenyellow")
			passCnum = 0;
		} else {
			$('#pwd2').css("color", "red")
			passCnum = 1;
		}
	}
	// 사업자등록번호 유효성 검사
	function biznoConfirm() {
		// 샘플용 사업자등록번호(카카오) : 5048600471 
		var bizno = $('#nono').val()
		var data = {
			b_no: [bizno],
		}
		$.ajax({
			url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=N%2FyDCz6DnRrV45AM81yqvJ9T0C1jPO6x8V8bh1ZUPRwTHQg9C%2B3vOgc6%2FtZcvfaQAwypSKSxXNUW2cpmJBqoZA%3D%3D",
			type: "POST",
			data: JSON.stringify(data), // json 을 string으로 변환하여 전송
			dataType: "JSON",
			contentType: "application/json",
			accept: "application/json",
			success: function(result) {
				var bnum = result.data[0].b_stt_cd
				if (bnum == 1) {
					$('#bizChk').val("Y")
					$('#bizno').attr("disabled", true)
					$("#bizno").val($("#nono").val());
					alert("확인되었습니다.")
				} else {
					$('#bizChk').val("N")
					alert("존재하지 않는 사업자등록번호 정보입니다.")
				}
			},
			error: function(result) {
				console.log(result.responseText) //responseText의 에러메세지 확인
			},
		})
	}
	// 주소와 상세주소 합치기
	
	
	</script>
	
</body>
</html>
