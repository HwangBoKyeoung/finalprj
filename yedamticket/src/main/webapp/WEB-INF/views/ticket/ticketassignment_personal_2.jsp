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
	<form action="ticketassignment_personal_3.do" method="post">
	<input type="hidden" name="price" id="price" value="${price }">
	<input type="hidden" name="loc" id="loc" value="${loc }">
	<input type="hidden" name="PReservNo" id="PReservNo" value="${PReservNo }">
	<div class="no-drag" style="margin:auto; max-width: 30%;">
	  <h2>
	    채 권 양 도 계 약 서<br />
	    ----------------------------
	  </h2>
      <p>
        채무자 ${Uid } 와 채권자 ${sessionId } 는 채무자가 채권자에 대하여 현재 및 장래 부담할 채무의 담보를 위하여 채무자가 ${date} 일자 매매계약에 의거 제3채무자에게 가지고 있는 매매대금 채권을 하기 조건으로 채권자에게 양도 하기로 함.
        <input type="hidden" name="Uid" id='Uid' value="${Uid }">
      </p>
      <br />
      
      <p>제 1조 [채권양도 통지의무]</p>
      <p>
        채무자는 제3채무자에 대하여 즉시 확정일자가 있는 증서로써 채권양도의 통지를 하여 제3채무자의 승낙을 받아야 함.
      </p>
      <br />
      
      <p>제2조 [담보책임]</p>
      <p>
        채무자는 본 건 양도채권에 대한 매매물품자체에 대한 것을 제외하고는 제3채무자로부터 채무자에 대항할 사유가 없음을 보증함. 채무자는 제1조에의한 통지의 효력발생에 이르기까지 채권자의 권리행사를 방해하는 행위를 할 수 없음
      </p>
      <br />
      
      <p>제3조 [통지의무]</p>
      <p>
        채무자는 제3채무자와의 사이에 채결된 계약에 의하여 본건 대금채권의 변제기가 도래할 때는 즉시 채권자에게 통지하여야 함.
      </p>
      <br />
      
      <p>제4조 [실행, 충당]</p>
      <p>
        채권자가 변제기 후 본 건 대금채권을 추심한 때는 상기금액은 별지약정에 따라 보증금으로서 담보 제공한다. 단, 상기금액의 일부 또는 전부를 보증금에 합산치 아니할 수 있다. 이때 합산하지 않는 금액에 해당하는 채무자의 채권자에 대한 채무는 소멸한다.
      </p>
      <br />
      
      <p>제5조 [채권의 반환]</p>
      <p>
        본 건 대금채권의 변제기전에 채권자, 채무자간의 거래가 완료하고 채무자가 채무의 전부를 변제한 때 채권자는 지체없이 본 권 채권을 채무자에게 무상양도 하고, 제3자 에게 즉시 확정일자 있는 증서로서 채권양도의 통지를 하여야 한다. 상기 통지에 소요된 비용은 채무자가 부담한다.
      </p>
      <br />
      
      <p class="pctr">${today }</p>
      <br />
      
      <p class="pctr">양도인(갑) : ${sessionId }</p>
      <p id="ownerAdd" class="pctr">주소 : ${ownerAddr }</p>
      <input type="hidden" name="ownerAddr" id="ownerAddr" value="${ownerAddr }">
      <br>
      
      <p class="pctr">양수인(을) : ${Uid }</p>
      <p id="buyerAdd" class="pctr">주소 : ${buyerAddr }</p>
      <input type="hidden" name="buyerAddr" id="buyerAddr" value="${buyerAddr }">
	</div>
	<div align="right" style="margin:auto; max-width: 30%;">
		<input type="submit" class="btn" value="확인">
		<input type="button" class="btn btn-danger" onclick="location.href='ticketassignment_1.do'" value="취소">
	</div>
	</form>
	<script>
	</script>
</body>
</html>