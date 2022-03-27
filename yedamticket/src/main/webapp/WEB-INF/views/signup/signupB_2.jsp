<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./resources/users/img/apple-icon.png">
<link rel="icon" type="image/png" href="./resources/users/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

<!-- CSS Files -->
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>

</head>
<body>
<div class="section section-signup" style="background-image: url('./resources/users/img/bg8.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
        <div class="container">
          <div class="row">
            <div class="card card-signup" data-background-color="black"> 
              <form class="form" method="POST" action="signup_4.do">
                <div class="card-header text-center">
                  <h3 class="card-title title-up">기업회원가입</h3>
                  <div class="social-line">
                  	<img src="./resources/signup/yedamticket.png">
                  </div>
                </div>
                <div class="card-body">
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons users_circle-08"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="기업명" required="required" id ="name" name = "name">
                  </div>
                  
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons users_circle-08"></i>
                      </span>
                    </div>
                    <input type="text" placeholder="아이디" class="form-control" required="required" id = "Uid" name = "Uid"/>
                  </div>
                  
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons ui-1_lock-circle-open"></i>
                      </span>
                    </div>
                    <input type="password" class="form-control" placeholder="비밀번호" required="required" id = "pwd" name = "pwd">
                  </div>
                  
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons ui-1_lock-circle-open"></i>
                      </span>
                    </div>
                    <input type="password" class="form-control" placeholder="비밀번호 확인" required="required" id = "pwd2" name = "pwd2">
                  </div>
                  
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons ui-1_email-85"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="이메일" value="${email }" readonly="readonly" id = "email" name = "email">
                  </div>
                  
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons location_pin"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="주소" required="required" id = "addr" name = "addr">
                  </div>
                  
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons tech_mobile"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="연락처" required="required" id = "phone" name = "phone">
                  </div>
                  
                  <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons business_badge"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="생년월일(8자리로 입력)" required="required" id = "birth" name = "birth">
                  </div>
                 
                 <div class="input-group no-border">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="now-ui-icons business_badge"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control" placeholder="사업자등록번호" required="required" id = "" name = "">
                    <button type="button">확인</button>
                  </div>
                 
              	<!-- CAPTCHA -->   
               <div class="g-recaptcha" data-sitekey="6LfYlAwfAAAAACBsy1BXNVfkU1LhB6cYOzfPBAGN"></div>
               
                </div>
                
                <div class="card-footer text-center" >
                  <input type = "submit" class="btn btn-neutral btn-round btn-lg" disabled="disabled">
                  <button type="button" id="submit_btn" class="btn btn-neutral btn-round btn-lg">봇확인</button>
                </div>
              </form>
            </div>
          </div>
          <div class="col text-center"> 
            <a href="login.do" class="btn btn-outline-default btn-round btn-white btn-lg" target="_blank">로그인 페이지로</a>
          </div>
        </div>
      </div>
      <script>
/*  $(function() {
	$('#submit_btn').submit(function() {
			var captcha = 1;
			$.ajax({
	            url: '/prj/VerifyRecaptcha',
	            type: 'post',
	            data: {
	                recaptcha: $("#g-recaptcha-response").val()
	            },
	            success: function(data) {
	                switch (data) {
	                    case 0:
	                        console.log("자동 가입 방지 봇 통과");
	                        captcha = 0;
	                		break;
	                    case 1:
	                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
	                        break;
	                    default:
	                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
	                   		break;
	                }
	            }
	        });
			if(captcha != 0) {
				return false;
			} 
	});
	});  */
 $(document).ready(function() {
        $("#submit_btn").click(function() {
            $.ajax({
                url: '/VerifyRecaptcha',
                type: 'post',
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
                success: function(data) {
                    switch (data) {
                        case 0:
                            alert("자동 가입 방지 봇 통과");
                            break;

                        case 1:
                            alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                            break;

                        default:
                            alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                            break;
                    }
                }
            });
        });
    });
</script>
</body>
</html> 