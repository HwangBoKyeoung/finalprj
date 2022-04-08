<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login-css-add {
	position: absolute;
    left: 92%;
}

.nav-css-add {
	background-color: #866ec766;
	top: 0;
	right: 0;
	left: 0;
	z-index: 1030;
}

.menu-css-add {
	align-items: center;
	margin-right: auto;
	margin-left: auto;
}

@media screen and (max-width: 1430px){
	.login-css-add {
		position: absolute;
   		left: 100%;
	}
}

@media screen and (max-width: 991px){
	.menu-css-add {
		align-items: flex-start;
		margin-right: 0;
		margin-left: 20px;
		line-height: 70px;
	}
	
	.dropdown-menu {
		min-width: 20rem;
	}
	
	.dropdown-item {
		line-height: 50px;
	}
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg nav-css-add">
		<div class="container-fluid">
			<div class="navbar-translate" id="titleLogo">
				<a class="navbar-brand" href="home.do" title="Designed by 1석3조"
					data-placement="bottom"> <img width="200"
					src="resources/users/img/logo8.png"></a>
				<button class="navbar-toggler navbar-toggler" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-bar top-bar"></span> <span
						class="navbar-toggler-bar middle-bar"></span> <span
						class="navbar-toggler-bar bottom-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="navigation"
				data-nav-image="./resources/img/blurred-image-1.jpg">
				<ul class="navbar-nav menu-css-add">
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i class="fa-solid fa-shop fa-2x"></i>
							<p>굿즈</p>
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="cGoodsList.do"> <i
								class="fa-solid fa-gift fa-2x"></i> 공연굿즈
							</a> <a class="dropdown-item" href="mGoodsList.do"> <i
								class="fa-solid fa-gifts fa-2x"></i>영화굿즈
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i class="fa-solid fa-film fa-2x "></i>
							영화
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="movieBooking.do"> <i
								class="fa-solid fa-ticket fa-2x"></i> 영화예매
							</a> <a class="dropdown-item" href="movieList.do"> <i
								class="fa-solid fa-ranking-star fa-2x"></i> 박스오피스 순위
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i class="fa-solid fa-drum fa-2x "></i>공연

					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="./index.html"> <i
								class="fa-solid fa-ticket-simple fa-2x"></i> 공연예매
							</a> <a class="dropdown-item" target="_blank"
								href="pList.do">
								<i class="fa-solid fa-list-ul fa-2x"></i> 지역별 공연리스트
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i
							class="fa-solid fa-head-side-cough fa-2x "></i> 게시판
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="./index.html"> <i
								class="fa-solid fa-circle-exclamation fa-2x"></i> 공지사항
							</a> <a class="dropdown-item" target="_blank"
								href="https://demos.creative-tim.com/now-ui-kit/docs/1.0/getting-started/introduction.html">
								<i class="fa-solid fa-handshake fa-2x "></i> 양도거래
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i class="fa-solid fa-headset fa-2x"></i>
							고객센터
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="userService.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 상담
							</a> <a class="dropdown-item" target="_blank" href="membership.do">
								<i class="fa-solid fa-circle-info fa-2x"></i> 멤버십 안내
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i class="fa-solid fa-headset fa-2x"></i>
							마이페이지
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="userPage.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 회원정보
							</a> <a class="dropdown-item" href="conPage.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 공연정보
							</a> <a class="dropdown-item" href="goodsPage.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 굿즈정보
							</a>
							</a> <a class="dropdown-item" href="movieInsertForm.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 영화등록
							</a>
						</div></li>
					<li>
						<div align="right">
							<c:choose>
								<c:when test="${empty sessionId}">
									<li class="login-css-add"><a
										href="userLoginForm.do" > <i
											class="fa-solid fa-headset fa-2x"></i> 로그인
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="login-css-add"><a
										href="kakaoLogout.do" > <i
											class="fa-solid fa-headset fa-2x"></i> 로그아웃
									</a></li>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
