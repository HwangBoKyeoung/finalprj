<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	margin: 0;
	padding: 0
}

#contain {
	border: 2px solid yellowgreen;
	width: 200px;
	height: 40px;
	margin: 100px;
	position: relative;
}

#box {
	width: 200px;
	height: 200px;
	position: absolute;
	top: 0;
	left: 0;
}

#box p {
	text-align: center;
	height: 40px;
	line-height: 40px;
}
</style>
<body>



	<div id="contain">
		<div id="box">
			<c:forEach items="${popular }" var="po">
				<p>${po.keyword}</p>
			</c:forEach>
		</div>
	</div>






	<script type="text/javascript">
		setInterval("play()", 800);
		function play() {
			$("#box").delay(1000).animate({
				top : -40
			}, function() {
				$("#box p:first").appendTo("#box");
				$("#box").css({
					top : 0
				});
			});
		}
	</script>
</body>
</html>