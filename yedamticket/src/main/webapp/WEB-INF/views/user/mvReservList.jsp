<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
body {
  margin: 0;
  padding: 0;
  background: #fff;
}
.box {
  position: absolute;
  top: calc(50% - 125px);
  top: -webkit-calc(50% - 125px);
  left: calc(50% - 300px);
  left: -webkit-calc(50% - 300px);
}
.ticket {
  width: 600px;
  height: 250px;
  background: #f8475b;
  border-radius: 3px;
  box-shadow: 0 0 100px #aaa;
  border-top: 1px solid #f8475b;
  border-bottom: 1px solid #f8475b;
}
.left {
  margin: 0;
  padding: 0;
  list-style: none;
  position: absolute;
  top: 0px;
  left: -5px;
}
.left li {
  width: 0px;
  height: 0px;
}
.left li:nth-child(-n+2) {
  margin-top: 8px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #f8475b;
}
.left li:nth-child(3),
.left li:nth-child(6) {
  margin-top: 8px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #EEEEEE;
}
.left li:nth-child(4) {
  margin-top: 8px;
  margin-left: 2px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #EEEEEE;
}
.left li:nth-child(5) {
  margin-top: 8px;
  margin-left: -1px;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
  border-right: 6px solid #EEEEEE;
}
.left li:nth-child(7),
.left li:nth-child(9),
.left li:nth-child(11),
.left li:nth-child(12) {
  margin-top: 7px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #E5E5E5;
}
.left li:nth-child(8) {
  margin-top: 7px;
  margin-left: 2px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #E5E5E5;
}
.left li:nth-child(10) {
  margin-top: 7px;
  margin-left: 1px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #E5E5E5;
}
.left li:nth-child(13) {
  margin-top: 7px;
  margin-left: 2px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #f8475b;
}
.left li:nth-child(14) {
  margin-top: 7px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid #f8475b;
}
.right {
  margin: 0;
  padding: 0;
  list-style: none;
  position: absolute;
  top: 0px;
  right: -5px;
}
.right li:nth-child(-n+2) {
  margin-top: 8px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #f8475b;
}
.right li:nth-child(3),
.right li:nth-child(4),
.right li:nth-child(6) {
  margin-top: 8px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #EEEEEE;
}
.right li:nth-child(5) {
  margin-top: 8px;
  margin-left: -2px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #EEEEEE;
}
.right li:nth-child(8),
.right li:nth-child(9),
.right li:nth-child(11) {
  margin-top: 7px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #E5E5E5;
}
.right li:nth-child(7) {
  margin-top: 7px;
  margin-left: -3px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #E5E5E5;
}
.right li:nth-child(10) {
  margin-top: 7px;
  margin-left: -2px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #E5E5E5;
}
.right li:nth-child(12) {
  margin-top: 7px;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
  border-left: 6px solid #E5E5E5;
}
.right li:nth-child(13),
.right li:nth-child(14) {
  margin-top: 7px;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid #f8475b;
}
.ticket:after {
  content: '';
  position: absolute;
  right: 200px;
  top: 0px;
  width: 2px;
  height: 250px;
  box-shadow: inset 0 0 0 #f8475b, inset 0 -10px 0 #B56E0A, inset 0 -20px 0 #f8475b, inset 0 -30px 0 #B56E0A, inset 0 -40px 0 #f8475b, inset 0 -50px 0 #999999, inset 0 -60px 0 #E5E5E5, inset 0 -70px 0 #999999, inset 0 -80px 0 #E5E5E5, inset 0 -90px 0 #999999, inset 0 -100px 0 #E5E5E5, inset 0 -110px 0 #999999, inset 0 -120px 0 #E5E5E5, inset 0 -130px 0 #999999, inset 0 -140px 0 #E5E5E5, inset 0 -150px 0 #B0B0B0, inset 0 -160px 0 #EEEEEE, inset 0 -170px 0 #B0B0B0, inset 0 -180px 0 #EEEEEE, inset 0 -190px 0 #B0B0B0, inset 0 -200px 0 #EEEEEE, inset 0 -210px 0 #B0B0B0, inset 0 -220px 0 #f8475b, inset 0 -230px 0 #B56E0A, inset 0 -240px 0 #f8475b, inset 0 -250px 0 #B56E0A;
}
.content {
  position: absolute;
  top: 40px;
  width: 100%;
  height: 170px;
  background: #fff;
}
.airline {
  position: absolute;
  top: 10px;
  left: 6%;
  font-family: Arial;
  font-size: 15px;
  font-weight: bold;
  color: rgba(0, 0, 102, 1);
}
.jfk {
  position: absolute;
  top: 32px;
  left: 25px;
  font-family: Arial;
  font-size: 45px;
  color: #222;
}
.sub-content {
  
  width: 100%;
  height: 100px;
  position: absolute;
  top: 70px;
}
.name {
  position: absolute;
  top: 10px;
  left: 30px;
  font-family: Arial Narrow, Arial;
  font-weight: bold;
  font-size: 14px;
  color: #999;
}
.name span {
  color: #555;
  font-size: 17px;
}
.flight {
  position: absolute;
  top: 10px;
  left: 140px;
  font-family: Arial Narrow, Arial;
  font-weight: bold;
  font-size: 14px;
  color: #999;
}
.flight span {
  color: #555;
  font-size: 17px;
}
.gate {
  position: absolute;
  top: 10px;
  left: 260px;
  font-family: Arial Narrow, Arial;
  font-weight: bold;
  font-size: 14px;
  color: #999;
}
.gate span {
  color: #555;
  font-size: 17px;
}
.seat {
  position: absolute;
  top: 10px;
  left: 340px;
  font-family: Arial Narrow, Arial;
  font-weight: bold;
  font-size: 14px;
  color: #999;
}
.seat span {
  color: #555;
  font-size: 17px;
}
.barcode {
  position: absolute;
  left: 8px;
  bottom: 6px;
  height: 30px;
  width: 90px;
  background: #222;
  box-shadow: inset 0 1px 0 #f8475b, inset -2px 0 0 #f8475b, inset -4px 0 0 #222, inset -5px 0 0 #f8475b, inset -6px 0 0 #222, inset -9px 0 0 #f8475b, inset -12px 0 0 #222, inset -13px 0 0 #f8475b, inset -14px 0 0 #222, inset -15px 0 0 #f8475b, inset -16px 0 0 #222, inset -17px 0 0 #f8475b, inset -19px 0 0 #222, inset -20px 0 0 #f8475b, inset -23px 0 0 #222, inset -25px 0 0 #f8475b, inset -26px 0 0 #222, inset -26px 0 0 #f8475b, inset -27px 0 0 #222, inset -30px 0 0 #f8475b, inset -31px 0 0 #222, inset -33px 0 0 #f8475b, inset -35px 0 0 #222, inset -37px 0 0 #f8475b, inset -40px 0 0 #222, inset -43px 0 0 #f8475b, inset -44px 0 0 #222, inset -45px 0 0 #f8475b, inset -46px 0 0 #222, inset -48px 0 0 #f8475b, inset -49px 0 0 #222, inset -50px 0 0 #f8475b, inset -52px 0 0 #222, inset -54px 0 0 #f8475b, inset -55px 0 0 #222, inset -57px 0 0 #f8475b, inset -59px 0 0 #222, inset -61px 0 0 #f8475b, inset -64px 0 0 #222, inset -66px 0 0 #f8475b, inset -67px 0 0 #222, inset -68px 0 0 #f8475b, inset -69px 0 0 #222, inset -71px 0 0 #f8475b, inset -72px 0 0 #222, inset -73px 0 0 #f8475b, inset -75px 0 0 #222, inset -77px 0 0 #f8475b, inset -80px 0 0 #222, inset -82px 0 0 #f8475b, inset -83px 0 0 #222, inset -84px 0 0 #f8475b, inset -86px 0 0 #222, inset -88px 0 0 #f8475b, inset -89px 0 0 #222, inset -90px 0 0 #f8475b;
}
.slip {
  left: 455px;
}
.jfkslip {
  font-size: 30px;
  top: 10px;
  left: 420px;
}
.airlineslip {
  left: 450px;
}
html, body {
	height: 100%;
	width:100%;
	margin: 0;
	padding: 0;
}

