<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>consertSchedule</title>
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
			url : "consertCalender.do",
			method : "GET",
			dataType : "json"
		});
		
		request.done(function(data) {
			console.log(data);
			/* $("#calendar").on("click", function(datas){
				console.log(datas.target.innerText);
			}); */
			
			var calendarEl = document.getElementById('calendar');
			
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				selectable: true,
			    selectMirror: true,
			    select: function(arg) {
			    	//모달 띄울펑션
			    	// 팝업 호출 url
			        var url = "modalForm.do";
			        
			        // 팝업 호출
			        $("#exampleModal > .modal-dialog").load(url, function() { 
			            $("#exampleModal").modal("show"); 
			        });

			      },
				events : data
			});
			console.log(data[0].time);
			calendar.render();
		});
		request.fail(function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		});
	});
</script>
</head>
<body>

	<div id='calendar'></div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>