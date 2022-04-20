<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
<title>Sidebar 02</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/users/css/style.css">
</head>
<style>
/*@font-face {
	font-family: Poppins-Regular;
	src:
		url(https://colorlib.com/etc/tb/Table_Responsive_v2/fonts/poppins/Poppins-Regular.ttf)
}

@font-face {
	font-family: Poppins-Bold;
	src:
		url(https://colorlib.com/etc/tb/Table_Responsive_v2/fonts/poppins/Poppins-Bold.ttf)
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body, html {
	height: 100%;
	font-family: sans-serif
}

a {
	margin: 0;
	transition: all .4s;
	-webkit-transition: all .4s;
	-o-transition: all .4s;
	-moz-transition: all .4s
}

a:focus {
	outline: none !important
}

a:hover {
	text-decoration: none
}

h1, h2, h3, h4, h5, h6 {
	margin: 0
}

p {
	margin: 0
}

ul, li {
	margin: 0;
	list-style-type: none
}

iframe {
	border: none !important
}

.limiter {
	width: 100%;
	margin: 0 auto
}

.container-table100 {
	width: 100%;
	min-height: 30vh;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	padding: 33px 30px
}

.wrap-table100 {
	width: 700px;
	height: 300px;
	border-radius: 10px;
	overflow: hidden
}

.table {
	width: 100%;
	display: table;
	margin: 0
}

@media screen and (max-width:768px) {
	.table {
		display: block
	}
}

.row {
	display: table-row;
	background: #fff
}

.row.header {
	color: #fff;
	background: #866ec7
}

@media screen and (max-width:768px) {
	.row {
		display: block
	}
	.row.header {
		padding: 0;
		height: 0
	}
	.row.header .cell {
		display: none
	}
	.row .cell:before {
		font-family: Poppins-Bold;
		font-size: 12px;
		color: gray;
		line-height: 1.2;
		text-transform: uppercase;
		font-weight: unset !important;
		margin-bottom: 13px;
		content: attr(data-title);
		min-width: 98px;
		display: block
	}
}

.cell {
	display: table-cell
}

@media screen and (max-width:768px) {
	.cell {
		display: block
	}
}

.row .cell {
	font-family: Poppins-Regular;
	font-size: 15px;
	color: #666;
	line-height: 1.2;
	font-weight: unset !important;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #f2f2f2
}

.row.header .cell {
	font-family: Poppins-Regular;
	font-size: 18px;
	color: #fff;
	line-height: 1.2;
	font-weight: unset !important;
	padding-top: 19px;
	padding-bottom: 19px
}

.row .cell:nth-child(1) {
	width: 350px;
	padding-left: 40px
}

.row .cell:nth-child(2) {
	width: 160px
}

.row .cell:nth-child(3) {
	width: 250px
}

.row .cell:nth-child(4) {
	width: 190px
}

.table, .row {
	width: 100% !important
}*/

/* .row:hover {
    background-color: #ececff;
    cursor: pointer
} */
/* @media ( max-width :768px) {
	.row {
		border-bottom: 1px solid #f2f2f2;
		padding-bottom: 18px;
		padding-top: 30px;
		padding-right: 15px;
		margin: 0
	}
	.row .cell {
		border: none;
		padding-left: 30px;
		padding-top: 16px;
		padding-bottom: 16px
	}
	.row .cell:nth-child(1) {
		padding-left: 30px
	}
	.row .cell {
		font-family: Poppins-Regular;
		font-size: 18px;
		color: #555;
		line-height: 1.2;
		font-weight: unset !important
	}
	.table, .row, .cell {
		width: 100% !important
	}
}

* {
	box-sizing: border-box;
}

.que:first-child {
	border-top: 1px solid black;
}

.que {
	position: relative;
	padding: 17px 0;
	cursor: pointer;
	font-size: 14px;
	border-bottom: 1px solid #dddddd;
}

.que::before {
	display: inline-block;
	content: 'Q';
	font-size: 14px;
	color: #006633;
	margin-right: 5px;
}

.que.on>span {
	font-weight: bold;
	color: #006633;
}

.anw {
	display: none;
	overflow: hidden;
	font-size: 14px;
	background-color: #f4f4f2;
	padding: 27px 0;
}

.anw::before {
	display: inline-block;
	content: 'A';
	font-size: 14px;
	font-weight: bold;
	color: #666;
	margin-right: 5px;
} */

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

