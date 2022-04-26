<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />

</head>
<body>
	<div class="section section-signup" style="background-image : url('./resources/users/img/ssp7.jpg'); height: 100vh;  background-repeat : no-repeat; background-size : cover;">
		<div class="container">
			<div class="row">
				<div class="card card-signup" style="background: #301e4e; color: white;" >
					<div class="card-header text-center">
						<h3 class="card-title title-up">메일이 발송되었습니다!</h3>
					</div>
					<div class="card-header text-center">
						<h4 class="card-title title-up">이메일을 확인해주세요.</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function closeWindow(){
		   self.opener = self;
		   window.close();
	}
	</script>
</body>
</html>
