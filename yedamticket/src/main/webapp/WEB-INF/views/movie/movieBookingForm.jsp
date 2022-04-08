<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
 <script src="./resources/users/js/core/jquery.min.js"
		type="text/javascript"></script>
<style> 

    #selectedSeat td{
    	
    	border: 1px solid #444444;
    	width:55px;
    	height:65px;
    	
    }
    .selectedSeat,.selectedList,.selectedLoc,.selectedHall,.showTime{
        background-color: purple;
    }
    .nonSelectedSeat,.nonSelectedList,.nonSelectedLoc,.nonSelectedHall,.nonShowTime{
        background-color: white;
    }
    #showTime{
    display:none;
    }
    .col-lg-3{
    border:solid 1px #000000;
    text-align:center;
     width: 300px;
     height: 500px;
	overflow: auto;
    }
    .col{
   
    text-align:center;
     width: 200px;
     height: 250px;
	float:bottom;
    }
	
#movieList{
	text-align:left;
	font-size:14px;
	padding:5px;
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

.airlineslip {
	left: 450px;
}

html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
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
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:33%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>
</head>

<body>
<div class="container">
        <div class="row">
        	<div class="col-lg-3" >  
        	 <h2> 영화선택</h2>
        		<div id="movieList" >
        		<c:forEach var="m" items="${movies }">
        				<div data-cd="${m.docId }" data-poster="${m.fileCd }">${m.name }
        				<c:choose >
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
        <div class="col-lg-3">
                <h2>지역</h2>
                <ul id="hallList">
                
                </ul>
          </div>
          <div class="col-lg-3">
                <h2>영화관</h2>
               
                <ul id="locList">
                   
                </ul>
               
          </div>
           
          <div class="col-lg-3">
                <h2>날짜</h2>
                <div id="datepicker"></div>
              
               	<div id="showTime">
               		<ul>
               			<li>09:00 ~ 12:00</li>
               			<li>12:00 ~ 15:00</li>
               			<li>15:00 ~ 18:00</li>
               			<li>18:00 ~ 21:00</li>
               			<li>21:00 ~ 24:00</li>
               		</ul>
               		
               	</div>
          </div>
          <div class="col-lg-3">
          		<img id="moviePoster" >
          		
        	
          </div>
          <div class="col-lg-3">
           <h2>자리 배치도</h2>
                <div id="seat" align="center">
    			</div>  
                </div> 
                <div class="row align-items-end">
                	<div class="col" >
                		<h5>관람객수</h5>
							<select id="peopleCnt" name="peopleCnt">
							    <option value="1">1명</option>
							    <option value="2">2명</option>
							    <option value="3">3명</option>
							    <option value="4">4명</option>
							    <option value="5">5명</option>
							    <option value="6">6명</option>
							</select>	
                </div>
                	
                	<div class="col" id="seatResult">
                		<h5>선택한 좌석</h5>
                	<table id="selectedSeat">
                		<tr>
                			<td>-</td>
                			<td>-</td>
                		</tr>
                		<tr>
                			<td>-</td>
                			<td>-</td>
                		</tr>
                		<tr>
                			<td>-</td>
                			<td>-</td>
                		</tr>
                	</table>
                	</div>
                	
                </div>
          </div>
          <div>
        </div>
        <button type="button" id="payBtn" class="btn btn-warning">결제하기</button>
      </div>
      <form action="movieReservation.do" method="post">
   	<div class="modal">
   		<input type="text" id="docId" name="docId"><!-- 무비넘버 -->
        <input type="text" id="reservLoc" name="reservLoc"><!-- 지역 -->
        <input type="text" id="reservHall" name="reservHall"><!-- 영화관 -->
        <input type="text" id="UId" name="UId" value="enc1115"><!-- 사용자 -->
        <input type="text" id="schDate" name="schDate"><!-- 날짜-->
        <input type="text" id="schTime" name="schTime"><!-- 시간 -->
        <input type="text" id="seatName" name="seatName"><!-- 좌석이름 -->
		<div class="modal_content">
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
					<span class="airline">YEDAM BOX</span> <span
						class="airline airlineslip">YEDAM BOX</span>
					<div class="content">
						<span class="jfk" id="mvName"></span> <span class="jfk jfkslip">
							<img id="ticketImg" width="160px">
							
							
						</span> <span class="plane planeslip">
							<?xml version="1.0" ?>
						</span>
						<div class="sub-content">
							<span class="flight">상영시간<br>
							<span id="schTime1"></span></span> <span class="name">관람일<br>
							<span id="schdate1"></span></span> <span class="gate">예매번호<br>
							<span id="mvReservNo1"></span></span> <span class="seat">좌석<br>
							<span id="seat1"></span></span>
						</div>
					</div>
					<div class="barcode"></div>
					<div class="barcode slip">
					<button type="submit" class="btn">예매하기</button>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
	</form>
