<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/84d54512c7.js"
	crossorigin="anonymous"></script>
<link rel="apple-touch-icon" sizes="76x76"
	href="./resources/users/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="./resources/users/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><tiles:getAsString name="title" /></title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- CSS Files -->
<link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/users/css/now-ui-kit.css?v=1.3.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./resources/users/demo/demo.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/84d54512c7.js"
	crossorigin="anonymous"></script>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/album/">

<style>
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
}

html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

/* header {
	height: 75px;
	padding: 1rem;
	color: white;
	background: teal;
	font-weight: bold;
	display: flex;
	justify-content: space-between;
	align-items: center;
} */

.main{
	min-heigth: 100%;
	position: relative;
	width: 100%;
}

.body-content {
	margin-top: 0px;
	/* padding-bottom: 200px; */ /* footer 높이 */
	padding-left: 0px;
}

.footer {
	width: 100%;
	height: 200px; /* footer의 높이 */
	/* position: absolute; */
	bottom: 0;
	left: 0;
}
</style>
</head>
<title><tiles:getAsString name="title"/></title>
	<body class="index-page sidebar-collapse">
	<div class="main">
	<!-- Navbar -->
	<tiles:insertAttribute name="header" />
	<!-- End Navbar -->
	
		<!-- <div class="main-panel"> -->
			<div class="body-content">
				<tiles:insertAttribute name="body" />
			</div>
		<!-- </div> -->
		<!--  End Modal -->
		<!--start footer-->
		<div class="footer">
			<tiles:insertAttribute name="footerTT" />
		</div>
		<!--end footer-->
	</div>
</html>