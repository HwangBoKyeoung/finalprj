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
	<link href="./resources/users/css/sidebars.css" rel="stylesheet">
	<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet">
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

</style>
</head>
<body>
	<div class="container-fluid p-0">
  
  <!-- Bootstrap row -->
  <div class="row" id="body-row">
      <!-- Sidebar -->
      <div id="sidebar-container" class="sidebar-expanded d-none d-md-block"><!-- d-* hiddens the Sidebar in smaller devices. Its itens can be kept on the Navbar 'Menu' -->
          <!-- Bootstrap List Group -->
          <ul class="list-group">
              <!-- Separator with title -->
              <!-- /END Separator -->
              <!-- Menu with submenu -->
              <a href="userUpdateForm.do"  class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
                  <div class="d-flex w-100 justify-content-start align-items-center">
                      <span class="fa fa-dashboard fa-fw mr-3"></span> 
                      <span class="menu-collapsed">회원정보 수정</span>
                      <span class="submenu-icon ml-auto"></span>
                  </div>
              </a>
              <a href="userDeleteForm.do" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
                  <div class="d-flex w-100 justify-content-start align-items-center">
                      <span class="fa fa-user fa-fw mr-3"></span>
                      <span class="menu-collapsed">회원 탈퇴</span>
                      <span class="submenu-icon ml-auto"></span>
                  </div>
              </a>    
               <a href="userPage.do" class="bg-dark list-group-item list-group-item-action flex-column align-items-start">
                  <div class="d-flex w-100 justify-content-start align-items-center">
                      <span class="fa fa-user fa-fw mr-3"></span>
                      <span class="menu-collapsed">마이페이지</span>
                      <span class="submenu-icon ml-auto"></span>
                  </div>
              </a>      
              <!-- Separator without title -->
              <li class="list-group-item sidebar-separator menu-collapsed"></li>               
          </ul><!-- List Group END-->
      </div><!-- sidebar-container END -->
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
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!--// 모달창 -->
  
      <!-- MAIN -->
      <div class="col">
          
        <form class="form-horizontal" role="form" method="post"
        action="userUpdate.do">
        <div class="form-group" id="divId">
          <label for="inputId" class="col-lg-2 control-label">아이디</label>
          <div class="col-lg-10">
            <input type="text" class="form-control " id="UId" name="UId" value="${sessionId}"
              data-rule-required="true">
          </div>
        </div>
        <div class="form-group" id="divPassword">
          <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
          <div class="col-lg-10">
            <input type="password" class="form-control" id="pwd"
              name="pwd" data-rule-required="true"
              placeholder="패스워드" maxlength="10">
          </div>
        </div>
        <div class="form-group" id="divPasswordCheck">
          <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
            확인</label>
          <div class="col-lg-10">
            <input type="password" class="form-control" id="pwd2" name="pwd2"
              data-rule-required="true" placeholder="패스워드 확인" maxlength="10">
          </div>
        </div>
        <div class="form-group" id="divName">
          <label for="inputName" class="col-lg-2 control-label">이름</label>
          <div class="col-lg-10">
            <input type="text" class="form-control " id="name" name="name" value="${user.name }"
              data-rule-required="true" maxlength="15">
          </div>
        </div>

        <div class="form-group" id="divEmail">
          <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
          <div class="col-lg-10">
            <input type="email" class="form-control" id="email" name="email" value="${user.email }"
              data-rule-required="true" placeholder="이메일" maxlength="40">
          </div>
        </div>
        <div class="form-group" id="divPhoneNumber">
          <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
            번호</label>
          <div class="col-lg-10">
            <input type="tel" class="form-control onlyNumber" value="${user.phone }"
              id="phone" data-rule-required="true"
              placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
          </div>
        </div>
        <div class="form-group" id="divName">
            <label for="inputName" class="col-lg-2 control-label">주소 </label>
            <div class="col-lg-10">
              <input type="text" class="form-control " id="addr" name="addr" value="${user.addr }"
                 maxlength="15">
                <input type="button" onclick="execDaumPostcode()" class="btn-sm"
									value="주소찾기">
            </div>
          </div>

        <div class="form-group">
          <div class="col-lg-offset-2 col-lg-10">
            <button type="submit" class="btn btn-primary">Sign in</button>
          </div>
        </div>
      </form>
         
  
  
      </div><!-- Main Col END -->
      
  </div><!-- body-row END -->
    
    
  </div><!-- container -->
  <script>
    $(function() {
      //모달을 전역변수로 선언
      var modalContents = $(".modal-contents");
      var modal = $("#defaultModal");

      $(".onlyNumber")
          .keyup(
              function(event) {
                if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
                  var inputVal = $(this)
                      .val();
                  $(this)
                      .val(
                          inputVal
                              .replace(
                                  /[^0-9]/gi,
                                  ''));
                }
              });

      //------- 검사하여 상태를 class에 적용
      $('#UId').keyup(function(event) {

        var divId = $('#divId');

        if ($('#UId').val() == "") {
          divId.removeClass("has-success");
          divId.addClass("has-error");
        } else {
          divId.removeClass("has-error");
          divId.addClass("has-success");
        }
      });

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

      $('#pwd2')
          .keyup(
              function(event) {

                var passwordCheck = $(
                    '#pwd2')
                    .val();
                var password = $(
                    '#pwd').val();
                var divPasswordCheck = $('#divPasswordCheck');

                if ((passwordCheck == "")
                    || (password != passwordCheck)) {
                  divPasswordCheck
                      .removeClass("has-success");
                  divPasswordCheck
                      .addClass("has-error");
                } else {
                  divPasswordCheck
                      .removeClass("has-error");
                  divPasswordCheck
                      .addClass("has-success");
                }
              });


      $('#email').keyup(function(event) {

        var divEmail = $('#divEmail');

        if ($.trim($('#email').val()) == "") {
          divEmail.removeClass("has-success");
          divEmail.addClass("has-error");
        } else {
          divEmail.removeClass("has-error");
          divEmail.addClass("has-success");
        }
      });

      $('#phone')
          .keyup(
              function(event) {
            	
                var divPhoneNumber = $('#divPhoneNumber');

                if ($
                    .trim($(
                        '#phone')
                        .val()) == "") {
                  divPhoneNumber
                      .removeClass("has-success");
                  divPhoneNumber
                      .addClass("has-error");
                } else {
                  divPhoneNumber
                      .removeClass("has-error");
                  divPhoneNumber
                      .addClass("has-success");
                }
              });

      //------- validation 검사
      $("form")
          .submit(
              function(event) {
                var divPassword = $('#divPassword');
                var divPasswordCheck = $('#divPasswordCheck');
                var divEmail = $('#divEmail');
                var divPhoneNumber = $('#divPhoneNumber');

                //패스워드 검사
                if ($('#pwd').val() == "") {
                  modalContents
                      .text("패스워드를 입력하여 주시기 바랍니다.");
                  modal.modal('show');

                  divPassword
                      .removeClass("has-success");
                  divPassword
                      .addClass("has-error");
                  $('#pwd').focus();
                  return false;
                } else {
                  divPassword
                      .removeClass("has-error");
                  divPassword
                      .addClass("has-success");
                }

                //패스워드 확인
                if ($('#passwordCheck')
                    .val() == "") {
                  modalContents
                      .text("패스워드 확인을 입력하여 주시기 바랍니다.");
                  modal.modal('show');

                  divPasswordCheck
                      .removeClass("has-success");
                  divPasswordCheck
                      .addClass("has-error");
                  $('#passwordCheck')
                      .focus();
                  return false;
                } else {
                  divPasswordCheck
                      .removeClass("has-error");
                  divPasswordCheck
                      .addClass("has-success");
                }

                //패스워드 비교
                if ($('#pwd').val() != $(
                    '#pwd2')
                    .val()
                    || $(
                        '#pwd2')
                        .val() == "") {
                  modalContents
                      .text("패스워드가 일치하지 않습니다.");
                  modal.modal('show');

                  divPasswordCheck
                      .removeClass("has-success");
                  divPasswordCheck
                      .addClass("has-error");
                  $('#passwordCheck')
                      .focus();
                  return false;
                } else {
                  divPasswordCheck
                      .removeClass("has-error");
                  divPasswordCheck
                      .addClass("has-success");
                }

                //이메일
                if ($('#email').val() == "") {
                  modalContents
                      .text("이메일을 입력하여 주시기 바랍니다.");
                  modal.modal('show');

                  divEmail
                      .removeClass("has-success");
                  divEmail
                      .addClass("has-error");
                  $('#email').focus();
                  return false;
                } else {
                  divEmail
                      .removeClass("has-error");
                  divEmail
                      .addClass("has-success");
                }

                //휴대폰 번호
                
                var phone = document.getElementById('phone').value;
			var regTel = /^(01[016789]{1}|070|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			
                if ($('#phone').val() == "") {
                  modalContents
                      .text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                  modal.modal('show');

                  divPhoneNumber
                      .removeClass("has-success");
                  divPhoneNumber
                      .addClass("has-error");
                  $('#phone')
                      .focus();
                  return false;
                } else  {
                  divPhoneNumber
                      .removeClass("has-error");
                  divPhoneNumber
                      .addClass("has-success");
                }

              });

    });
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