<script>

var i,j;
for(i=0;i<8;i++){
	let row=document.createElement('div');
	row.setAttribute('class','row');
	for(j=0;j<8;j++){
		let col=document.createElement('div');
		col.setAttribute('class','seat');
		row.append(col);
	}
	$('.seatContainer').append(row);
}


//modal
$(function(){ 

  $("button").click(function(){
    $(".modal").fadeIn();
  });
  
  $(".modal_content").click(function(){
    $(".modal").fadeOut();
  });
  
});

//payBtn
$('#payBtn').click(function(){
	console.log("payBtn");
	
	
	$("#schdate1").html($('#schDate').val());
	$("#schTime1").html($('#schTime').val());
	$("#mvReservNo1").html($('#mvReservNo').val());
	$("#seat1").html($('#seatName').val());
});


var cnt=0;
let pCnt=0;
	$(function peopleCnt(){
	$('#peopleCnt').change(function(){
		var peopleCnt=$(this).find('option:selected');
		var myVal=peopleCnt.attr('value');
		
		pCnt=myVal;
	});
});


console.log(pCnt);
//영화관지역
movieList.addEventListener('click',selectedList);
function selectedList(){
	
	console.log(event.target.getAttribute('data-poster'));
	let posterArry=event.target.getAttribute('data-poster').split('|');
	moviePoster.setAttribute('src',posterArry[0]);
	ticketImg.setAttribute('src',posterArry[0]);
	docId.value=event.target.getAttribute('data-cd');
	//버튼누르면 색바뀜
		let childNodes=event.target.parentNode.children;
	 for(var i=1;i<childNodes.length;i++){
	childNodes[i].setAttribute('class','nonSelectedList');  
	} 
    event.target.setAttribute('class','selectedList');  
    
    $('#hallList').empty();
	$.ajax({
        url : "movieHallList.do",
        type : "post",
        data : {docId : $(event.target).data("cd")},
        success : function (data) {
            console.log(data);
            for(var i=0;i<data.length;i++){
            	let li=document.createElement('li');
            	li.setAttribute("data-loc",data[i].loc);  
            	li.innerText=data[i].loc+'('+data[i].mvNo+')';         	
            	hallList.append(li);
            }
        }
    });
}
hallList.addEventListener('click',selectedLoc);
function selectedLoc(){
	 
	 $('#reservLoc').val($(event.target).data("loc"));
	//버튼누르면 색바뀜
		let childNodes=event.target.parentNode.childNodes;
		 for(var i=0;i<childNodes.length;i++){
		childNodes[i].setAttribute('class','nonSelectedList');  
		} 
	    event.target.setAttribute('class','selectedList');  
    $('#locList').empty();
    $.ajax({
    	url:"movieLocList.do",
    	type:"post",
    	data:{loc:$(event.target).data("loc")},
    	success :function(data){
    		console.log(data);
    		for(var i=0;i<data.length;i++){
            	let li=document.createElement('li');
            	li.setAttribute("data-docid",data[i].docId);  
            	li.setAttribute("data-hallNo",data[i].mvHallNo);  
            	li.setAttribute("data-name",data[i].name);
            	li.innerText=data[i].name+' 영화관';         	
            	locList.append(li);
            }
    		
    	} 
    });
}
locList.addEventListener('click',selectedHall);
function selectedHall(){
	console.log(event.target);
	console.log($(event.target).data("hallno"));
	console.log($(event.target).data("docid"));
	$('#reservHall').val($(event.target).data("name"));
	//버튼누르면 색바뀜
	let childNodes=event.target.parentNode.childNodes;
	 for(var i=0;i<childNodes.length;i++){
	childNodes[i].setAttribute('class','nonSelectedList');  
	} 
    event.target.setAttribute('class','selectedList');  
    $.ajax({
    	url:"movieSchdtList.do",
    	type:"post",
    	data:{docId:$(event.target).data("docid")},
    	success:function(data){   		
    		    $( "#datepicker" ).datepicker({
    		      minDate:0, maxDate: data[0].schDt ,
    		      onSelect: function() { 	                                
    		            date = $("#datepicker").val();
    		          var sDate = date.split('/');
    		            console.log('date'+sDate[0]);
    		            let mm=sDate[0];
    		            let yy=sDate[2];
    		            let dd=sDate[1];
    		            let sumDate=yy+'-'+mm+'-'+dd;
    		            $('#resultDate').val(sumDate);
    		            $('#schDate').val(sumDate);
    		            showTime.style.display="block";
    		      }
    		    });
    		  
    	}
    });
}
$('#showTime').on('click',function(){
	//버튼누르면 색바뀜
	let childNodes=event.target.parentNode.children;
	   for(var i=0;i<childNodes.length;i++){
	childNodes[i].setAttribute('class','nonSelectedList');  
	} 
    event.target.setAttribute('class','selectedList');    
    $('#schTime').val($(event.target).text());
    //영화(docId),지역,영화관이름,날짜,시간을 ajax로 넘겨서 예약된좌석이름을 가져옴
    console.log($('#docId').val());
    console.log($('#reservLoc').val());
    console.log($('#reservHall').val());
    console.log($('#schDate').val());
    console.log($('#schTime').val());
    $.ajax({
    	url:"seatSearch.do",
    	type:"post",
    	data:{"docId":$('#docId').val(),
    		  "reservLoc":$('#reservLoc').val(),
    		  "reservHall":$('#reservHall').val(),
    		  "schDate":$('#schDate').val(),
    		  "schTime":$('#schTime').val()
    	},
    	success:function(result){
    		//좌석
			$('#seat').empty();
    		  var i, j;
    		  const memNum =42;  // 전체 입장객 
    		  const colNum = 7;  // 한 줄에 앉을 사람
    		  if (memNum % colNum == 0) 
    		    rowNum = parseInt(memNum / colNum);
    		  else
    		    rowNum = parseInt(memNum / colNum) + 1;

    		  let table=document.createElement('table');
    		  for (i = 0; i < rowNum; i++) {
    		      var A=65+i;
    		      var tr=document.createElement('tr');
    		      for (j = 1; j <= colNum; j++) {
    		          seatNo = j;    // 좌석 번호
    		          if (seatNo > memNum) break;
    		      var td=document.createElement('td');
    		      var btn=document.createElement('button');
    		      
    		      let seatChr=String.fromCharCode(A);
    		       td.append(btn);
    		          td.name=seatChr+seatNo;
    		          td.setAttribute('data-seatName',seatChr+'-'+seatNo);
    		          td.innerText=seatChr+'-'+seatNo;
    		         
    		          tr.append(td);
    		    	}
    		          table.append(tr);
    		  	}
    		      $('#seat').append(table);
    		      var cnt=0;
    		      var seatTd = document.getElementsByTagName('td');
    		      for(i=0;i<seatTd.length;i++){
    		          seatTd[i].addEventListener('click',selectSeat);
    		      };
    		      
    		      function selectSeat(){
    		    	 //선택된 좌석 좌석표 밑에 표시하기
    		    	 let selectedSeat=document.getElementById('selectedSeat');
    		    	 let tdList=selectedSeat.getElementsByTagName('td');
    		    	
    		       
    		         console.log("cnt++후에 cnt"+cnt);
    		         if(3>cnt){
    		        	  tdList[cnt].style.cssText  = 'background:violet'; 
    		        	  tdList[cnt].innerText=$(event.target).text();
    		        	  this.setAttribute('class','selectedSeat');
    		          	  $('#seatName').val($(event.target).text());
    		          	    cnt++;
    		         }else{
    		        	  alert("좌석선택이 완료되엇습니다.");
    		         };		       
    		         
    		      } 		      
    		    ///예약된좌석 이벤트 없애기
    		   	for(var i=0;i<result.length;i++){
    			console.log(result[i].seatName);
    			var a="#seat td:contains("+result[i].seatName+")";
    			$(a)[0].removeEventListener('click',selectSeat);
    			$(a).css("backgroundColor","black");
    			}
   		    } 
    	
    });
    
});

</script>  
</body>

</html>