<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
					<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>
				</button>
			</div>
			<div class="p-4 pt-5">
				<h1>
					<a href="companyMyPage.do" class="logo">COMPANY PAGE</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li><a href="companyMovieList.do">영화 목록</a></li>
					<li><a href="companyPerforList.do">공연 목록</a></li>
					<li><a href="goodsPage.do">굿즈 목록</a></li>
					<li><a href="movieInsertForm.do">영화 등록</a></li>
					<li><a href="perInsertForm.do">공연 등록</a></li>
					<li><a href="goodsInsertForm.do">굿즈 등록</a></li> 
					<li>승인 요청<ul class="list-unstyled components mb-5">
					<li><a href="movieCompanyConfirmList.do">영화 승인 요청</a></li>
					<li><a href="perforCompanyConfirmList.do">공연 승인 요청</a></li>
					<li><a href="goodsCompanyConfirmList.do">굿즈 승인 요청</a></li>
					</ul></li>
					<li><a href="companyMyDeletePerforList.do">공연삭제신청현황</a></li>
					<li><a href="companyMyDeleteMovieList.do">영화삭제신청</a></li>
				</ul>
				<div class="form-group d-flex">
					<div class="icon">
						<span class="icon-paper-plane"></span>
					</div>
				</div>
			</div>
		</nav>
		
		<div class="col-sm-9 page">
			<div class="col-6">
				<h4 class="mb-3" align="left">기업회원정보</h4>
				<form class="frm" action="companyUpdate.do" method="POST" onsubmit="alertt();" id="frms">
					
					<div class="row g-3">
						<div class="col-12" align="left">
							<label for="email" class="form-label">이메일</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="email" id="email" value="${cmp.email }"placeholder="your@email.com.." required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="CId" class="form-label">아이디</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="CId" id="CId" value="${sessionId}" placeholder="Id" readonly="readonly">
							</div>
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control pw" name="pwd" id="pwd1" value="" placeholder="password" required="required">
							</div>
						</div>
						<div class="col-6" align="left">
							<label for="password" class="form-label">비밀번호확인</label>&nbsp;&nbsp;<font id = "checkPw" size = "2"></font>
							<div class="input-group has-validation">
								<input type="password" class="form-control pw" name="pwd2" id="pwd2" value="" placeholder="password" required="required">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="companyName" class="form-label">기업명</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="name" name="name" value="${cmp.name }"placeholder="companyName">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="phone" class="form-label">전화번호</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="phone" id="phone" value="${cmp.phone }"placeholder="phone" required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="phone" class="form-label">담당자</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="person" id="person" value="${cmp.person }"placeholder="담당자" required>
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="bizno" class="form-label">사업자등록번호</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="bizno" name="bizno" value="${cmp.bizno }" readonly="readonly">
							</div>
						</div>
						<div class="col-12" align="left">
							<label for="addr" class="form-label">주소</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" name="addr" id="addr" value="${cmp.addr }"placeholder="daegu..." required>
							</div>
							<div align="right">
								<button id="updateBtn" type="submit" class="btn btn-primary" style="margin-right: 50%">수정</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	$("#updateBtn").attr('disabled',true);
	$('.pw').keyup(function(){
    	let pass1 = $("#pwd1").val();
        let pass2 = $("#pwd2").val();
        
        if (pass1 != "" || pass2 != ""){
        	if (pass1 == pass2){
            	$("#checkPw").html('일치');
            	$("#checkPw").attr('color','green');
            	$("#updateBtn").attr('disabled',false);
            } else {
            	$("#checkPw").html('불일치');
                $("#checkPw").attr('color','red');
                $("#updateBtn").attr('disabled',true);
            }
        }
    })
	   
    function alertt(){
		alert("회원정보가 수정되었습니다.")
	}
	</script>
</body>

</html>