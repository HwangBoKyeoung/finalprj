<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="./resources/users/js/core/jquery.min.js"
	type="text/javascript"></script>
<style>
#plus, #minus, #cnt {
	border: 1px solid black;
	width: 50px;
	height: 50px;
	font-size: 30px;
	text-align: center;
	float: left;
	background-color: violet;
}

.seatGray {
	background: gray;
}

.seatViolet {
	background: violet;
}

#selectedSeat td {
	border: 1px solid #444444;
	width: 55px;
	height: 65px;
}

.selectedSeat, .selectedList, .selectedLoc, .selectedHall, .showTime {
	background-color: purple;
}

.nonSelectedSeat, .nonSelectedList, .nonSelectedLoc, .nonSelectedHall,
	.nonShowTime {
	background-color: white;
}

#showTime {
	display: none;
}

.col-lg-3 {
	border: solid 1px #000000;
	text-align: center;
	width: 300px;
	height: 500px;
	overflow: auto;
}

.col {
	text-align: center;
	width: 200px;
	height: 250px;
	float: bottom;
}

#movieList {
	text-align: left;
	font-size: 14px;
	padding: 5px;
}

.all {
	background-color: greenyellow;
	border-radius: 50%;
}

.a {
	background-color: skyblue;
	border-radius: 50%;
}

.b {
	background-color: yellow;
	border-radius: 50%;
}

.c {
	background-color: rgb(255, 0, 34);
	border-radius: 50%;
}

.d {
	background-color: #7c807d;
	border-radius: 50%;
}

.wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: 60px;
}

.modal {
	position: absolute;
	width: 160%;
	height: 160%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}

