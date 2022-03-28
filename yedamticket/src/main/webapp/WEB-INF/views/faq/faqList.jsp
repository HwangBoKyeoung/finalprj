<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrapper {
	padding-left: 0;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

#sidebar-wrapper {
	z-index: 1000;
	position: fixed;
	left: 250px;
	width: 0;
	height: 100%;
	margin-left: -250px;
	overflow-y: auto;
	background: #fff;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

#sidebar-wrapper {
	box-shadow: inset -1px 0px 0px 0px #DDDDDD;
}

#page-content-wrapper {
	width: 100%;
	position: absolute;
	padding: 15px;
}

/* Sidebar Styles */
.sidebar-nav {
	position: absolute;
	top: 0;
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 20px;
	line-height: 40px;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999999;
}

.sidebar-nav li a:hover {
	text-decoration: none;
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
	height: 65px;
	font-size: 18px;
	line-height: 60px;
}

.sidebar-nav>.sidebar-brand a {
	color: #999999;
}

.sidebar-nav>.sidebar-brand a:hover {
	color: #fff;
	background: none;
}

@media ( min-width :768px) {
	#wrapper {
		padding-left: 250px;
	}
	#sidebar-wrapper {
		width: 250px;
	}
	#page-content-wrapper {
		padding: 20px;
		position: relative;
	}
	#sidebar-wrapper li.active>a:after {
		border-right: 17px solid #f4f3ef;
		border-top: 17px solid transparent;
		border-bottom: 17px solid transparent;
		content: "";
		display: inline-block;
		position: absolute;
		right: -1px;
	}
	.sidebar-brand {
		border-bottom: 1px solid rgba(102, 97, 91, 0.3);
	}
	.sidebar-brand {
		padding: 18px 0px;
		margin: 0 20px;
	}
	.navbar .navbar-nav>li>a p {
		display: inline-block;
		margin: 0;
	}
	p {
		font-size: 16px;
		line-height: 1.4em;
	}
	.navbar-default {
		background-color: #f4f3ef;
		border: 0px;
		border-bottom: 1px solid #DDDDDD;
	}
	btn-menu {
		border-radius: 3px;
		padding: 4px 12px;
		margin: 14px 5px 5px 20px;
		font-size: 14px;
		float: left;
	}
}
</style>

</head>
<body>

	<div id="wrapper" class="wrapper-content">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="mb-1">
					<h4>고객센터</h4>
				</li>

				<li><a href="noticeList.do">공지사항</a></li>
				<li><a href="faqList.do">FAQ</a></li>
				<li><a href="#">1:1 문의</a></li>
				<li class="border-top my-3"></li>
				<li class="mb-1">
					<h4>고객센터</h4>
					<h4>전화상담</h4>
					<h5>1588-1588</h5> &nbsp;&nbsp;<span>평일 09:00~18:00</span><br>
					&nbsp;&nbsp;<span>토요일 09:00~17:00 </span><br> &nbsp;&nbsp;<span>일요일
						공휴일 휴무</span>
				<li class="border-top my-3"></li>
			</ul>
		</div>
		<div class="container ">
			<br>
			<div>
				<h3>FAQ</h3>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>유형</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${faqs }" var="faq">
						<tr onclick="noticeSearch('${faq.FNo }')">
							<td>${faq.FNo }</td>
							<td>${faq.qstCd }</td>
							<td>${faq.title }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<form id="frm" action="faqSelect.do" method="post">
				<input type="hidden" id="FNo" name="FNo">
			</form>
		</div>
		<div>
			<button type="button" onclick="location.href='faqWriteForm.do'">글등록</button>
		</div>
	</div>

	<script type="text/javascript">
		function noticeSearch(n) {
			frm.FNo.value = n;
			frm.submit();
		}
	</script>
</body>
</html>