<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    .selectedSeat,.selectedList{
        background-color: blueviolet;
    }
    ul > li{
    list-style:none;
    border:1px solid #ccc;
    }
</style>
<body>
${movieHall.name }
<div class="container">
        <div class="row">
        	<div class="col-sm">
        		<h2> 영화선택</h2>
        		 <ul id="movieList">
                  
                </ul>
        	</div>
          <div class="col-sm">
                <h2>지역</h2>
               
                <ul id="locList">
                   
                </ul>
               
          </div>
           <div class="col-sm">
                <h2>영화관</h2>
                <ul id="hallList">
                
                </ul>
          </div>
          <div class="col-sm">
                <h2>날짜/시간</h2>
                <div id='calendar'></div>
          </div>
          <div class="col-sm">
           
           <h2>자리 배치도</h2>
                <div id="seat" ></div> 
                <div id="result">
                <h4>선택한 좌석</h4>
                </div>
          </div>
        </div>
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
                   }
                  
                   
                });
//영화관지역
movieList.addEventListener('click',selectedList);
function selectedList(){
	if(event.target.classList.contains('selectedList')){
		event.target.classList.remove('selectedList');
    }else{
    	event.target.setAttribute('class','selectedList');  
    };
    $('#locList').empty();
	$.ajax({
        url : "movieHallList.do",
        type : "post",
        data : {docId : $(event.target).data("cd")},
        success : function (data) {
            console.log(data);
            for(var i=0;i<data.length;i++){
            	let li=document.createElement('li');
            	li.innerText=data[i].loc+'('+data[i].mvNo+')';
            	
            	hallList.append(li);
            }
        }
    });
}
hallList.addEventListener('click',selectedLoc);
function selectedLoc(){
	console.log(event.target);
}
/*//캘린더
document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    initialDate: '2022-03-30',
    navLinks: true, // can click day/week names to navigate views
    nowIndicator: true,

    weekNumbers: true,
    weekNumberCalculation: 'ISO',

    editable: true,
    selectable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: [
     
    ]
  });

  calendar.render();
});*/
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