.modal_content {
	width: 400px;
	height: 200px;
	background: #fff;
	border-radius: 10px;
	position: relative;
	top: 50%;
	left: 33%;
	margin-top: -100px;
	margin-left: -200px;
	text-align: center;
	box-sizing: border-box;
	padding: 74px 0;
	line-height: 23px;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h2>영화선택</h2>
				<div id="movieList">
					<c:forEach var="m" items="${movies }">
						<div data-cd="${m.docId }" data-poster="${m.fileCd }">${m.name }
							<c:choose>
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
				<img id="moviePoster">


			</div>
			<div class="col-lg-3">
				<h2>자리 배치도</h2>
				<div id="seat" align="center"></div>

				<div class="row align-items-end">
					<div class="col">
						<h5>관람객수</h5>
						<div>
							<div id="minus">-</div>
							<div id="cnt">0</div>
							<div id="plus">+</div>
						</div>
					</div>

					<div class="col" id="seatResult">
						<h5>선택한 좌석</h5>
						<table id="selectedSeat">
							<tr>
								<td>+</td>
								<td>+</td>
							</tr>
							<tr>
								<td>+</td>
								<td>+</td>
							</tr>
							<tr>
								<td>+</td>
								<td>+</td>
							</tr>
						</table>
					</div>
				</div>

			</div>
		</div>
		<div>
			<form action="movieReservation.do" method="post">
				<input type="text" id="docId" name="docId">
				<!-- 무비넘버 -->
				<input type="text" id="reservLoc" name="reservLoc">
				<!-- 지역 -->
				<input type="text" id="reservHall" name="reservHall">
				<!-- 영화관 -->
				<input type="text" id="UId" name="UId" value="enc1115">
				<!-- 사용자 -->
				<input type="text" id="schDate" name="schDate">
				<!-- 날짜-->
				<input type="text" id="schTime" name="schTime">
				<!-- 시간 -->
				<input type="text" id="seatName" name="seatName">
				<!-- 좌석이름 -->
				<button type="submit" class="btn btn-warning">결제하기</button>
			</form>
		</div>

	</div>

	<div class="modal">

		<div class="modal_content"></div>
	</div>

	<script>
		//인원추가하는 버튼
		$('#plus').on("click", function() {
			var cnt = $('#cnt').text();
			if ($('#cnt').text() == 6) {
				$('#cnt').text(6);
				cnt = 6;
				alert("최대 예약인원은 6명입니다.");
			} else {
				//예약인원을 늘릴때마다 회색으로 칠하기
				let selectedSeat = document.getElementById('selectedSeat');
				let tdList = selectedSeat.getElementsByTagName('td');
				tdList[cnt].setAttribute('class', 'seatGray');
				cnt++;
				$('#cnt').text(cnt);
			}
		});
		//인원다운하는 버튼
		$('#minus').on("click", function() {
			var cnt = $('#cnt').text();

			if ($('#cnt').text() <= 0) {
				$('#cnt').text(0);
				cnt = 0;
			} else {
				--cnt;
				//예약인원을 줄일 때 마다 seatGray class없애기
				let selectedSeat = document.getElementById('selectedSeat');
				let tdList = selectedSeat.getElementsByTagName('td');
				tdList[cnt].innerText = '+';
				tdList[cnt].classList.remove('seatGray');
				tdList[cnt].classList.remove('seatViolet');
				$('#cnt').text(cnt);
			}
		});

		//modal
		$(function() {

			$("button").click(function() {
				$(".modal").fadeIn();
			});

			$(".modal_content").click(function() {
				$(".modal").fadeOut();
			});

		});

		//영화관지역
		movieList.addEventListener('click', selectedList);
		function selectedList() {

			console.log(event.target.getAttribute('data-poster'));
			let posterArry = event.target.getAttribute('data-poster')
					.split('|');
			moviePoster.setAttribute('src', posterArry[0]);
			docId.value = event.target.getAttribute('data-cd');
			//버튼누르면 색바뀜
			let childNodes = event.target.parentNode.children;
			for (var i = 1; i < childNodes.length; i++) {
				childNodes[i].setAttribute('class', 'nonSelectedList');
			}
			event.target.setAttribute('class', 'selectedList');

			$('#hallList').empty();
			$.ajax({
				url : "movieHallList.do",
				type : "post",
				data : {
					docId : $(event.target).data("cd")
				},
				success : function(data) {
					console.log(data);
					for (var i = 0; i < data.length; i++) {
						let li = document.createElement('li');
						li.setAttribute("data-loc", data[i].loc);
						li.innerText = data[i].loc + '(' + data[i].mvNo + ')';
						hallList.append(li);
					}
				}
			});
		}
		hallList.addEventListener('click', selectedLoc);
		function selectedLoc() {

			$('#reservLoc').val($(event.target).data("loc"));
			//버튼누르면 색바뀜
			let childNodes = event.target.parentNode.childNodes;
			for (var i = 0; i < childNodes.length; i++) {
				childNodes[i].setAttribute('class', 'nonSelectedList');
			}
			event.target.setAttribute('class', 'selectedList');
			$('#locList').empty();
			$.ajax({
				url : "movieLocList.do",
				type : "post",
				data : {
					loc : $(event.target).data("loc")
				},
				success : function(data) {
					console.log(data);
					for (var i = 0; i < data.length; i++) {
						let li = document.createElement('li');
						li.setAttribute("data-docid", data[i].docId);
						li.setAttribute("data-hallNo", data[i].mvHallNo);
						li.setAttribute("data-name", data[i].name);
						li.innerText = data[i].name + ' 영화관';
						locList.append(li);
					}

				}
			});
		}
		locList.addEventListener('click', selectedHall);
		function selectedHall() {
			console.log(event.target);
			console.log($(event.target).data("hallno"));
			console.log($(event.target).data("docid"));
			$('#reservHall').val($(event.target).data("name"));
			//버튼누르면 색바뀜
			let childNodes = event.target.parentNode.childNodes;
			for (var i = 0; i < childNodes.length; i++) {
				childNodes[i].setAttribute('class', 'nonSelectedList');
			}
			event.target.setAttribute('class', 'selectedList');
			$.ajax({
				url : "movieSchdtList.do",
				type : "post",
				data : {
					docId : $(event.target).data("docid")
				},
				success : function(data) {
					$("#datepicker").datepicker({
						minDate : 0,
						maxDate : data[0].schDt,
						onSelect : function() {
							date = $("#datepicker").val();
							var sDate = date.split('/');
							console.log('date' + sDate[0]);
							let mm = sDate[0];
							let yy = sDate[2];
							let dd = sDate[1];
							let sumDate = yy + '-' + mm + '-' + dd;
							$('#resultDate').val(sumDate);
							$('#schDate').val(sumDate);
							showTime.style.display = "block";
						}
					});

				}
			});
		}
		$('#showTime')
				.on(
						'click',
						function() {
							//버튼누르면 색바뀜
							let childNodes = event.target.parentNode.children;
							for (var i = 0; i < childNodes.length; i++) {
								childNodes[i].setAttribute('class',
										'nonSelectedList');
							}
							event.target.setAttribute('class', 'selectedList');
							$('#schTime').val($(event.target).text());
							//영화(docId),지역,영화관이름,날짜,시간을 ajax로 넘겨서 예약된좌석이름을 가져옴
							console.log($('#docId').val());
							console.log($('#reservLoc').val());
							console.log($('#reservHall').val());
							console.log($('#schDate').val());
							console.log($('#schTime').val());
							$
									.ajax({
										url : "seatSearch.do",
										type : "post",
										data : {
											"docId" : $('#docId').val(),
											"reservLoc" : $('#reservLoc').val(),
											"reservHall" : $('#reservHall')
													.val(),
											"schDate" : $('#schDate').val(),
											"schTime" : $('#schTime').val()
										},
										success : function(result) {
											//좌석
											$('#seat').empty();
											var i, j;
											const memNum = 42; // 전체 입장객 
											const colNum = 7; // 한 줄에 앉을 사람
											if (memNum % colNum == 0)
												rowNum = parseInt(memNum
														/ colNum);
											else
												rowNum = parseInt(memNum
														/ colNum) + 1;

											let table = document
													.createElement('table');
											for (i = 0; i < rowNum; i++) {
												var A = 65 + i;
												var tr = document
														.createElement('tr');
												for (j = 1; j <= colNum; j++) {
													seatNo = j; // 좌석 번호
													if (seatNo > memNum)
														break;
													var td = document
															.createElement('td');
													var btn = document
															.createElement('button');

													let seatChr = String
															.fromCharCode(A);
													td.append(btn);
													td.name = seatChr + seatNo;
													td.setAttribute(
															'data-seatName',
															seatChr + '-'
																	+ seatNo);
													td.innerText = seatChr
															+ '-' + seatNo;

													tr.append(td);
												}
												table.append(tr);
											}
											$('#seat').append(table);
											var cnt = 0;
											var seatTd = document
													.getElementsByTagName('td');
											console.log('seatTd' + seatTd);
											for (i = 0; i < seatTd.length; i++) {
												seatTd[i].addEventListener(
														'click', selectSeat);
											}
											;

											function selectSeat() {
												//선택된 좌석을 좌석표 밑에 표시하기
												let selectedSeat = document
														.getElementById('selectedSeat');
												let tdList = selectedSeat
														.getElementsByTagName('td');
												console
														.log("seatGray"
																+ $('#selectedSeat .seatGray').length);
												//seatGray class의 수 만큼만 좌석을 선택가능 
												if ($('#selectedSeat .seatGray').length > cnt) {
													tdList[cnt].classList
															.add('seatViolet');
													tdList[cnt].innerText = $(
															event.target)
															.text();
													this.setAttribute('class',
															'selectedSeat');
													seatName.value += $(
															event.target)
															.text();
													++cnt;
													console
															.log("좌석을 선택하고 cnt ==="
																	+ cnt);
												} else if ($('#selectedSeat .seatGray').length == 0) {//seatGray class의 수가 0이면
													alert("인원선택을 먼저해주세요!!!");
												} else if ($('#selectedSeat .seatGray').length < cnt) {

													cnt = 0;
												} else {
													alert("좌석선택이 완료되엇습니다.");
												}
												;

											}
											let seatNameArry = [];
											console.log(result);
											//예약된 좌석문자열을(ex.F-5F-6F-7) 하나의단일 좌석으로 쪼갠다.	    	
											if (result.length == 0) {
												console.log("result is null");
											} else {
												console.log("result > 0");
												for (var i = 0; i < result.length; i++) {
													var splitSeatName = result[i].seatName;

													for (var j = 0; j < splitSeatName.length; j += 3) {
														seatNameArry
																.push(splitSeatName
																		.substr(
																				j,
																				3));
													}
												}
												console.log(seatNameArry);
												//예약된좌석 이벤트 없애기
												for (var i = 0; i < seatNameArry.length; i++) {
													console
															.log(seatNameArry[i]);
													var a = "#seat td:contains("
															+ seatNameArry[i]
															+ ")";

													$(a)[0]
															.removeEventListener(
																	'click',
																	selectSeat);
													$(a).css("backgroundColor",
															"black");
												}

											}

										}

									});

						});
	</script>
</body>

</html>