window.onload = function() {
    drawMap('#container');
};

//지도 그리기
function drawMap(target) {
    var width = 550; //지도의 넓이
    var height = 550; //지도의 높이
    var initialScale = 5500; //확대시킬 값
    var initialX = -11900; //초기 위치값 X
    var initialY = 4050; //초기 위치값 Y
    var labels;

    var projection = d3.geo
        .mercator()
        .scale(initialScale)
        .translate([initialX, initialY]);
    var path = d3.geo.path().projection(projection);
    var zoom = d3.behavior
        .zoom()
        .translate(projection.translate())
        .scale(projection.scale())
        .scaleExtent([height, 800 * height])
        .on('zoom', zoom);

    var svg = d3
        .select(target)
        .append('svg')
        .attr('width', width + 'px')
        .attr('height', height + 'px')
        .attr('id', 'map')
        .attr('class', 'map')
        .on("click", function(){
            var eid=event.target.id;
            let value=eid.substr(eid.indexOf('-')+1,eid.length);
		switch(value){
			case "Seoul":
			var region = "서울";
            break;
			case "Gyeongsangbuk-do":
			var region = "경상북도";
            break;
            case "Gyeonggi-do":
            var region = "경기도";
            break;
            case "Incheon":
            var region = "인천";
            break;
            case "Gangwon-do":
            var region = "강원도";
            break;
            case "Gyeonggi-do":
            var region = "경기도";
            break;
            case "Chungcheongnam-do":
            var region = "충청남도";
            break;
            case "Chungcheongbuk-do":
            var region = "충청북도";
            break;
            case "Sejong":
            var region = "세종";
            break;
            case "Daejeon":
            var region = "대전";
            break;
            case "Jeollabuk-do":
            var region = "전라북도";
            break;
            case "Jeollanam-do":
            var region = "전라남도";
            break;
            case "Gwangju":
            var region = "광주";
            break;
            case "Daegu":
            var region = "대구";
            break;
            case "Gwangju":
            var region = "광주";
            break;
            case "Gyeongsangnam-do":
            var region = "경상남도";
            break;
            case "Ulsan":
            var region = "울산";
            break;
            case "Busan":
            var region = "부산";
            break;
			case "Jeju-do":
			var region = "제주도";
			break;
			
			
		}
		console.log(region);
		$('#region').val(region);
        $.ajax({
            url:"locPlist.do",
            type:"post",
            data:{"addr":region},
            success:function(result){
                console.log(result);
				$('#locList').empty();
				let tbody=document.createElement('tbody');
				for(var i =0; i<result.length;i++){
					let tr=document.createElement('tr');
					
					let loc=document.createElement('td');
					loc.classList.add('col-2');					
					loc.innerText=result[i].loc;
					
					let name=document.createElement('td');
					name.classList.add('col-3');
					name.innerText=result[i].name;
					
					let btnTd=document.createElement('td');
					
					btnTd.classList.add('col-1');
					let reservBtn=document.createElement('button');
					reservBtn.type="button";
					reservBtn.innerText="예매하기";
					reservBtn.classList.add("btn","btn-primary");
					reservBtn.setAttribute("onclick","pBookingForm("+result[i].pno+")");
					///////////////////////////
					
					btnTd.append(reservBtn);					
					tr.append(name,loc,btnTd);
					tbody.append(tr);

				}
				$('#locList').append(tbody);
				
				
            }


        });

///////////////////////////
		 $('#region').val(region);
        var i = 0;
        var speed = 200;
        document.getElementById("demo").innerHTML="";
        typeWriter();
        function typeWriter() {
          if (i < region.length) {
            document.getElementById("demo").innerHTML += region.charAt(i);
            i++;
            setTimeout(typeWriter, speed);
          }

        }
      });

    var states = svg
        .append('g')
        .attr('id', 'states')
        .call(zoom);

    states
        .append('rect')
        .attr('class', 'background')
        .attr('width', width + 'px')
        .attr('height', height + 'px');

    //geoJson데이터를 파싱하여 지도그리기
    d3.json('resources/json/korea.json', function(json) {
        states
            .selectAll('path') //지역 설정
            .data(json.features)
            .enter()
            .append('path')
            .attr('d', path)
            .attr('id', function(d) {
                return 'path-' + d.properties.name_eng;
            });

        labels = states
            .selectAll('text')
            .data(json.features) //라벨표시
            .enter()
            .append('text')
            .attr('transform', translateTolabel)
            .attr('id', function(d) {
                return 'label-' + d.properties.name_eng;
            })
            .attr('text-anchor', 'middle')
            .attr('dy', '.35em')
            .text(function(d) {
                return d.properties.name;
            });
    });

    //텍스트 위치 조절 - 하드코딩으로 위치 조절을 했습니다.
    function translateTolabel(d) {
        var arr = path.centroid(d);
        if (d.properties.code == 31) {
            //서울 경기도 이름 겹쳐서 경기도 내리기
            arr[1] +=
                d3.event && d3.event.scale
                    ? d3.event.scale / height + 20
                    : initialScale / height + 20;
        } else if (d.properties.code == 34) {
            //충남은 조금 더 내리기
            arr[1] +=
                d3.event && d3.event.scale
                    ? d3.event.scale / height + 10
                    : initialScale / height + 10;
        }
        return 'translate(' + arr + ')';
    }

    function zoom() {
        projection.translate(d3.event.translate).scale(d3.event.scale);
        states.selectAll('path').attr('d', path);
        labels.attr('transform', translateTolabel);
    }
}
$(document).ready(function(){
  var zindex = 10;
  
  $("div.card").click(function(e){
    e.preventDefault();

    var isShowing = false;

    if ($(this).hasClass("show")) {
      isShowing = true
    }

    if ($("div.cards").hasClass("showing")) {
      // a card is already in view
      $("div.card.show")
        .removeClass("show");

      if (isShowing) {
        // this card was showing - reset the grid
        $("div.cards")
          .removeClass("showing");
      } else {
        // this card isn't showing - get in with it
        $(this)
          .css({zIndex: zindex})
          .addClass("show");

      }

      zindex++;

    } else {
      // no cards in view
      $("div.cards")
        .addClass("showing");
      $(this)
        .css({zIndex:zindex})
        .addClass("show");

      zindex++;
    }
    
  });
});