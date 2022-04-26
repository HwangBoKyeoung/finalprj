<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	*{
	line-style: none;
	}
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
</head>
<body>
	<form action="ticketmarket_3.do" method="POST">
	<input type="hidden" name="PReservNo" id="PReservNo" value="${PReservNo }">
	<input type="hidden" name="RId" id="RId" value="${RId }">
	<input type="hidden" name="name" id="name" value="${name }">
	<input type="hidden" name="seatNo" id="seatNo" value="${seatNo }">
	<input type="hidden" id="loc" name="loc" value=${loc }>
	<input type="hidden" name="price" id="price" value="${price }">
	<input type="hidden" name="buyerAddr" id="buyerAddr" value="${buyerAddr }">
	<input type="hidden" name="ownerAddr" id="ownerAddr" value="${ownerAddr }">
	<input type="hidden" name="UId" id="UId" value="${UId }">
	<input type="hidden" name="date" id="date" value="${date }">
	<div class="no-drag" style="margin:auto; max-width: 30%;">
	  <br>
	  <h2 style="font-weight: bold; padding-top:20px">채 권 양 도 통 지 서<br /><br></h2>
      <p>수신인 : ${sessionId }</p>
      <p>주 소 : ${buyerAddr }</p>
      <br />
      
      <p>발신인(양도인)은 채권양도의 양수인과 체결한 약정에 따라 발신인의 수신인에 대한 채권을 양수인에게 양도하였습니다. 따라서 수신인이 발신인에게 지급하여야 할 <span style="color:red">금 "${price }원"</span>의 청구채권을 양수인에게 양도하였음을 통지하오니 양수인에게 위 대금을 지급하여 주시기 바랍니다.</p>
      <br />
      
      <p class="pctr">${today }</p>
      <br />
      
      <p class="pctr">발신인(채권양도인) : ${UId }</p>
      <p id="ownerAdd" class="pctr">주소 : ${ownerAddr }</p>
      <br>
	</div>
	<div align="right"  style="margin:auto; max-width: 43%; margin-top: 20px; margin-bottom: 30px;">
		<i class="fas fa-exclamation-circle" title="10% 수수료가 부가된 가격입니다." style="cursor:pointer;" aria-hidden="true"></i>
		<input type="submit" class="btn" style="background: #301e4e;" value="확인">
		<input type="button" class="btn btn-danger" onclick="location.href='ticketmarket_1.do'" value="취소">
	</div>
	</form>
</body>
</html>