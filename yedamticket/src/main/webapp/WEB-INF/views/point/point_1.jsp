<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./resources/point/js/point_1.js"></script>
<link href="./resources/point/css/point_1.css" rel="stylesheet" />
</head>
<body>
	<div id="pointdiv1" class="section section-signup">
		<div id="pointdiv2">
			<div class="card card-signup" data-background-color="black" style="height:100%; width:100%;">
				<form id="frm" action="point_2.do" method="POST">
					<div class="card-header text-center">
						<h3 class="card-title title-up">충전</h3>
					</div>
					<div class="card-header text-center">
						<input
					      type="number"
					      id="point"
					      class="form-control"
					      placeholder="금액을 입력해주세요."
					      required="required"
					      readonly="readonly"
					      name="point"
					      maxlength="7"
					      onkeyup="maxPoint();"
					      oninput="maxLengthChk(this);"
					    />
					    <input type="hidden" id="id" name="id" value="${sessionId}"/>
							<button class="btn" type="button" onclick="fiveThousand();">+5천 원</button>
						    <button class="btn" type="button" onclick="tenThousand();">+1만 원</button>
						    <button class="btn" type="button" onclick="fiftyThousand();">+5만 원</button>
						    <button class="btn" type="button" onclick="oneHundredThousand();">+10만 원</button>
					</div>
					<div class="card-footer text-center">
						<img alt="kakaopay" src="./resources/kakaopay/payment_icon_yellow_large.png">
					</div>
					<div id="divfooter1" class="card-footer text-center">
						<input type="submit" id="submit" class="btn btn-neutral btn-round btn-lg" value="충전">
						<input type="reset" id="reset" class="btn btn-neutral btn-round btn-lg" onclick="resetPoint();" value="초기화">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>