.wrapper {
	height:auto;
	min-height:100%;
	padding-bottom: 60px;
}


.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}


</style>
</head>
<body>
	<div class="wrapper" >
		<h2>영화예매내역</h2>
		<div class="main-content">
		<div class="cols-12">
			<c:forEach items="${mvList}" var="mv">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">예매번호</th>
							<th scope="col">예매일</th>
							<th scope="col">영화명</th>
							<th scope="col">관람일</th>
							<th scope="col">상영시간</th>
							<th scope="col">좌석이름</th>
							<th scope="col">더보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">${mv.mvReservNo}</td>
							<td>${mv.reservDt}</td>
							<td>${mv.name}</td>
							<td>${mv.schDate}</td>
							<td>${mv.schTime}</td>
							<td>${mv.seatName}</td>
							<td><input type="button" class="checkBtn" value="더보기"/></td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</div>
	</div>
	<div class="modal">
  <div class="modal_content" 
       title="클릭하면 창이 닫힙니다.">
    <div class="box">
        <ul class="left">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
        <ul class="right">
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
          <li></li>
        </ul>
        <div class="ticket">
          <span class="airline">YEDAM BOX</span>
          <span class="airline airlineslip">YEDAM BOX</span>
          <div class="content">
            <span class="jfk"id="mvName"></span>
            <span class="jfk jfkslip"> <img src="https://chart.googleapis.com/chart?cht=qr&chl=https%3A%2F%2Fcodepen.io%2FMitchES%2Fpen%2FoezJBZ&chs=180x180&choe=UTF-8&chld=L|2" width="160px"></span>
            <span class="plane planeslip"><?xml version="1.0" ?></span>
            <div class="sub-content">
              <span class="flight">상영시간<br><span id="schTime"></span></span>
              <span class="name">관람일<br><span id="schdate"></span></span>
              <span class="gate">예매번호<br><span id="mvReservNo"></span></span>
              <span class="seat">좌석<br><span id="seat"></span></span>
            </div>
          </div>
          <div class="barcode"></div>
          <div class="barcode slip"></div>
        </div>
      </div>
  </div>
