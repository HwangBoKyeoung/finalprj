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
   <div id="barchart_values" style="width: 100%; height: 100%; margin-bottom: 30px;"></div>
   
   <script type="text/javascript">
      google.charts.load("current", {
         packages : [ "bar" ]
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
            url : "perforPop.do",
            type : "post",
            dataType : "json",
            async: false,
            success: function(result){
               console.log(result);
               console.log(result[0].name);
               
               var data = new google.visualization.DataTable();
               
               data.addColumn('string', '공연제목');
               data.addColumn('number', '관객수');
               
               for(let i=0; i<result.length; i++){
                  arr.push([result[i].name, result[i].pop]);   
               }
               
               data.addRows(arr);
               console.log(data);
               
               var options = {
            	          title: '공연인기순위',
            	          width: 900,
            	          height : 900,
            	          legend: { position: 'none' },
            	          chart: { title: 'TOP10 인기순위'},
            	          bars: 'horizontal', // Required for Material Bar Charts.
            	          axes: {
            	            x: {
            	              0: { side: 'top'} // Top x-axis.
            	            }
            	          },
            	          series: {
            	              0: { color: '#a561bd' },
            	              1: { color: '#c784de' },
            	              2: { color: '#f1ca3a' },
            	              3: { color: '#2980b9' },
            	              4: { color: '#e67e22' }
            	            },
            	          bar: { groupWidth: "90%" }
            	        };
               
               var chart = new google.charts.Bar(barchart_values);
               chart.draw(data,options);
            }
         });
      }
</script>
</body>
</html>