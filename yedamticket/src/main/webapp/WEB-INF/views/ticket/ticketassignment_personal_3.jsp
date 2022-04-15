<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<form action="ticketassignment_personal_4.do" method="POST">
	<input type="hidden" name="PReservNo" id="PReservNo" value="${PReservNo }">
	<div class="no-drag" style="margin:auto; max-width: 30%;">
	  <h2>
	    채 권 양 도 통 지 서<br />
	    ----------------------------
	  </h2>
      <p>수신인 : ${UId }</p>
      <p>주 소 : ${buyerAddr }</p>
      <br />
      
      <p>발신인(양도인)은 채권양도의 양수인과 체결한 약정에 따라 발신인의 수신인에 대한 채권을 양수인에게 양도하였습니다. 따라서 수신인이 발신인에게 지급하여야 할 <span style="color:red">금 "${price }원"</span>의 청구채권을 양수인에게 양도하였음을 통지하오니 양수인에게 위 대금을 지급하여 주시기 바랍니다.</p>
      <br />
      
      <p class="pctr">${today }</p>
      <br />
      
      <p class="pctr">발신인(채권양도인) : ${sessionId }</p>
      <p id="ownerAdd" class="pctr">주소 : ${ownerAddr }</p>
      <br>
	</div>
	<div align="right" style="margin:auto; max-width: 30%;">
		<input type="submit" class="btn" value="확인">
		<input type="button" class="btn btn-danger" onclick="location.href='ticketassignment_1.do'" value="취소">
	</div>
	</form>
</body>
</html>