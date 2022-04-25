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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
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

.menu-css-add li {
	padding-right: 50px;	
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

#topDiv li {
	float: right;
}

#topDiv a {
	color: black;
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
	height: 350px;
	background: rgb(88, 47, 169);
	visibility: hidden;
	left: 5px;
	width: 100%;
	height: 300px;
/* 	opacity: 0.6; */
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
	top: 60px;
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
    font-size: 25px;
    margin-bottom: 0;
    padding: 1px 0;
    transition: all 0.5s ease 0s;
    width: 294px;
    -webkit-appearance: none;
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
</head>
<body id="searchShow">
	<div align="right" id="topDiv" style="width: 100%; text-align: right; padding-top: 20px;">
				<c:if test="${empty sessionId}">
				<li class="login-css-add"><a href="signup_1.do">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li class="login-css-add"><a href="userLoginForm.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li class="login-css-add"><a href="membership.do">멤버십등급</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</c:if>
				<c:if test="${not empty sessionId}">
					<c:if test="${sessionAuth eq 'ROLE_USER'}">
						<li class="login-css-add">나의 등급 : ${sessionGrade} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li class="login-css-add"><a href="userPage.do">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</c:if>
					<c:if test="${sessionAuth eq 'ROLE_COMPANY'}">
						<li class="login-css-add"><a href="companyMyPage.do">기업페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</c:if>
					<li class="login-css-add"><a href="kakaoLogout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</c:if>
		</div><br>
	<nav class="navbar navbar-expand-lg nav-css-add"
		style="height: auto; box-shadow: none; margin-bottom: 1px; background: white; padding-left: 45%; margin-right:0px;">
		<div class="navbar-translate" id="titleLogo"
			style="width: 100%;">
			<a class="navbar-brand" href="home.do" title="Designed by 1석3조"
				data-placement="bottom"> <img width="50%"
				src="resources/users/img/YDTICKET.png"></a>

		</div>
		
	</nav>

	<nav class="navbar navbar-expand-lg nav-css-add"
		style="margin-bottom: 0px; box-shadow: none;">
			<div class="collapse navbar-collapse" id="navigation"
				data-nav-image="./resources/img/blurred-image-1.jpg">
				<ul class="navbar-nav menu-css-add">
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown" style="font-size: 250%;">
							영화
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="movieBooking.do" style="font-size: 250%;">영화예매
							</a> <a class="dropdown-item" href="movieList.do" style="font-size: 250%;"> 박스오피스 순위
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown" style="font-size: 250%;"> 공연

					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">					
							<a class="dropdown-item" href="pList.do" style="font-size: 250%;"> 공연리스트

							</a><a class="dropdown-item" href="concertSch.do" style="font-size: 250%;"> 공연 일정
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="#"
						class="dropdown-toggle" id="navbarDropdownMenuLink1"
						data-toggle="dropdown" style="font-size: 250%;"> 굿즈
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink1">
								<a class="dropdown-item" href="mGoodsList.do" style="font-size: 250%;"> 영화굿즈
							</a>
							<a class="dropdown-item" href="cGoodsList.do" style="font-size: 250%;"> 공연굿즈
							</a>
						</div></li>
					<li class="nav-item dropdown"><a href="noticeList.do"
						class="" id="navbarDropdownMenuLink1"
						style="font-size: 250%;">
							고객센터
					</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</li>
					
					<li style="padding-right:0px;"><span class="more"> <span
							class="blind"></span>
					</span>
						<div class="board">
							<div class="list">
								<form id="frm" class="searchform" action="searchAll.do">
									<div>
										<input type="search" id="searchName" name="searchName"
											placeholder="제목으로 검색하세요" required="required">
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
							let p = $("<p>"); //.text((idx + 1) + ". " + item.keyword);
							let a = $("<a >").attr("href","searchAll.do?searchName="+item.keyword);
							a.text((idx + 1) + ". " + item.keyword);
							p.append(a);

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