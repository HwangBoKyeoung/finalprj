<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
<style type="text/css">
.card {
    width: 85%;
}
@font-face {
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
	width: 95% !important;
	margin-left: auto;
    margin-right: auto;
	
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
}
#sidebar,#search{
	background:#301e4e;
}
#list{
	margin-top: 20px;
}
h4{
	font-size: 35px;
}
</style>
</head>
<body>
<div class="wrapper d-flex align-items-stretch">
	<nav id="sidebar">
			<div class="p-4 pt-5">
				<h1>
					<a href="companyMyPage.do" class="logo">기업페이지</a>
				</h1>
				<ul class="list-unstyled components mb-5">
            		<li>영화<ul class="list-unstyled components mb-5">
            		<li><a href="companyMovieList.do">영화 목록</a></li>
					<li><a href="movieInsertForm.do">영화 등록</a></li>
					<li><a href="movieCompanyConfirmList.do">영화 승인 현황</a></li>
					<li><a href="companyMyDeleteMovieList.do">영화삭제신청현황</a></li>
            		</ul></li>
            		<li>공연<ul class="list-unstyled components mb-5">
					<li><a href="companyPerforList.do">공연 목록</a></li>
					<li><a href="perInsertForm.do">공연 등록</a></li>
					<li><a href="perforCompanyConfirmList.do">공연 승인 현황</a></li>
					<li><a href="companyMyDeletePerforList.do">공연삭제신청현황</a></li>
            		</ul></li>
            		<li>굿즈<ul class="list-unstyled components mb-5">
					<li><a href="goodsPage.do">굿즈 목록</a></li>
					<li><a href="goodsInsertForm.do">굿즈 등록</a></li>
					<li><a href="goodsCompanyConfirmList.do">굿즈 승인 현황</a></li>
            		</ul></li>
				</ul>
				<div class="form-group d-flex">
					<div class="icon">
						<span class="icon-paper-plane"></span>
					</div>
				</div>
			</div>
		</nav>
		
		<div class="col-lg-12 grid-margin stretch-card" id="list">
		<div class="card">
			<div class="card-body">
			<form action="goodsPage.do" enctype="multipart/form-data">
				<h4 class="card-title">굿즈 목록</h4>
				<div class="searchBar" align="right">
					<select id="inputState" name="searchType" style="border-style: none;">
						<option value="ALL"
								${pageVO.cri.searchType eq 'ALL' ? 'selected' : '' }>전체</option>
						<option value="NAME"
							${pageVO.cri.searchType eq 'NAME' ? 'selected' : '' }>이름</option>
						<option value="CONTENT"
							${pageVO.cri.searchType eq 'CONTENT' ? 'selected' : '' }>내용</option>
					</select> <input type="text" name="searchName"
						value="${pageVO.cri.searchName }">
					<button type="submit" class="btn btn-primary" id="search">검색</button>
					<!-- hidden으로 숨겨서 들어갈 값 -->
					<input type="hidden" name="pageNum" value="1">
					<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
					<input type="hidden" name="amount" value="${pageVO.amount }">
				</div>
				<br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>굿즈 이름</th>
							<th>판매자</th>
							<th>기업</th>
							<th>상품 구분</th>
							<th>가 격</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${gods }" var="gds">
							<c:if test="${gds.CId eq sessionId}">
								<tr onclick="location.href='goodsSelect.do?gNo=${gds.GNo}' ">
									<td>${gds.name}</td>
									<td>${gds.seller}</td>
									<td>${gds.CId }</td>
									<td>&nbsp;&nbsp;&nbsp;<c:set var="goodsCd" value="" />
									<c:if test="${gds.goodsCd eq'mv'}">
										<c:out value="영화"/>
									</c:if>
									<c:set var="goodsCd" value="" />
									<c:if test="${gds.goodsCd eq'pf'}">
										<c:out value="공연"/>
									</c:if></td>
									<%-- <td>${gds.goodsCd}</td> --%>
									<td>${gds.price}원</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<br><br>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="goodsPage.do?pageNum=${pageVO.startPage-1 }"> <input
							type="button" value="이전" class="btn btn-secondary"></a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="goodsPage.do?pageNum=${num }"> <input type="button"
							value="${num }" class="btn btn-secondary"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="goodsPage.do?pageNum=${pageVO.endPage+1 }"> <input
							type="button" value="다음" class="btn btn-secondary"></a>
					</c:if>
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
