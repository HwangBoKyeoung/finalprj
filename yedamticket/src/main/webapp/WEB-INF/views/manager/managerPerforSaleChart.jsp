<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
   <!--Div that will hold the pie chart-->
  <!--  <h1 style="text-align: center;">공연 매출 차트</h1>
   <br><br> -->
   <div id=chart_div style="width:100%; height: 1000px;"></div>
   
   <script type="text/javascript">
      google.charts.load("current", {
         packages : [ "corechart" ]
      });
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
         let arr = [];
         /* let jsonData = $.ajax({
            url : "movieSales.do",
            type : "post",
            dataType : "json",
            async: false
         }).responseText; */
         
         $.ajax({
            url : "perforSales.do",
            type : "post",
            dataType : "json",
            async: false,
            success: function(result){
               console.log(result);
               console.log(result[0].dayDate);
               
               var data = new google.visualization.DataTable();
               
               data.addColumn('string', '일');
               data.addColumn('number', '매출');
               
               for(let i=0; i<result.length; i++){
                  arr.push([result[i].dayDate, result[i].sales]);   
               }
               
               data.addRows(arr);
               console.log(data);
               
               var options = {
            	          title: '공연일일매출',
            	          /* series: {
            	              0: { color: '#a561bd' },
            	              1: { color: '#c784de' },
            	              2: { color: '#f1ca3a' },
            	              3: { color: '#2980b9' },
            	              4: { color: '#e67e22' }
            	            }, */
            	          hAxis: {title: '2022',  titleTextStyle: {color: 'black'} },
            	          vAxis: {minValue: 0},
            	          responsive: false,
            	          scales: {
            					yAxes: [{
            						ticks: {
            							beginAtZero: true
            						}
            					}]
            				},
            	        };

               var chart = new google.visualization.AreaChart(document.getElementById('chart_div'),options);
               chart.draw(data,options);
            }
         });
      }
</script>
</body>
</html>