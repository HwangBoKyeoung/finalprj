<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/calender/main.css' rel='stylesheet' />

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
</style>
 <script src='resources/calender/main.js'></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var request = $.ajax({
			url : "concertCalender.do",
			method : "GET",
			dataType : "json"
		});
		
		request.done(function(data) {
			console.log(data[0]);

			var calendarEl = document.getElementById('calendar');
			
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth'
				},
				selectable: true,
			    selectMirror: true,
			    select: function(arg) {
			    	let str = arg.startStr;
			    	let start = str.substr(0,10);
			    	console.log(start);

			        $.ajax({
			        	url: "ajaxModalForm.do",
			        	type: "post",
			        	data: {"frDt":start},
			        	dataType: "json",
			        	success: function(result){
			        		console.log(result);
			        		$("#exampleModal").modal({
			                    backdrop: 'static',
			                    keyboard: false,
			                    show : true
			                });
			        		$(".modal-body", function (arr) {
			        		var arr = result;
			        		var rs = "";
			        		rs += "<table class='table table-hover' id='contents'>";
			        		rs += "<tr>";
		        			rs += "<th>" + "공연 시작일" + "</th>";
		        			rs += "<th>" + "공연 시간" + "</th>";
		        			rs += "<th>" + "공연 이름" + "</th>";
		        			rs += "<th>" + "공연 장소" + "</th>";
		        			rs += "</tr>";
			        		for (var v of arr) {
			        			console.log(v.start.substring(0,10));
			        			console.log(v.time);
			        			console.log(v.title);
			        			rs += "<tr>";
			        			rs += "<td>" + v.start.substring(0,10) + "</td>";
			        			rs += "<td>" + v.time + "</td>";
			        			rs += "<td>" + v.title + "</td>";
			        			rs += "<td>" + v.addr + "</td>";
			        			rs += "</tr>";
			        		}
			        		rs += "</table>";
			        		$(".modal-body").append(rs);
							});
			        		//$(".modal-body").text(result[0].time+", "+result[0].title);
			        	}
			        });

			      },
				events : data
			});
			console.log("ggg");
			console.log(data);
			calendar.render();
		});
		
		$(".cancelBtn").on("click", function(idx, item){
			if($(".modal-body").text()!='' || $(".modal-body").text()!=null){
				$(".modal-body").text('');
			}
		});
		$(".close").on("click", function(idx, item){
			if($(".modal-body").text()!='' || $(".modal-body").text()!=null){
				$(".modal-body").text('');
			}
		});
		
		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		});
	});
</script>
</head>
<body>
<input type="hidden" value="${schs }">

<div id='calendar'></div>
	<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">공연 일정 상세조회</h5>
        <button type="button" class="close cancelBtn" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary cancelBtn" data-dismiss="modal" style="margin-left: 45%">닫기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>