</div>
<script type="text/javascript">




$(".checkBtn").click(function() {

	  var str = ""
	  var tdArr = new Array(); // 배열 선언
	  var checkBtn = $(this);

	  // checkBtn.parent() : checkBtn의 부모는 <td>이다.
	  // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	  var tr = checkBtn.parent().parent();
	  var td = tr.children();

	  console.log("클릭한 Row의 모든 데이터 : " + tr.text());

	var mvReservNo = td.eq(0).text();
	  var mvName = td.eq(2).text();
	  var schDate = td.eq(3).text();
	  var schTime = td.eq(4).text();
	  var seatName = td.eq(5).text();


	  // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	  td.each(function(i) {
	    tdArr.push(td.eq(i).text());
	  });
	
	  $(".modal").fadeIn();
	  $("#mvName").html(mvName)
	  $("#schdate").html(schDate)
	  $("#schTime").html(schTime)
	  $("#mvReservNo").html(mvReservNo)
	  $("#seat").html(seatName)
	  $(".modal_content").click(function(){
		    $(".modal").fadeOut();
		  });
	  
	  console.log("배열에 담긴 값 : " + tdArr);

	  str += " * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
	    ", 아이디 : <font color='red'>" + mvName + "</font>" +
	    ", 이름 : <font color='red'>" + schDate + "</font>" +
	    ", 이메일 : <font color='red'>" + schTime + "</font>";

	  $("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());
	  $("#ex2_Result2").html(str);
	  console.log(str);
	});


</script>
</body>
</html>