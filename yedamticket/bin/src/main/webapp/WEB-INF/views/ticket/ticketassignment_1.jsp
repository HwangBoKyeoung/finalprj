<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 기본 구조 */
.wrap {
max-width:95%;
max-height:60%;
margin:50px auto;
background:#f8f8f8;
}

/* 가로 스크롤 적용 */
.scroll__wrap {
overflow-x:auto; 
white-space:nowrap; 
font-size:0
}

.scroll--element {
display:inline-block; 
width:250px; 
height:350px; 
border:1px solid #222; 
background:#fff; 
font-size:16px; 
line-height:150px; 
text-align:center;
}

.scroll--element + .scroll--element {
margin-left:15px;

.btn{
height:20px;

}
}

</style>
</head>
<body>
${prInfo }
	<div align="center">
	<h1>티켓양도</h1>
	<h1>위 값은 ? ${prInfo }</h1>
	<h2>${sessionId }님이 보유한 티켓정보</h2>
	
	<div class="wrap">
	  <div class="scroll__wrap">
	  <c:forEach items="${prInfo }" var="pr">
	  <h1>값은 ?    ${pr }</h1>
	    <div class="scroll--element">${pr.PReservNo }
	    ${pr.reserveDttm}
	    	<div>
		    	<input class="btn" type="button" value="확인">
	    	</div>
	    </div>
	  </c:forEach>
	  </div>
	</div>
	</div>
</body>
</html>