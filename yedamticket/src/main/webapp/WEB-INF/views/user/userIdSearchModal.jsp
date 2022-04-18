<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
input{
	font-family: sans-serif;
}
/* modal창 감싸고 있는 배경 Div */
.background_modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 20; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* 아이디 출력창(실제 내용) */
.modal_contents {
	background-color: #fefefe;
	margin-left: 663px;
	margin-top: -40px;
	padding: 14px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 30%;
	text-align: center;
}
/* close 버튼 */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	font-size: 70px;
	margin-top:-37px;
}
.selectedInfo {
	font-size: 24px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}


.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}

.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}

@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}
</style>
<body>
<div id="background_modal" class="background_modal">
	<div class="modal_contents">
		<h4>
			<span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
			<h3 id="id_value2"></h3>
		<br>
		<button type="button" id="pwSearch_btn" class="w-btn w-btn-gra1">
		<i class="fa fa-envelope"></i>비밀번호 찾기</button>
	</div>
</div>
</body>
</html>