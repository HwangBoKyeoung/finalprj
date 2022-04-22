<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-9 page">
		<div class="col-6">
			<h4 class="mb-3" align="left">기업회원정보</h4>
			<form class="frm" action="managerUpdate.do" method="POST">

				<div class="row g-3">
					<div class="col-12" align="left">
						<label for="NAME" class="form-label">이름</label>
						<div class="input-group has-validation">
							<input type="text" class="form-control" name="name" id="name"
								value="${mana.name }">
						</div>
					</div>
					<div class="col-6" align="left">
						<label for="MId" class="form-label">아이디</label>
						<div class="input-group has-validation">
							<input type="text" class="form-control pw" name="MId" id="MId"
								value="${sessionId}">
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control pw" name="pwd"
									id="pwd" value="">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="Phone" class="form-label">전화번호</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="name" name="name"
									value="${cmp.name }" placeholder="CompanyName">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="depart" class="form-label">부서</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="depart"
									id="depart" value="${mana.depart}" readonly="readonly" required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="authCd" class="form-label">권한코드</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="authCd"
									id="authCd" value="${mana.authCd }" required>
							</div>
						</div>
						<div align="right">
							<button id="updateBtn" type="submit" class="btn btn-primary"
								style="margin-right: 50%">수정</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>