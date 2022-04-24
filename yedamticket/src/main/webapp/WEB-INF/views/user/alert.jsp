<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.swal-modal {
		width: 30%;
	}
	
	.swal-button--confirm {
		background-color: #ffb236;
	}
</style>
</head>
<%
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
%>
<script>
	localStorage.clear();
	swal("예담티켓에 방문해주셔서 감사합니다.", `<%=msg%>`);
	
	$(".swal-button--confirm").on("click", function(){
		location.href=`<%=url%>`;
	});
</script>
<body>

</body>
</html> 