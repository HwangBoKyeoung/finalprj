<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
</head>
<style>
body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
    table, td {
      border:1px solid #ccc;
      border-collapse: collapse;
    }
    td {
      padding:5px;
      font-size:0.9em;
      
    }
    .selectedSeat,.selectedList,.selectedLoc,.selectedHall,.showTime{
        background-color: blueviolet;
    }
    ul > li{
    list-style:none;
    border:1px solid #ccc;
    }
    #showTime{
    display:none;
    }
</style>
<body>

<div class="container">
        <div class="row">
        	<div class="col-sm">
        		<h2> 영화선택</h2>
        		 <ul id="movieList">
                  
                </ul>
        	</div>
        	
        <div class="col-sm">
                <h2>지역</h2>
                <ul id="hallList">
                
                </ul>
          </div>
          <div class="col-sm">
                <h2>영화관</h2>
               
                <ul id="locList">
                   
                </ul>
               
          </div>
           
          <div class="col-sm">
                <h2>날짜</h2>
                Date: <div id="datepicker"></div>
                <input type="text" id="resultDate">
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
          <div class="col-sm">
           <h2>자리 배치도</h2>
                <div id="seat" ></div> 
                <div id="result">
                <h4>선택한 좌석</h4>
                </div>
          </div>
        </div>
        
      <form action="movieReservation.do" method="post">
        <input type="text" id="mvNo" name="mvNo"><!-- 무비넘버 -->
        <input type="text" id="reservLoc" name="reservLoc"><!-- 지역 -->
        <input type="text" id="reservHall" name="reservHall"><!-- 영화관 -->
        <input type="text" id="uId" name="uId" value="test"><!-- 사용자 -->
        <input type="text" id="schDate" name="schDate"><!-- 날짜+시간값 -->
        <input type="text" id="seatName" name="seatName"><!-- 좌석이름 -->
        <button type="submit">예매하기</button>
       </form>
      </div>
    
<script>


   
var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=U8ECM752YKB763PI62AV&releaseDts=20220301&releaseDte=20220329&listCount=500';
fetch(url)
                .then(response => response.json())
                .then(response => {
                   console.log(response);
                   let list=response.Data[0].Result;
                   for(var i=0;i<list.length;i++){
                	   let li=document.createElement('li');
                	   li.innerText=list[i].title;
                	   li.setAttribute("data-cd",list[i].DOCID);    
                	  
                	   movieList.append(li);
                	  
                   };           
                });
//영화관지역
movieList.addEventListener('click',selectedList);
function selectedList(){
	console.log(event.target.getAttribute('data-cd'));
	mvNo.value=event.target.getAttribute('data-cd');
	if(event.target.classList.contains('selectedList')){
		event.target.classList.remove('selectedList');
    }else{
    	event.target.setAttribute('class','selectedList');  
    };
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
	 console.log($(event.target).data("loc"));
	 $('#reservLoc').val($(event.target).data("loc"));
	if(event.target.classList.contains('selectedLoc')){
		event.target.classList.remove('selectedLoc');
    }else{
    	event.target.setAttribute('class','selectedLoc');  
    };
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
	if(event.target.classList.contains('selectedHall')){
		event.target.classList.remove('selectedHall');
    }else{
    	event.target.setAttribute('class','selectedHall');  
    };
    $.ajax({
    	url:"movieSchdtList.do",
    	type:"post",
    	data:{docId:$(event.target).data("docid")},
    	success:function(data){
    		console.log(data[0].schDt);
    		
    		    $( "#datepicker" ).datepicker({
    		      minDate:0, maxDate: data[0].schDt ,
    		      onSelect: function() { 
    		            var date = $.datepicker.formatDate("yymmdd",$("#datepicker").datepicker("getDate"));                           
    		            date = $("#datepicker").val();
    		            
    		            $('#resultDate').val(date);
    		            $('#schDate').val(date);
    		            showTime.style.display="block";
    		      }
    		    });
    		  
    	}
    });
}
$('#showTime').on('click',function(){
	if(event.target.classList.contains('showTime')){
		event.target.classList.remove('showTime');
    }else{
    	event.target.setAttribute('class','showTime');  
    };
});
//좌석
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
      let seatChr=String.fromCharCode(A);

          td.name=seatChr+seatNo;
          td.innerText=seatChr+seatNo;
          tr.append(td);
    }
          table.append(tr);
  }
      seat.append(table);
      var seatTd = document.getElementsByTagName('td');
      for(i=1;i<seatTd.length;i++){
          seatTd[i].addEventListener('click',selectSeat);
      }
      function selectSeat(){
          if(this.classList.contains('selectedSeat')){
              this.classList.remove('selectedSeat');
          }else{
            this.setAttribute('class','selectedSeat');  
          }
          let p=document.createElement('span');
          p.innerText=this.innerText;
          result.append(p);
      }
</script>  
</body>

</html>