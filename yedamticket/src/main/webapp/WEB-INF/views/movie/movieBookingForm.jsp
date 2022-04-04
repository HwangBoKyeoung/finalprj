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

  
    td {
      padding:5px;
      font-size:12px;
      maring:5px;
    }
    .selectedSeat,.selectedList,.selectedLoc,.selectedHall,.showTime{
        background-color: blueviolet;
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
    <!--scrollbar-->
    .col-sm::-webkit-scrollbar {
    width: 10px;
  	}
  	.col-sm::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  	}
  	.col-sm::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
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
  


</style>
<body>
<div class="container">
        <div class="row">
        	<div class="col-lg-3" >  
        	 <h2> 영화선택</h2>
        		<div id="movieList" >
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
                <div id="seat">
                </div> 
                <div id="seatResult">
                <h4>선택한 좌석</h4>
                </div>
          </div>
          
        </div>
 		
      <form action="movieReservation.do" method="post">
        <input type="text" id="docId" name="docId"><!-- 무비넘버 -->
        <input type="text" id="reservLoc" name="reservLoc"><!-- 지역 -->
        <input type="text" id="reservHall" name="reservHall"><!-- 영화관 -->
        <input type="text" id="UId" name="UId" value="test"><!-- 사용자 -->
        <input type="text" id="schDate" name="schDate"><!-- 날짜-->
        <input type="text" id="schTime" name="schTime"><!-- 시간 -->
        <input type="text" id="seatName" name="seatName"><!-- 좌석이름 -->
        <button type="submit">예매하기</button>
       </form>
      </div>
    
<script>

//현재 날짜 yyyymmdd
let date=new Date();
let year=date.getFullYear();
let day=date.getDate();
var month = date.getMonth() + 1;
if(day < 10 ) {
    day='0'+ day
} else{
    day='' + day
}; 
if(month < 10 ) {
    month='0'+ month
} else{
    month='' + month
}; 
let now=String(year)+String(month)+String(day);
//현재 날짜에서 31일전
let prevDate=new Date();
prevDate.setTime(prevDate.getTime()-(60*60*24*1000)*31);
let pYear=prevDate.getFullYear();
let pMonth=prevDate.getMonth()+1;
let pDate=prevDate.getDate();
if(pDate < 10 ) {
	pDate='0'+ pDate
} else{
	pDate='' + pDate
}; 
if(pMonth < 10 ) {
	pMonth='0'+ pMonth
} else{
	pMonth='' + pMonth
}; 
let prevDay=String(pYear)+String(pMonth)+String(pDate);
var url = 'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=U8ECM752YKB763PI62AV&releaseDts='+prevDay+'&releaseDte='+now+'&listCount=500';
fetch(url)
                .then(response => response.json())
                .then(response => {
                   console.log(response);
                   let list=response.Data[0].Result;
                   for(var i=0;i<list.length;i++){
                	  let div=document.createElement('div');
                	    let span=document.createElement('span');
                        div.innerText=list[i].title; 
                	  switch(list[i].rating){
                	  	case "전체관람가":
                	  		 span.innerText="ALL";
                            span.setAttribute('class','all');
                	  		 break;
                	  	case "12세관람가":
               	  		     span.innerText="12";
                            span.setAttribute('class','a');
               	  			 break;
                	  	case "15세관람가":
                  	  		 span.innerText="15";
                            span.setAttribute('class','b');
                  	  		 break;
                	  	case "18세관람가(청소년관람불가)":
                  	  		 span.innerText="청불";
                            span.setAttribute('class','c');
                  	  		 break;
                	  	case "":
                	  		span.setAttribute('class','d');
                  	  		 span.innerText="미정";
                  	  		 break;
                	  };	 
                       div.append(span);
                       //poster data에 넣기
                       let posterArry=(list[i].posters).split('|');
                       div.setAttribute("data-poster",posterArry[0]);   
                	   div.setAttribute("data-cd",list[i].DOCID);    
                	   movieList.append(div);  
                   };           
                });
//영화관지역
movieList.addEventListener('click',selectedList);
function selectedList(){
	moviePoster.setAttribute('src',event.target.getAttribute('data-poster'));
	docId.value=event.target.getAttribute('data-cd');
	//버튼누르면 색바뀜
	let childNodes=event.target.parentNode.childNodes;
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
	 for(var i=1;i<childNodes.length;i++){
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
    		      seat.append(table);
    		      var seatTd = document.getElementsByTagName('td');
    		      for(i=0;i<seatTd.length;i++){
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
    		          seatResult.append(p);
    		          console.log($(event.target).text());
    		          $('#seatName').val($(event.target).text());
    		      }      		      
    		   ///
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