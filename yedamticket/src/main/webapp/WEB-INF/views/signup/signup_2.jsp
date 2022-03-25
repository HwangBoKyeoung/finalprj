<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0"
	rel="stylesheet" />

</head>
<body>
	<div class="section section-signup"
		style="background-image: url('./resources/users/img/bg11.jpg'); background-size: cover; background-position: top center; min-height: 700px;">
		<div class="container">
			<div class="row">
				<div class="card card-signup" data-background-color="orange">
					<div class="card-header text-center">
						<h3 class="card-title title-up">메일이 발송되었습니다!</h3>
					</div>
					<div class="card-header text-center">
						<h4 class="card-title title-up">이메일을 확인해주세요.</h4>
					</div>
					<div class="card-body"></div>
					<div class="card-footer text-center">
						<a href="javascript:winclose();" class="btn btn-neutral btn-round btn-lg">창 닫기</a>
					</div>
				</div>
			</div>
			<div class="col text-center">
				<a href="examples/login-page.html"
					class="btn btn-outline-default btn-round btn-white btn-lg"
					target="_blank">기업회원이십니까?</a>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">
function winclose() {
	window.close();
}
</script>
</html>
