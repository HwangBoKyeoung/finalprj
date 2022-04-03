<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 사이드바 */
    .sidenav {
      position: absolute;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      margin-top:50px
    }
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
</style>
</head>
<body>
<div class="container-fluid">
  <nav class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="userUpdateForm.do">회원정보수정</a></li>
      </ul>
      <ul class="nav nav-pills nav-stacked">
      <li><a href="#">회원탈퇴</a></li>
      </ul>
    </nav>

		<div class="col-sm-9 page">
			<div class="col-6">
				<h4 class="mb-3" align="left">회원정보수정</h4>
				<form class="frm" action="userUpdate.do" method="POST">
					<div class="row g-3">
						<div class="col-12" align="left">
							<label for="UId" class="form-label">아이디</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="UId" id="UId" value="${user.u_id}" placeholder="Id" required>
							</div>
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control" name="pwd" id="pwd" value="${user.pwd }" placeholder="password" required>
							</div>
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호확인</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control" name="pwd" id="pwd" value="" placeholder="password" required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="username" class="form-label">이름</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="name" name="name" value="${user.name }"placeholder="Username" required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="phone" class="form-label">이메일</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="email" id="email" value="${user.email}"placeholder="your@email.com.." required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="phone" class="form-label">전화번호</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="phone" id="phone" value="${user.phone}"placeholder="phone" required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="addr" class="form-label">주소</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="addr" id="addr" value="${user.addr }"placeholder="daegu..." required>
							</div>
							<div align="right">
								<button type="button" class="btn btn-primary">수정</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>