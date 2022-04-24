<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
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

input {
	display: block;
	outline: none;
	border: none !important
}

textarea {
	display: block;
	outline: none
}

textarea:focus, input:focus {
	border-color: transparent !important
}

button {
	outline: none !important;
	border: none;
	background: 0 0
}

button:hover {
	cursor: pointer
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
}

/* .row:hover {
    background-color: #ececff;
    cursor: pointer
} */
@media ( max-width :768px) {
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
.accordion {
	width: 700px;
	max-width: 1000px;
	margin: 2rem auto;

}

.accordion-item {
	background-color: #fff;
	color: #111;
	margin: 1rem 0;
	border-radius: 0.3rem;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.25);
}

.accordion-item-header {
	padding: 0.5rem 3rem 0.5rem 1rem;
	min-height: 3.5rem;
	line-height: 1.25rem;
	font-weight: bold;
	display: flex;
	font-size: 17px;
	align-items: center;
	position: relative;
	cursor: pointer;
}

.accordion-item-header::after {
	content: "\002B";
	font-size: 2rem;
	position: absolute;
	right: 1rem;
}

.accordion-item-header.active::after {
	content: "\2212";
}

.accordion-item-body {
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}

.accordion-item-body-content {
	padding: 1rem;
	line-height: 1.5rem;
	font-family: sans-serif;
	border-top: 1px solid;
	font-size: 16px;
	border-image: linear-gradient(to right, transparent, #34495e, transparent)
		1;
}
.accordion{
margin-right: 45%;
}
#sidebar{
	background:#301e4e;
}
#list{
	margin-top: 20px;
}
h4{
	font-size: 70px;
}
</style>
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" style="height: 1000px;">
			<div class="p-4 pt-5">
				<h1>
					<a href="noticeList.do" class="logo">고객센터</a>
				</h1>
				<ul class="list-unstyled components mb-5" style="padding-bottom: 450px;">
					<li><a href="noticeList.do">공지사항</a></li>
					<li><a href="faqList.do">FAQ</a></li>
					<li><a href="inqList.do">1:1 문의</a></li>
				</ul>

				<div class="mb-5">
					<h4 class="h6">고객센터</h4>
					<h4 class="h6">전화상담</h4>
					<h2 class="h6">1588-1588</h2>
					<span>평일 09:00~18:00</span><br> <span>토요일 09:00~17:00 </span><br>
					<span>일요일 공휴일 휴무</span>

					<div class="form-group d-flex">
						<div class="icon">
							<span class="icon-paper-plane"></span>
						</div>
					</div>
				</div>
			</div>
		</nav>
		
		<div class="col-lg-12 grid-margin stretch-card" id="list">
         <div class="card" style="height: 980px; width: 85%;">
            <div class="card-body">
				<h4 class="card-title">FAQ</h4>
				<c:forEach items="${faqs }" var="faq" begin="0" end="5">
					<div class="accordion">
						<div class="accordion-item">
							<div class="accordion-item-header">${faq.title }</div>
							<div class="accordion-item-body">
								<div class="accordion-item-body-content">${faq.content }</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
	</div>
	</div>

	<script type="text/javascript">
	 const accordionItemHeaders = document.querySelectorAll(".accordion-item-header");
     accordionItemHeaders.forEach(accordionItemHeader => {
         accordionItemHeader.addEventListener("click", event => {
             accordionItemHeader.classList.toggle("active");
             const accordionItemBody = accordionItemHeader.nextElementSibling;
             if (accordionItemHeader.classList.contains("active")) {
                 accordionItemBody.style.maxHeight = accordionItemBody.scrollHeight + "px";
             } else {
                 accordionItemBody.style.maxHeight = 0;
             }
         });
     });
	</script>
	<script src="./resources/users/js/core/jquery.min.js"></script>
	<script src="./resources/users/js/core/popper.js"></script>
	<script src="./resources/users/js/core/bootstrap.min.js"></script>
	<script src="./resources/users/js/main.js"></script>
</body>
</html>
