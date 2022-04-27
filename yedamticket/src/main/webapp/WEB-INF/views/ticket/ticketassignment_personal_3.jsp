<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	  .no-drag {
	  -ms-user-select: none;
	  -moz-user-select: -moz-none; 
	  -webkit-user-select: none; 
	  -khtml-user-select: none; 
	  user-select:none;
	  }

	  p{
	  font-size : 1.2em;
	  }

      .pctr,
      h2 {
        text-align: center;
      }
      
       *{
      list-style:none;
      }
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<form action="ticketassignment_personal_4.do" method="POST">
	<input type="hidden" name="PReservNo" id="PReservNo" value="${PReservNo }">
	<input type="hidden" name="RId" id="RId" value="${RId }">
	<div class="no-drag" style="margin:auto; margin-top: 30px; max-width: 43%; padding-bottom: 20px; border: 1px solid #301e4e; padding-left: 20px; padding-right: 20px;">
	  <h2 style="font-weight: bold; padding-top:20px">채 권 양 도 통 지 서<br /></h2>
	  <hr style="background: #301e4e;">
      <p style="padding-top: 10px;">수신인 : ${RId }</p>
      <p style="padding-top: 10px;">주 소 : ${buyerAddr }</p>
      <br />
      <fmt:formatNumber value="${price }" var="price"/>
      <p>발신인(양도인)은 채권양도의 양수인과 체결한 약정에 따라 발신인의 수신인에 대한 채권을 양수인에게 양도하였습니다. 따라서 수신인이 발신인에게 지급하여야 할 <span style="color:red">금 "${price }원"</span>의 청구채권을 양수인에게 양도하였음을 통지하오니 양수인에게 위 대금을 지급하여 주시기 바랍니다.</p>
      <br />
      
      <p class="pctr">${today }</p>
      <br />
      
      <p class="pctr">발신인(채권양도인) : ${sessionId }</p>
      <p id="ownerAdd" class="pctr">주소 : ${ownerAddr }</p>
      <br>
	</div>
	<div align="right" style="margin:auto; max-width: 43%; margin-top: 20px; margin-bottom: 30px;">
		<input type="submit" class="btn" style="background: #301e4e;" value="확인">
		<input type="button" class="btn btn-danger" onclick="location.href='ticketassignment_1.do'" value="취소">
	</div>
	</form>
</body>
</html>
