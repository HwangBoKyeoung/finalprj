<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	*{
		list-style: none;
	}
	.footer{
		position: fixed;
	}
	
	.swal-modal {
		width: 30%;
	}
	
	.swal-button--confirm {
		background-color: #ffb236;
	}
</style>
<%
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
%>
</head>
<body>

<script>
	swal("예담티켓에 방문해주셔서 감사합니다.", `<%=msg%>`);
	
	$(".swal-button--confirm").on("click", function(){
		location.href='userPage.do';
	});
</script>
</body>
</html>