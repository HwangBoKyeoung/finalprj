<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="p-4 pt-5">
				<h1>
					<a href="userPage.do" class="logo">MyPage</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li>
						<h6>${sessionId }님은회원입니다</h6>
						<h6>
							보유 포인트${user.point }P
							<button class="btn btn-primary btn-sm"
								onclick="location.href='point_1.do'">충전</button>
						</h6> <br>

					</li>
					<li><a href="userUpdateForm.do">회원정보수정</a></li>
					<li><a href="userInfoCheck.do">회원정보수정</a></li>
					<li><a href="pfReservList.do">공연예매내역</a></li>
					<li><a href="mvReservList.do">영화예매내역</a></li>
					<li><a href="userBuyList.do">거래내역</a></li>
					<li><a href="ticketassignment_1.do">내 티켓 보기 / 내 예약 정보</a></li>
					<li><a href="userPointList.do">포인트충전내역</a></li>
					<li><a href="#">티켓거래내역</a></li>
				</ul>
				<div class="mb-5">
					<div class="form-group d-flex">
						<div class="icon">
							<span class="icon-paper-plane"></span>
						</div>
					</div>
				</div>
			</div>
		</nav>




		<div class="container">
			<h2>회원정보</h2>
			<div class="cols-12">
				<br> <br>
				<hr>
				<div>
					<p align="center">
						회원님의 개인정보 보호를 위해 비밀번호를 입력하셔야 합니다.<br>로그인 시 사용하시는 비밀번호를 입력해
						주세요.
					<p>
				</div>
				<form id="frm" action="userInfoCheck.do" method="post">
					<div align="center">
						<input type="hidden" id="UId" name="UId" value="${sessionId }">
						<input type="password" id="pwd" name="pwd"><br>
						<hr>
						<button type="button" id="cancel">취소</button>
						<button type="submit" id="submit">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- <script>
		$(document).ready(function() {
			$("#cancel").on("click", function() {

				location.href = "userPage.do";
			})

			$("#submit").on("click", function() {
				if ($("#pwd").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#pwd").focus(); 
					return false;
				}
				$.ajax({
					url : "userInfoCheck.do",
					type : "POST",
					dataType : "json",
					data : $("#frm").serialize(),
					success : function(data) {
						console.log(data)
						if (data == 0) {
							alert("패스워드를 다시 확인해주세요.");
							return;
						}else{
							location.href = "userUpdateForm.do";
						}
						
					}
				})
			})
			
		});
	</script>  -->
</body>
</html>