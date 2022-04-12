<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
    	var data = new google.visualization.DataTable();
        data.addColumn('string','dayDate');
        data.addColumn('number','sales');
    	let arr = [];
    	 $.ajax({
         	url: "movieSales.do",
         	type: "post",
         	dataType: "json",
         	success: function(item){
         		console.log(item);
         		$.each(item, function(idx, result){
         			console.log(result);
         			arr.push(["dayDate", result.dayDate]);
             		arr.push(["sales", result.sales]);
         		});
         	}
         });
      
      data.addRows(arr);
      
      console.log(data);
      
      var options = {
    	        'title': "영화 일일매출(4월)",
    	        'width': 700,
    	        'height': 400,
    	        'bar': {groupWidth: "100%"},
    	        'legend': { position: "none" },
    	        'backgroundColor' :{
    	        	fill:'yellow'},
    	        'chartArea' : {
                        backgroundColor: {
                          fill: '#FFFAF0',
                          fillOpacity: 0.8
                        },
                    },
                'vAxis' : {
                        textStyle : {
                           color : 'black'
                        }
                      },
                'hAxis' : {
	                	minValue: 0,
	                    max: 100000000,
                         textStyle : {
                            color : 'pink'
                         }
                      }
                };

      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(data, options);
  }
  </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="barchart_values" style="width: 80%; height: 50%;"></div>
  </body>
</html>