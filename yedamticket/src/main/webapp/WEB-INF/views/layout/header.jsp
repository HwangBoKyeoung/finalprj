<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/users/css/practice.css" rel="stylesheet" />

<style>
.login-css-add {
	/* 	position: absolute; */
	/* 	left: 92%; */
	
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

/* @media screen and (max-width: 991px) {
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
 */
#topDiv li {
	float: right;
}

#topDiv a {
	color: white;
	font-size: 110%;
}

.more {
	display: block;
	width: 100px;
	height: 100px;
	background-image: url('./resources/users/img/zlogo.png');
	background-repeat: no-repeat;
	background-position-y: center;
	background-repeat: no-repeat;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.more:hover, .close:hover {
	cursor: pointer;
}

.close {
	display: block;
	background-image: url('./resources/users/img/closeLogo.png');
	width: 100px;
	height: 100px;
	background-repeat: no-repeat;
	background-position-y: center;
}

.board {
	font-family: '돋움';
	font-size: 13px;
	position: absolute;
	top: 120px;
	left: 5px;
	width: 100%;
	height: 300px;
	background: rgb(88, 47, 169);
	visibility: hidden;
	left: 5px;
	width: 100%;
	height: 300px;
	opacity: 0.6;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.list {
	float: left;
}

.searchform {
	border-width: 0 0 4px 0;
	border-style: solid;
	border-color: honeydew;
	position: absolute;
	right: 45%;
	top: 50px;
}

.searchform input {
	outline: medium none;
}

.searchform input[type=search] {
	background-color: transparent;
	border: medium none;
	border-radius: 0;
	box-sizing: content-box;
	color: #fff;
	cursor: pointer;
	float: left;
	font-family: inherit;
	font-size: 30px;
	margin-bottom: 0;
	padding: 3px 0;
	transition: all 0.5s ease 0s;
	width: 250px;
	-webkit-appearance: none;
	-moz-appearance: none;
	/* clears the 'X' from Internet Explorer */
	/* clears the 'X' */
}

.searchform input[type=search]::-webkit-search-decoration {
	-webkit-appearance: none;
}

.searchform input[type=search]::-ms-clear {
	display: none;
	width: 0;
	height: 0;
}

.searchform input[type=search]::-ms-reveal {
	display: none;
	width: 0;
	height: 0;
}

.searchform input[type=search]::-webkit-search-decoration, .searchform input[type=search]::-webkit-search-cancel-button,
	.searchform input[type=search]::-webkit-search-results-button,
	.searchform input[type=search]::-webkit-search-results-decoration {
	display: none;
}

.searchform input[type=search]:focus {
	background-color: transparent;
	color: #fff;
	cursor: auto;
	padding: 3px 0;
	width: 200px;
}

.searchform:hover input[type=search] {
	background-color: transparent;
	color: #fff;
	cursor: auto;
	padding: 3px 0;
	width: 350px;
}

#searchsubmit {
	background-color: rgba(0, 0, 0, 0);
	border: medium none;
	color: #fff;
	cursor: pointer;
	height: 30px;
	line-height: 1;
	float: right;
	font-size: 1em;
	width: auto;
	z-index: 1000000000;
}

input::placeholder {
	color: honeydew;
}

.fa-search {
	padding-left: 0;
	padding-right: 0;
	padding-top: 10px;
}

::-webkit-input-placeholder {
	/* Chrome/Opera/Safari */
	color: rgba(255, 255, 255, 0.5);
}

::-moz-placeholder {
	/* Firefox 19+ */
	color: rgba(255, 255, 255, 0.5);
}

:-ms-input-placeholder {
	/* IE 10+ */
	color: rgba(255, 255, 255, 0.5);
}

:-moz-placeholder {
	/* Firefox 18- */
	color: rgba(255, 255, 255, 0.5);
}

.none {
	display: none
}

#box {
	width: 150px;
}

#box2 {
	border: 6px solid #ff0000;
	padding: 0 65px;
	height: 47px;
	overflow: hidden;
	background: #9a82cb00;
	width: 275px;
	font-family: Gulim;
	font-size: 24px;
	float: center;
	font-weight: bold;
	margin-top: 59px;
	margin-right: 556px;
}

#box2 p {
	margin: 0;
	padding: 0;
	list-style: none;
}

#box2 div p {
	margin-top: 10px;
	display: block;
	height: 35px;
	line-height: 20px;
	color: white;
	text-decoration: none;
}
</style>

