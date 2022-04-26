<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</head>
<%
	String msg = (String)request.getAttribute("msg");
%>
<script>
	localStorage.clear();
	swal("예.담.티.켓.", `<%=msg%>`);
	
	$(".swal-button--confirm").on("click", function(){
		location.href='userPage.do';
	});
</script>
<body>

</body>
</html> 
