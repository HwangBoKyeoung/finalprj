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

@media screen and (max-width: 1430px) {
	.login-css-add {
		position: absolute;
		left: 100%;
	}
}

@media screen and (max-width: 991px) {
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

<!--통통  <style>
h1 {
  height: 130px;
}

h1 span {
  position: relative;
  top: 20px;
  display: inline-block;
  animation: bounce .3s ease infinite alternate;
  font-family: 'Titan One', cursive;
  font-size: 80px;
  color: 217, 215, 141;
  text-shadow: 0 1px 0 #CCC,
               0 2px 0 #CCC,
               0 3px 0 #CCC,
               0 4px 0 #CCC,
               0 5px 0 #CCC,
               0 6px 0 transparent,
               0 7px 0 transparent,
               0 8px 0 transparent,
               0 9px 0 transparent,
               0 10px 10px rgba(0, 0, 0, .4);
}

h1 span:nth-child(2) { animation-delay: .1s; }
h1 span:nth-child(3) { animation-delay: .2s; }
h1 span:nth-child(4) { animation-delay: .3s; }
h1 span:nth-child(5) { animation-delay: .4s; }
h1 span:nth-child(6) { animation-delay: .5s; }
h1 span:nth-child(7) { animation-delay: .6s; }
h1 span:nth-child(8) { animation-delay: .7s; }

@keyframes bounce {
  100% {
    top: -20px;
    text-shadow: 0 1px 0 #CCC,
                 0 2px 0 #CCC,
                 0 3px 0 #CCC,
                 0 4px 0 #CCC,
                 0 5px 0 #CCC,
                 0 6px 0 #CCC,
                 0 7px 0 #CCC,
                 0 8px 0 #CCC,
                 0 9px 0 #CCC,
                 0 50px 25px rgba(0, 0, 0, .2);
  }
}
</style>-->
<style> 

h1 {
  position: relative;
  text-transform: uppercase;
  letter-spacing: 6px;
  font-weight: 900;
  text-decoration: none;
  color: white;
  display: inline-block;
  background-size: 120% 100%;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
  -ms-background-clip: text;
  -ms-text-fill-color: transparent;
  background-clip: text;
  text-fill-color: transparent;
  background-image: linear-gradient(45deg, 
                    #7794ff, 
                    #44107A,
                    #FF1361,
                    #FFF800);
  animation: .8s shake infinite alternate;
}

@keyframes shake {
  0% { transform: skewX(-15deg); }
  5% { transform: skewX(15deg); }
  10% { transform: skewX(-15deg); }
  15% { transform: skewX(15deg); }
  20% { transform: skewX(0deg); }
  100% { transform: skewX(0deg); }  
}


</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg nav-css-add">
		<div class="container-fluid">
			<div class="navbar-translate" id="titleLogo">
				<!--  <a class="navbar-brand" href="home.do" title="Designed by 1석3조"
					data-placement="bottom"> <img width="200"
					src="resources/users/img/logo8.png"></a>-->
					<!-- <h1>
					  <span>y</span>
					  <span>e</span>
					  <span>d</span>
					  <span>a</span>
					  <span>m</span><br>
					  <span>t</span>
					  <span>i</span>
					  <span>c</span>
					  <span>k</span>
					  <span>e</span>
					  <span>t</span>
					</h1> -->
					
					<h1>YEDAM TICKET</h1>
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

							</a> <a class="dropdown-item" target="_blank" href="pList.do"> <i
								class="fa-solid fa-list-ul fa-2x"></i> 지역별 공연리스트

							</a> <a class="dropdown-item" 
								href="pList.do">
								<i class="fa-solid fa-list-ul fa-2x"></i>공연리스트

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
							</a> <a class="dropdown-item" href="companyMyPage.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 기업회원 페이지
							</a> <a class="dropdown-item" href="goodsPage.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 굿즈정보
							</a> <a class="dropdown-item" href="movieInsertForm.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 영화등록
							</a> <a class="dropdown-item" href="perInsertForm.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 공연등록
							</a>
						</div></li>
					<li>
						<form class="d-flex" action="searchAll.do">
							<input class="form-control me-2" type="search" id="searchName" name="searchName"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-primary" type="submit">Search</button>
						</form>
						<div align="right">
							<c:choose>
								<c:when test="${empty sessionId}">
									<li class="login-css-add"><a href="userLoginForm.do">
											<i class="fa-solid fa-headset fa-2x"></i> 로그인
									</a></li>
								</c:when>
								<c:otherwise>
									<li class="login-css-add"><a href="kakaoLogout.do"> <i
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