<!-- <style>
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
</style>
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


</style>-->

<!--  #show p {
	position: relative;
	width: 100px;
	height: 100px;
	background-color: red;
} 


#showDetail {border:2px solid yellowgreen; width:200px; height:40px; margin:100px; position:relative;  }
#box {width:200px; height:200px;position:absolute; top:0; left:0;}
#box p {text-align:center;height:40px;line-height:40px;} 

 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body id="searchShow">
	<nav class="navbar navbar-expand-lg nav-css-add"
		style="height: auto; box-shadow: none; margin-bottom: 1px;">
		<div class="navbar-translate" id="titleLogo"
			style="width: 100%; margin-left: 50%;">
			<a class="navbar-brand" href="home.do" title="Designed by 1석3조"
				data-placement="bottom"> <img width="200"
				src="resources/users/img/logo8.png"></a>
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

			<!--	<h1>YEDAM TICKET</h1> -->

		</div>
		<div align="right" id="topDiv" style="width: 100%; text-align: right;">

			<%-- 	<sec:authorize access="isAnonymous()"> --%>

					<li class="login-css-add"><a href="membership.do">멤버십등급</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<%-- 	</sec:authorize> --%>
				<%-- <sec:authorize access="hasRole('ROLE_USER')"> --%>
				<li class="login-css-add">나의 등급 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

				<%-- </sec:authorize> --%>
					
				<%-- <sec:authorize access="isAnonymous()"> --%>
					<li class="login-css-add"><a href="signup_1.do">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			<%-- 	</sec:authorize> --%>
				<%-- <sec:authorize access="hasRole('ROLE_COMPANY')"> --%>
					<li class="login-css-add"><a href="companyMyPage.do">기업페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<%-- </sec:authorize> --%>
				<%-- <sec:authorize access="hasRole('ROLE_USER')"> --%>
					<li class="login-css-add"><a href="userPage.do">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<%-- </sec:authorize> --%>
				
				<%-- <sec:authorize access="isAnonymous()"> --%>
					<li class="login-css-add"><a href="userLoginForm.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<%-- </sec:authorize> --%>
				<%-- <sec:authorize access="isAuthenticated()"> --%>
					<li class="login-css-add"><a href="kakaoLogout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<%-- </sec:authorize> --%>

		</div>
	</nav>

	<nav class="navbar navbar-expand-lg nav-css-add"
		style="margin-bottom: 0px; box-shadow: none;">
		<div class="container-fluid">
			<div class="navbar-translate" id="titleLogo">
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
						data-toggle="dropdown"> <i class="fa-solid fa-film fa-2x "></i>
							영화
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="movieBooking.do"> <i
								class="fa-solid fa-ticket fa-2x"></i> 영화예매
							</a> <a class="dropdown-item" href="movieList.do"> <i
								class="fa-solid fa-ranking-star fa-2x"></i> 박스오피스 순위
							</a><a class="dropdown-item" href="mGoodsList.do"> <i
								class="fa-solid fa-gifts fa-2x"></i>영화굿즈
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i class="fa-solid fa-drum fa-2x "></i>공연

					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">					
							<a class="dropdown-item" href="pList.do"> <i
								class="fa-solid fa-list-ul fa-2x"></i>공연리스트

							</a><a class="dropdown-item" href="concertSch.do"> <i
								class="fa-solid fa-calendar-days fa-2x"></i>공연 일정
							</a><a class="dropdown-item" href="cGoodsList.do"> <i
								class="fa-solid fa-gift fa-2x"></i> 공연굿즈
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown"> <i
							class="fa-solid fa-head-side-cough fa-2x "></i> 게시판
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<c:if test="${not empty sessionId}">
								<a class="dropdown-item" onclick="sessionChk();"
									href='ticketmarket_1.do'> <i
									class="fa-solid fa-handshake fa-2x "></i> 자유거래
								</a>
							</c:if>
							<a class="dropdown-item" href="noticeList.do"> <i
								class="fa-solid fa-circle-exclamation fa-2x"></i> 공지사항
							</a> <a class="dropdown-item"
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

					<li style="float: right;"><span class="more"> <span
							class="blind"></span>
					</span>
						<div class="board">
							<div class="list">
								<form id="frm" class="searchform" action="searchAll.do">
									<div>
										<input type="search" id="searchName" name="searchName"
											placeholder="Search" required="required">
										<button type="submit" id="searchsubmit">
											<i class="fas fa-search fa-2x" aria-hidden="true"></i>
										</button>
									</div>
								</form>
							</div>
							<div>
								<div id="show" style="float: right"></div>
							</div>
						</div></li>
					<!-- <form class="d-flex" action="searchAll.do">
							<div class="search" style="margin-left: 30px;">
								<div class="icon" id="icon">
									<span> <svg viewBox="0 0 40 40">
                                   <path d="M3,3 L37,37"></path>
                               </svg>
									</span>
								</div>
								<div class="field">
									<input type="text" id="searchName" name="searchName"
										width="80%" placeholder="Search for something...">
								</div>
							</div>
						</form>  -->
					<!-- <input type="text" name="searchName" id="searchName">
						<input type="button" id="btnSearch" value="검색"> -->
					<!-- <input type="text" name="searchName" id="searchName">
						<input type="button" id="btnSearch" value="검색"> -->

					<!-- <li class="nav-item dropdown"><a href="#"
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
							</a> <a class="dropdown-item" href="movieInsertForm.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 영화등록
							</a> <a class="dropdown-item" href="perInsertForm.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 공연등록
							</a> <a class="dropdown-item" href="goodsInsertForm.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 굿즈등록
							</a> <a class="dropdown-item" href="searchList.do"> <i
								class="fa-regular fa-comment-dots fa-2x"></i> 검색어
							</a>
						</div></li>
					<li> -->
					<!-- <form class="d-flex" action="searchAll.do">
							<div class="search" style="margin-left: 30px;">
								<div class="icon" id="icon">
									<span> <svg viewBox="0 0 40 40">
                                   <path d="M3,3 L37,37"></path>
                               </svg>
									</span>
								</div>
								<div class="field">
									<input type="text" id="searchName" name="searchName"
										width="80%" placeholder="Search for something...">
								</div>
							</div>
						</form>
					<input type="text" name="searchName" id="searchName">
						<input type="button" id="btnSearch" value="검색"> -->
				</ul>
			</div>
		</div>
	</nav>


	<script src="resources/users/js/practice.js"></script>

	<script>
		/* let Test1 = $("<div/>", {"id":"showDetail"});
		let Test2 = $("<div id='box'>");
		
		$("#show").append(Test1);
		Test2.appendTo($("#show")); */

		$(".more").on("click", function() {

			$.ajax({
				url : "searchList.do",
				type : "post",
				dataType : "json",
				async : false,
				success : function(result) {
					if ($("#box").length < 1) {
						let div = $("<div/>", {
							"id" : "box2"
						});
						//div.attr("id", "showDetail");
						let div2 = $("<div id='box'>");
						$("#show").append(div);
						div.append(div2);

						$.each(result, function(idx, item) {
							if(idx < 10){
							let p = $("<p>").text((idx + 1) + ". " + item.keyword);
							div2.append(p);
							}
							//p.css("padding-left", "50px");
							
						});
						//div.appendTo($("#show"));
					}
				}
			});
		});

		$(document).ready(function() {
			$('.more').click(function() {
				if ($('.more').hasClass('more')) {
					$('.more').addClass('close').removeClass('more');
					$('.board').css('visibility', 'visible');
				} else if ($('.close').hasClass('close')) {
					$('.close').addClass('more').removeClass('close');
					$('.board').css('visibility', 'hidden');
				}
			});
		});

		jQuery(function($) {
			var ticker = function() {
				timer = setTimeout(function() {
					$('#box p:first').animate({
						marginTop : '-40px',

					}, 1000, function() {
						$(this).detach().appendTo('#box').removeAttr('style');

					});
					ticker();
				}, 1000);
			};

			//2. 재생정지기능 시작, 아직 다음 기능과 연동은 안됨...그래서 3을 만듦
			var autoplay = true;
			$(document).on('click', '.pause', function() {
				if (autoplay == true) {
					clearTimeout(timer);
					$(this).text('재생');
					autoplay = false;
				} else {
					autoplay = true;
					$(this).text('정지');
					ticker();
				}
			}); // 재생정지기능 끝  

			//4 마우스를 올렸을 때 기능 정지
			var tickerover = function() {
				$('#box').mouseover(function() {
					clearTimeout(timer);
				});
				$('#box').mouseout(function() {
					ticker();
				});
			};
			tickerover();
			// 4 끝
			ticker();

		});
	</script>
</body>
</html>
