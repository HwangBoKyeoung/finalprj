<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="./resources/users/js/core/jquery.min.js" type="text/javascript"></script>

<style>
#plus, #minus, #cnt {
	border: 1px solid black;
	width: 50px;
	height: 50px;
	font-size: 30px;
	text-align: center;
	float: left;
	background-color: #cfc5e9;
}
.seatGray {
	background: gray;
}
   .container-fluid{
      margin-top: 50px;
   }
   
   #movieList{
      line-height: 30px;
      padding-top: 20px;
      padding-bottom: 20px;
      padding-left: 15px;
      overflow: scroll;
      height: 500px;
   }
   
   #movieList>div:hover{
      background: #a1a1a196;
   }
   
   .col-lg-2, .col-lg-4, .col-lg-3{
       padding : 0px;
      margin-right: 10px;
      border: 0.7px solid gray;
      margin-bottom: 20px;
   }
   .col-lg-6{
      padding : 0px;
      margin-right: 20px;
      border: 0.7px solid gray;
      margin-bottom: 20px;
   }   
   .col-lg-2>h5, .col-lg-4 tr>td>h5, .col-lg-6 h5{
      padding : 30px 30px;
      margin: 0px;
      background: #cfc5e9;
      color: #ffffff;
      text-align: center;
   }
   
   .col-lg-4 table ul{
      list-style: none;
      padding-top: 20px;
      padding-bottom: 20px;
      line-height: 30px;
      padding-left: 15px;
   }
   
   .col-lg-4 tr:nth-child(2) ul{
      position: absolute;
   }
   
   .col-lg-4 li:hover{
      background: #a1a1a196;
   }
   
   #seat td{
      padding-top: 20px;
   }
   
   #showTime>ul{
      padding-top: 20px;
      padding-bottom: 20px;
      line-height: 30px;
      padding-left: 15px;
      list-style: none;
   }
   
   #showTime li{
      display: inline-block;
      border: 0.5px solid gray;
      text-align: center;
      /* background: #f6f6f6; */
      width: 45%;
      line-height: 150%;
   }
   
   #showTime li:hover{
      background: #a1a1a196;
   }
   
   #datepicker{
      display: grid;
      place-content: center;
      gap: 1ch;
      margin-top: 20px;
      margin-bottom: 30px;
   }
   #finalReserv{
      padding-top: 20px;
      line-height: 35px;
      text-align: left;
      padding-bottom: 60px;
      padding-left: 20px;
   }
   
   #payBtn{
      width: 100%;
      height: 10%;
   }
   
   #selectedSeat td{
       border-collapse: separate;
       border: 1px solid #e6def9;
       width:55px;
       height:65px;
    }
    
    .selectedSeat,.selectedList,.selectedLoc,.selectedHall,.showTime{
        background-color: #e6def9;
    }
   
    #seat td{
       padding: 15px;
       margin: 5px;
    }
    
    #selectedSeat td{
       text-align: center;
    }
    
    #seat td:hover{
       background: #a1a1a196;
    }
    
    #seat td:nth-child(3){
       background: transparent;
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
   
   body {
      margin: 0;
      padding: 0;
      background: #fff;
   }
   
   .all{
      background-color : greenyellow;
      border-radius: 50%;
   }
   
   .a{
      background-color : skyblue;
      border-radius: 50%;
   }
   
   .b{
      background-color : yellow;
      border-radius: 50%;
   }
   
   .c{
      background-color : rgb(255, 0, 34);
      border-radius: 50%;
   }
   
   .d{
      background-color : #7c807d;
      border-radius: 50%;
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
   
   .barcode{
      position: absolute;
      left: 8px;
      bottom: 6px;
      height: 30px;
      width: 90px;
      background: #222;
      box-shadow: inset 0 1px 0 #f8475b, inset -2px 0 0 #f8475b, inset -4px 0
         0 #222, inset -5px 0 0 #f8475b, inset -6px 0 0 #222, inset -9px 0 0
         #f8475b, inset -12px 0 0 #222, inset -13px 0 0 #f8475b, inset -14px 0
         0 #222, inset -15px 0 0 #f8475b, inset -16px 0 0 #222, inset -17px 0 0
         #f8475b, inset -19px 0 0 #222, inset -20px 0 0 #f8475b, inset -23px 0
         0 #222, inset -25px 0 0 #f8475b, inset -26px 0 0 #222, inset -26px 0 0
         #f8475b, inset -27px 0 0 #222, inset -30px 0 0 #f8475b, inset -31px 0
         0 #222, inset -33px 0 0 #f8475b, inset -35px 0 0 #222, inset -37px 0 0
         #f8475b, inset -40px 0 0 #222, inset -43px 0 0 #f8475b, inset -44px 0
         0 #222, inset -45px 0 0 #f8475b, inset -46px 0 0 #222, inset -48px 0 0
         #f8475b, inset -49px 0 0 #222, inset -50px 0 0 #f8475b, inset -52px 0
         0 #222, inset -54px 0 0 #f8475b, inset -55px 0 0 #222, inset -57px 0 0
         #f8475b, inset -59px 0 0 #222, inset -61px 0 0 #f8475b, inset -64px 0
         0 #222, inset -66px 0 0 #f8475b, inset -67px 0 0 #222, inset -68px 0 0
         #f8475b, inset -69px 0 0 #222, inset -71px 0 0 #f8475b, inset -72px 0
         0 #222, inset -73px 0 0 #f8475b, inset -75px 0 0 #222, inset -77px 0 0
         #f8475b, inset -80px 0 0 #222, inset -82px 0 0 #f8475b, inset -83px 0
         0 #222, inset -84px 0 0 #f8475b, inset -86px 0 0 #222, inset -88px 0 0
         #f8475b, inset -89px 0 0 #222, inset -90px 0 0 #f8475b;
   }

   .slip {
      left: 455px;
   }

   .jfkslip {
      font-size: 30px;
      top: 10px;
      left: 420px;
   }
   
   .jfk {
      position: absolute;
      top: 32px;
      left: 25px;
      font-family: Arial;
      font-size: 45px;
      color: #222;
   }
   
   .airlineslip {
      left: 450px;
   }

   .wrapper {
      height: auto;
      min-height: 100%;
      padding-bottom: 60px;
   }

   .modal{ 
     position:absolute; width:160%; height:160%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
   }
   
   .modal_content{
     width:400px; 
     height:200px;
     background:#fff; 
     border-radius:10px;
     position:relative; 
     top:50%; 
     left:33%;
     margin-top:-100px; 
     margin-left:-200px;
     text-align:center;
     box-sizing:border-box; 
     padding:74px 0;
     line-height:23px; 
     cursor:pointer;
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
   
   .left li:nth-child(3), .left li:nth-child(6) {
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
   
   .left li:nth-child(7), .left li:nth-child(9), .left li:nth-child(11),
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
   
   .right li:nth-child(3), .right li:nth-child(4), .right li:nth-child(6) {
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
   
   .right li:nth-child(8), .right li:nth-child(9), .right li:nth-child(11)
      {
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
   
   .right li:nth-child(13), .right li:nth-child(14) {
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
      box-shadow: inset 0 0 0 #f8475b, inset 0 -10px 0 #B56E0A, inset 0 -20px
         0 #f8475b, inset 0 -30px 0 #B56E0A, inset 0 -40px 0 #f8475b, inset 0
         -50px 0 #999999, inset 0 -60px 0 #E5E5E5, inset 0 -70px 0 #999999,
         inset 0 -80px 0 #E5E5E5, inset 0 -90px 0 #999999, inset 0 -100px 0
         #E5E5E5, inset 0 -110px 0 #999999, inset 0 -120px 0 #E5E5E5, inset 0
         -130px 0 #999999, inset 0 -140px 0 #E5E5E5, inset 0 -150px 0 #B0B0B0,
         inset 0 -160px 0 #EEEEEE, inset 0 -170px 0 #B0B0B0, inset 0 -180px 0
         #EEEEEE, inset 0 -190px 0 #B0B0B0, inset 0 -200px 0 #EEEEEE, inset 0
         -210px 0 #B0B0B0, inset 0 -220px 0 #f8475b, inset 0 -230px 0 #B56E0A,
         inset 0 -240px 0 #f8475b, inset 0 -250px 0 #B56E0A;
   }
</style>
</head>
<body>
   <div class="container-fluid">
      <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
               <h5>영화선택</h5>
               <div id="movieList">
                  <c:forEach var="m" items="${movies}">
                     <div data-cd="${m.docId}" data-poster="${m.fileCd}">
                        ${m.name}
                        <c:choose>
                           <c:when test="${m.rating eq '전체관람가'}">
                              <span class="all">ALL</span>
                           </c:when>
                           <c:when test="${m.rating eq '12세관람가'}">
                              <span class="a">12</span>
                           </c:when>
                           <c:when test="${m.rating eq '15세관람가'}">
                              <span class="b">15</span>
                           </c:when>
                           <c:when test="${m.rating eq '18세관람가(청소년관람불가)'}">
                              <span class="c">18</span>
                           </c:when>
                           <c:otherwise>
                              <span class="d">미정</span>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </c:forEach>
               </div>
            </div>
            <div class="col-lg-4">
               <table style="width: 100%;">
                  <tbody>
                     <tr>
                        <td colspan="2"><h5>지역</h5></td>
                     </tr>
                     <tr>
                        <td><ul id="hallList"></ul></td>
                        <td><ul id="locList"></ul></td>
                     </tr>
                  </tbody>
               </table>               
            </div>
            <div class="col-lg-2">
               <h5>날짜</h5>
               <div id="datepicker" style="width:100%;"></div>
               <div id="showTime" style="display:none;">
                  <ul>
                     <li>09:00 ~ 12:00</li>
                     <li>12:00 ~ 15:00</li>
                     <li>15:00 ~ 18:00</li>
                     <li>18:00 ~ 21:00</li>
                     <li>21:00 ~ 24:00</li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
            <div class="col-lg-1"></div>
         <div class="col-lg-6" style="padding-bottom: 20px;">
            <h5>자리배치도</h5>
            <hr id="hrs" align="center" style="border:solid 1.5px purple; width: 50%; display:none;">
            <div id="divs" style="font-size: 100%; text-align: center; color:#a1a1a196; display:none;">SCREEN</div>
            <br>
            <div id="seat" align="center"></div>
            <div class="row align-items-end">
            </div>
         </div>
         <div class="col-lg-2" style="text-align: center; padding-top: 20px;">
            <img id="moviePoster" style="display:none;">
            <div id="finalReserv" style="display:none;">
            	<div class="col" style="display:none;" id="seatResult">
            	<div>관람객수</div>
            	<div style="display:inline-block;">
                   
							<div id="minus">-</div>
							<div id="cnt">0</div>
							<div id="plus">+</div>
						
                  </div>
                  <span><br><br>선택좌석</span>
                  <table id="selectedSeat">
                     <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                     </tr>
                  </table>
               </div>
               <div id="info">
               		<div><span id="mName">dfsdfsdfdsf</span> // <span id="mRating"></span></div>
               		<div>위치<span id="mLoc">fsdfsdfdsf</span> // <span id="mHall"></span></div>
               		<div>일자<span id="mDate">fsdfsdf</span> // <span id="mTime"></span></div>
               </div>
            </div>
         <form action="movieReservation.do" method="post">  
         <input type="hidden" id="docId" name="docId">
         <!-- 무비넘버 -->
         <input type="hidden" id="reservLoc" name="reservLoc">
         <!-- 지역 -->
         <input type="hidden" id="reservHall" name="reservHall">
         <!-- 영화관 -->
         <input type="hidden" id="UId" name="UId" value="enc1115">
         <!-- 사용자 -->
         <input type="hidden" id="schDate" name="schDate">
         <!-- 날짜-->
         <input type="hidden" id="schTime" name="schTime">
         <!-- 시간 -->
         <input type="hidden" id="seatName" name="seatName">
         <!-- 좌석이름 -->
         <button type="submit" id="payBtn" style="display:none;" class="btn btn-warning">결제하기</button>
  		 </form>
          <input type="hidden" id="name" name="name">
         </div>
      </div>
      
   </div>
   
   <script>

    
      //영화관지역
      $('#movieList').on('click','div',selectedList);      
      function selectedList() {
         let posterArry = event.target.getAttribute('data-poster').split('|');
         moviePoster.setAttribute('src', posterArry[0]);
         docId.value = event.target.getAttribute('data-cd');
         //버튼누르면 색바뀜
         let childNodes = event.target.parentNode.children;
         for (var i = 1; i < childNodes.length; i++) {
            childNodes[i].classList.remove('selectedList');
         }
         event.target.setAttribute('class', 'selectedList');
         $('#hallList').empty();
         $.ajax({
            url : "movieHallList.do",
            type : "post",
            data : {
               docId : $(event.target).data("cd")
            },
            success : function(data) {
               for (var i = 0; i < data.length; i++) {
                  let li = document.createElement('li');
                  li.setAttribute("data-loc", data[i].loc);
                  li.innerText = data[i].loc + '(' + data[i].mvNo + ')';
                  hallList.append(li);
               }
            }
         });
      };
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      $('#hallList').on('click','li',selectedLoc);
      function selectedLoc() {
         $('#reservLoc').val($(event.target).data("loc"));
         //버튼누르면 색바뀜
         let childNodes = event.target.parentNode.childNodes;
         for (var i = 0; i < childNodes.length; i++) {
        	 childNodes[i].classList.remove('selectedList');
         }
         event.target.setAttribute('class', 'selectedList');
         $('#locList').empty();
         $.ajax({
            url : "movieLocList.do",
            type : "post",
            data : {
               loc : $(event.target).data("loc")
            },
            success : function(data) {
               for (var i = 0; i < data.length; i++) {
                  let li = document.createElement('li');
                  li.setAttribute("data-docid", data[i].docId);
                  li.setAttribute("data-hallNo", data[i].mvHallNo);
                  li.setAttribute("data-name", data[i].name);
                  li.innerText = data[i].name + ' 영화관';
                  locList.append(li);
               }

            }
         });
      }
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      $('#locList').on('click','li',selectedHall);
      function selectedHall() {
         $('#reservHall').val($(event.target).data("name"));
         //버튼누르면 색바뀜
         let childNodes = event.target.parentNode.childNodes;
         for (var i = 0; i < childNodes.length; i++) {
        	 childNodes[i].classList.remove('selectedList');
         }
         event.target.setAttribute('class', 'selectedList');
         $.ajax({
            url : "movieSchdtList.do",
            type : "post",
            data : {
               docId : $(event.target).data("docid")
            },
            success : function(data) {
               $("#datepicker").datepicker({
                  minDate : 0,
                  maxDate : data[0].schDt,
                  onSelect : function() {
                     date = $("#datepicker").val();
                     var sDate = date.split('/');
                     let mm = sDate[0];
                     let yy = sDate[2];
                     let dd = sDate[1];
                     let sumDate = yy + '-' + mm + '-' + dd;
                     $('#resultDate').val(sumDate);
                     $('#schDate').val(sumDate);
                     showTime.style.display = "block";
                  }
               });
            }
         });
      }
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      $('#showTime').on('click','li',selectedTime);
      function selectedTime() {
          $(".col").css("display", "block");
          $('#moviePoster').css("display", "block");
          $('#finalReserv').css('display',"block");
          $('#payBtn').css('display',"block");
          //버튼누르면 색바뀜
          let childNodes = event.target.parentNode.children;
          for (var i = 0; i < childNodes.length; i++) {
        	  childNodes[i].classList.remove('selectedList');
          }
          event.target.setAttribute('class', 'selectedList');
          $('#schTime').val($(event.target).text());
          //영화(docId),지역,영화관이름,날짜,시간을 ajax로 넘겨서 예약된좌석이름을 가져옴                  
          // 황보경수정
          
          let divLoc = $("<div>");
          let divHall = $("<div>");
          
          let local = $('#reservLoc').val();
          let halls = $('#reservHall').val();
          
          let dates = $('#schDate').val();
          let times = $('#schTime').val(); 
          $('#info').empty();
          
          divLoc.append('위치: ' + local + '|' + halls);
          divHall.append('일자: ' + dates + '|' + times);                    
           $("#info").append(divLoc,divHall);                     
          $.ajax({
                   url : "seatSearch.do",
                   type : "post",
                   data : {
                      "docId" : $('#docId').val(),
                      "reservLoc" : $('#reservLoc').val(),
                      "reservHall" : $('#reservHall').val(),                          
                      "schDate" : $('#schDate').val(),
                      "schTime" : $('#schTime').val()
                   },
                   success : function(result) {
                      //좌석
                      $('#seat').empty();
                      $('#hrs').css("display", "block");
                      $('#divs').css("display", "block");
                      var i, j;
                      const memNum = 42; // 전체 입장객 
                      const colNum = 7; // 한 줄에 앉을 사람                               
                      if (memNum % colNum == 0)
                         rowNum = parseInt(memNum / colNum);
                      else
                         rowNum = parseInt(memNum / colNum) + 1;
                      let table = document.createElement('table');
                      for (i = 0; i < rowNum; i++) {
                         var A = 65 + i;
                         var tr = document.createElement('tr');
                         for (j = 1; j <= colNum; j++) {
                            seatNo = j; // 좌석 번호
                            if (seatNo > memNum)
                               break;                                       
                            var td = document.createElement('td');
                            var btn = document.createElement('button');
                            let seatChr = String.fromCharCode(A);
                            td.append(btn);
                            td.name = seatChr + seatNo;
                            td.setAttribute('data-seatName',seatChr + '-'+ seatNo);
                            td.innerText = seatChr+'-'+seatNo;
                            
                            tr.append(td);
                         }
                         table.append(tr);
                      }
                      $('#seat').append(table);
                      var cnt = 0;
                      console.log("처음 cnt"+cnt);
                      var seatTd = $('#seat td');
                  	////////////////////////////
                      for (i = 0; i < seatTd.length; i++) {
                    	  seatTd.eq(i).on('click',selectSeat);
                      };
                      function selectSeat() {
                   	//선택된 좌석을 좌석표 밑에 표시하기
								let selectedSeat = document.getElementById('selectedSeat');
								let tdList = selectedSeat.getElementsByTagName('td');								
								//seatGray class의 수 만큼만 좌석을 선택가능 
								if ($('#selectedSeat .seatGray').length > cnt) {									
									if($(event.target).hasClass("selectedSeat")){
										$(event.target).removeClass("selectedSeat");
										tdList[cnt-1].innerText = "-";
										cnt--;
									}else{
										tdList[cnt].innerText = $(event.target).text();
										//클릭한 td class 추가 
										this.setAttribute('class','selectedSeat');
										//input name 에 값넣기 누적
										seatName.value += $(event.target).text();
										console.log('자리더한후 seatName'+seatName.value);
										++cnt;
									}
								console.log("좌석을 선택후cnt"+cnt);
								} else if ($('#selectedSeat .seatGray').length == 0) {//seatGray class의 수가 0이면
									alert("인원선택을 먼저해주세요!!!");
								} else if ($('#selectedSeat .seatGray').length < cnt) {
									cnt = 0;
								};				
                      }//end selectseat
                      let seatNameArry = [];
							//예약된 좌석문자열을(ex.F-5F-6F-7) 하나의단일 좌석으로 쪼갠다.	    	
							if (result.length == 0) {
								console.log("result is null");
							} else {
								console.log("result > 0");
								for (var i = 0; i < result.length; i++) {
									var splitSeatName = result[i].seatName;
									for (var j = 0; j < splitSeatName.length; j += 3) {
										seatNameArry.push(splitSeatName.substr(j,3));
									}
								}
							}

                      ///예약된좌석 이벤트 없애기
                      for (var i = 0; i < seatNameArry.length; i++) {                      
                         var a = "#seat td:contains("+ seatNameArry[i]+ ")";
                         $($(a)[0]).off('click');
                         $(a).css("backgroundColor","black");
                      }
                   }
                });

       };
      
     //인원추가하는 버튼
     	$('#plus').on("click", function() {
     		
     		var cnt = $('#cnt').text();
     		if ($('#cnt').text() == 6) {
     			$('#cnt').text(6);
     			cnt = 6;
     			alert("최대 예약인원은 6명입니다.");
     		} else {
     			//예약인원을 늘릴때마다 회색으로 칠하기
     			let selectedSeat = document.getElementById('selectedSeat');
     			let tdList = selectedSeat.getElementsByTagName('td');
     			tdList[cnt].setAttribute('class', 'seatGray');
     			cnt++;
     			console.log("+++++++++++++버튼 누른후 seatGray 수"+$('#selectedSeat .seatGray').length);
     			console.log("+++++++++++++버튼을 누를때마다 cnt값"+cnt);
     			$('#cnt').text(cnt);
     		}
     	});
     	//인원다운하는 버튼
     	$('#minus').on("click", function() {
     		var cnt = $('#cnt').text();
     		
     		if ($('#cnt').text() <= 0) {
     			$('#cnt').text(0);
     			cnt = 0;
     		}else {
     			--cnt;
     			//예약인원을 줄일 때 마다 seatGray class없애기
     			let selectedSeat = document.getElementById('selectedSeat');
     			let tdList = selectedSeat.getElementsByTagName('td');
     			tdList[cnt].innerText = '-';
     			tdList[cnt].classList.remove('seatGray');
     			//결제폼으로 넘겨줄 #seatName값 하나씩자르기
     			let str=seatName.value;
     			let a=str.substring(0,str.length-3);
     			seatName.value=a;
     			let b= str.substring(str.length-3,str.length);
     			var c = "#seat td:contains("+ b + ")";
     			console.log($($(c)[0]));
     			$($(c)[0]).removeClass();
     			$('#cnt').text(cnt);
     			console.log("---------버튼 누른후 seatGray 수"+$('#selectedSeat .seatGray').length);
     			console.log("---------버튼을 누를때마다cnt값"+cnt);
     		} 
     		
     	});
   </script>
</body>

</html>