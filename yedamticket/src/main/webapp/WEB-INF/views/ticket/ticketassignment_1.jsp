<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	width: 100%;
	padding: 4rem 0;
	overflow: hidden;
}

.widthslider {
	max-width: 95%;
	max-height: 60%;
	margin: 50px auto;
	background: #f8f8f8;
}

.widthlist {
	padding: 1rem 0;
	width: 100%;
	display: flex;
}

.widthitem {
	margin: 15px;
	min-width: 20rem;
	min-height: 18rem;
	list-style: none;
	user-select: none;
}

 .body-content {
	margin-top: 0px;
	*/
	/* padding-bottom: 200px; */ /* footer 높이 */
	
	padding-left: 0px;
}



.footer {
	width: 100%;
	height: 200px; 	
	position: fixed; /* footer의 높이 */ 
	bottom: 0;
	left: 0;
		} 

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysdate">
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
	</c:set>
	${sessionId }
	<input type="button" value="공연" onclick="pffold();">
	<input type="button" value="영화" onclick="mvfold();">

	<!-- ticket assginment  style="visibility: hidden"-->
	<div id="pf_container" style="position: absolute">
		<div>
			<c:if test="${empty prInfo }">
				<div>
					<h1>공연 예약 / 거래 현황이 없습니다.</h1>
				</div>
			</c:if>
			
			<h1>공연 예약 / 거래 현황</h1>
			<div id="widthslider" align="center">
				<ul class="widthlist">

					<c:forEach items="${prInfo }" var="pr">
						<c:if test="${pr.frDt > sysdate }">
							<c:if test="${pr.status == 'P'}">
								<c:if test="${pr.cancelCd == 'N'}">
									<li class="widthitem">
										<div class="card" style="width: 20rem;">
											<div class="card-body">
	
												<!--  <p class="card-title" >취소코드 : ${pr.cancelCd }</p> -->
	
												<p class="card-title">공연 명 : ${pr.name }</p>
												<p class="card-text">예약번호 : ${pr.PReservNo}</p>
												<p class="card-text">공연일정 : ${pr.frDt }</p>
												<p class="card-text">좌석번호 : ${pr.seatNo }</p>
												<c:set var="seatCnt" value="${fn:split(pr.seatNo, ',') }"/>
													<c:set var="seatCnt2" value="0"/>
													<c:forEach var="seatCntFor" items="${seatCnt }">
														<c:set var="tt" value="${seatCnt2 = seatCnt2 + 1 }"/>
													</c:forEach>	
												<p class="card-text">좌석구역 : ${pr.loc }</p>
												<p class="card-text">가 격 : ${pr.price * seatCnt2 }</p>													
												
												<input type="button" onclick="selectedFnc()" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal" value="선택"> 
												<input type="button" onclick="selectedFnc4()" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal3" value="환불">
												<i class="fas fa-exclamation-circle" title="좌석수만큼 가격이 부과됩니다." style="cursor:pointer;" aria-hidden="true"></i>
											</div>
										</div>
									</li>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>

					<c:forEach items="${prInfo }" var="pr">
						<c:if test="${pr.frDt > sysdate }">
							<c:if test="${pr.status == 'F'}">
								<li class="widthitem">
									<div class="card" style="width: 20rem;">
										<div class="card-body" style="background-color: #add8e6">
											<p class="card-title">공연 명 : ${pr.name }</p>
											<p class="card-text">예약번호 : ${pr.PReservNo}</p>
											<p class="card-text">공연일정 : ${pr.frDt }</p>
											<p class="card-text">좌석번호 : ${pr.seatNo }</p>
											<c:set var="seatCnt" value="${fn:split(pr.seatNo, ',') }"/>
													<c:set var="seatCnt2" value="0"/>
													<c:forEach var="seatCntFor" items="${seatCnt }">
														<c:set var="tt" value="${seatCnt2 = seatCnt2 + 1 }"/>
													</c:forEach>	
												<p class="card-text">좌석구역 : ${pr.loc }</p>
												<p class="card-text">가 격 : ${pr.price * seatCnt2 }</p>	
											<button type="button" class="btn btn-secondary"
												data-toggle="tooltip" data-placement="bottom"
												title="자유시장에 올라가있는 티켓입니다!">선택</button>
											<input type="button" onclick="selectedFnc2()"
												class="btn btn-primary" data-toggle="modal"
												data-target="#prInfoModal2" value="취소">
										</div>
									</div>
								</li>
							</c:if>
						</c:if>
					</c:forEach>

					<c:forEach items="${prInfo }" var="pr">
						<c:if test="${pr.frDt > sysdate }">
							<c:if test="${pr.status == 'W'}">
								<li class="widthitem">
									<div class="card" style="width: 20rem;">
										<div class="card-body" style="background-color: gray">
											<p class="card-title">공연 명 : ${pr.name }</p>
											<p class="card-text">예약번호 : ${pr.PReservNo}</p>
											<p class="card-text">공연일정 : ${pr.frDt }</p>
											<p class="card-text">좌석번호 : ${pr.seatNo }</p>
											<c:set var="seatCnt" value="${fn:split(pr.seatNo, ',') }"/>
													<c:set var="seatCnt2" value="0"/>
													<c:forEach var="seatCntFor" items="${seatCnt }">
														<c:set var="tt" value="${seatCnt2 = seatCnt2 + 1 }"/>
													</c:forEach>	
												<p class="card-text">좌석구역 : ${pr.loc }</p>
												<p class="card-text">가 격 : ${pr.price * seatCnt2 }</p>	
											<button type="button" class="btn btn-secondary"
												data-toggle="tooltip" data-placement="bottom"
												title="거래를 예정중인 티켓입니다!">선택</button>
											<input type="button" onclick="selectedFnc2()"
												class="btn btn-primary" data-toggle="modal"
												data-target="#prInfoModal2" value="취소">
										</div>
									</div>
								</li>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>

				<!-- Performance_reservation Modal -->
				<div class="modal fade" id="prInfoModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="닫기">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="ticketassignment_2.do" method="POST">
								<div class="modal-body">

									<h5 class="modal-title" id="Mname"></h5>
									<input type="hidden" id="name" name="name">

									<p id="MPReservNo"></p>
									<input type="hidden" id="PReservNo" name="PReservNo">

									<p id="Mdate"></p>
									<input type="hidden" id="date" name="date">

									<p id="Mseat"></p>
									<input type="hidden" id="seatNo" name="seatNo">

									<p id="Mloc"></p>
									<input type="hidden" id="loc" name="loc">

									<p id="Mprice"></p>
									<input type="hidden" id="price" name="price">
								</div>
								<div class="modal-footer" style="display: block">
									<p>맞으시면 확인 버튼을 눌러주세요.</p>
									<br>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									<input type="submit" class="btn btn-primary" value="확인">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Performance_reservation Modal End -->

				<!-- Performance_reservation Modal2 -->
				<div class="modal fade" id="prInfoModal2">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="닫기">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="ticketassignment_cancel.do" method="POST">
								<div class="modal-body">

									<h5 class="modal-title" id="M2name"></h5>
									<input type="hidden" id="name" name="name">

									<p id="M2PReservNo"></p>
									<input type="hidden" id="PReservNo2" name="PReservNo2">

									<p id="M2date"></p>
									<input type="hidden" id="date" name="date">

									<p id="M2seat"></p>
									<input type="hidden" id="seatNo" name="seatNo">

									<p id="M2loc"></p>
									<input type="hidden" id="loc" name="loc">

									<p id="M2price"></p>
									<input type="hidden" id="price" name="price">
								</div>
								<div class="modal-footer" style="display: block">
									<p>예약을 취소하시려면 버튼을 눌러주세요.</p>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<input type="submit" class="btn btn-primary" value="확인">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Performance_reservation Modal2 End -->

				<!-- Performance_reservation Modal3 -->
				<div class="modal fade" id="prInfoModal3">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="닫기">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="cancelPersonalTicket.do" method="POST">
								<div class="modal-body">

									<h5 class="modal-title" id="P3name"></h5>
									<input type="hidden" id="pr3name" name="pr3name">

									<p id="P3PReservNo"></p>
									<input type="hidden" id="pr3PReservNo2" name="pr3PReservNo2">

									<p id="P3date"></p>
									<input type="hidden" id="pr3date" name="pr3date">

									<p id="P3seat"></p>
									<input type="hidden" id="pr3seatNo" name="pr3seatNo">

									<p id="P3loc"></p>
									<input type="hidden" id="pr3loc" name="pr3loc">

									<p id="P3price"></p>
									<input type="hidden" id="pr3price" name="pr3price">
								</div>
								<div class="modal-footer" style="display: block">
									<p>예약을 취소하시려면 버튼을 눌러주세요.</p>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<input type="submit" class="btn btn-primary" value="확인">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Performance_reservation Modal3 End -->

			</div>
		</div>
	</div>

	<!-- movie assignment -->
	<div id="mv_container" style="position: absolute">
		<div align="center">
			<c:if test="${empty mrInfo }">
				<div>
					<h1>영화 예약 현황이 없습니다.</h1>
				</div>
			</c:if>

			<div id="widthslider" align="center">
				<h1>영화 예약 현황</h1>
				<ul class="widthlist">
					<c:forEach items="${mrInfo }" var="mr">
						<c:if test="${mr.schDate > sysdate }">
							<c:if test="${mr.cancelCd == 'N'}">
							<li class="widthitem">
								<div class="card" style="width: 20rem;">
									<div class="card-body">
										<p class="card-title">영화 명 : ${mr.name }</p>
										<p class="ca rd-text">예약번호 : ${mr.mvReservNo}</p>
										<p class="card-text">공연일정 : ${mr.schDate }</p>
										<p class="card-text">좌석번호 : ${mr.seatName }</p>
										<p class="card-text">영화관지역 : ${mr.reservHall }</p>
										<p class="card-text">가 격 : 13000원</p>
										<!-- 쉼표로 바뀌면 넣어주면 됨 -->
										
										<%-- <c:set var="mseatCnt" value="${fn:split(mr.seatName, ',') }"/>
										<c:set var="mseatCnt2" value="0"/>
											<c:forEach var="mseatCntFor" items="${seatName }">
												<c:set var="mtt" value="${seatCnt2 = seatCnt2 + 1 }"/>
											</c:forEach>	
											<p class="card-text">영화관지역 : ${mr.reservHall }</p>
											<p class="card-text">가 격 : ${13000 * seatCnt2 }</p> --%>	
										<input type="button" onclick="selectedFnc3()" class="btn btn" data-toggle="modal" data-target="#mrInfoModal" value="환불">
									</div>
								</div>
							</li>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				<!-- Movie_reservation Modal -->
				<div class="modal fade" id="mrInfoModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="닫기">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="cancelreservmovie.do" method="POST">
								<div class="modal-body">
									<h5 class="modal-title" id="M2name"></h5>
									<input type="hidden" id="MVname" name="MVname">

									<p id="M3PReservNo"></p>
									<input type="hidden" id="MVPReservNo2" name="MVPReservNo2">

									<p id="M3date"></p>
									<input type="hidden" id="MVdate" name="MVdate">

									<p id="M3seat"></p>
									<input type="hidden" id="MVseatNo" name="MVseatNo">

									<p id="M3loc"></p>
									<input type="hidden" id="MVloc" name="MVloc">

									<p id="M3price"></p>
									<input type="hidden" id="MVprice" name="MVprice">
								</div>
								<div class="modal-footer" style="display: block">
									<p>예약을 취소하시려면 버튼을 눌러주세요.</p>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<input type="submit" class="btn btn-primary" value="확인">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Movie_reservation Modal End -->

			</div>
		</div>
	</div>

	<script>
	$("#mv_container").css("visibility", "hidden")
	
	function pffold(){
		$("#pf_container").css("visibility","visible")
		$("#mv_container").css("visibility", "hidden")
	
	}	
	
	function mvfold(){
		$("#mv_container").css("visibility","visible")
		$("#pf_container").css("visibility", "hidden")
	}
	
	
	
	function selectedFnc(){
		var name = 		$(event.target).prev().prev().prev().prev().prev().prev().text();
		var PReservNo = $(event.target).prev().prev().prev().prev().prev().text();
		var date = 		$(event.target).prev().prev().prev().prev().text();
		var seat = 		$(event.target).prev().prev().prev().text();
		var loc =		$(event.target).prev().prev().text();
		var price = 	$(event.target).prev().text();
		
		$('#Mname').html(name);
		$('#MPReservNo').html(PReservNo);
		$('#Mdate').html(date);
		$('#Mseat').html(seat);
		$('#Mloc').html(loc);
		$('#Mprice').html(price);
		
		$("#name").val(name.substring(7,))
		$("#PReservNo").val(PReservNo.substring(7,))
		$("#date").val(date.substring(7,))
		$("#seatNo").val(seat.substring(7,))
		$("#loc").val(loc.substring(7,))
		$("#price").val(price.substring(7,))
	}
	
	function selectedFnc2(){
		var name = 		$(event.target).prev().prev().prev().prev().prev().prev().prev().text();
		var PReservNo2= $(event.target).prev().prev().prev().prev().prev().prev().text();
		var date = 		$(event.target).prev().prev().prev().prev().prev().text();
		var seat = 		$(event.target).prev().prev().prev().prev().text();
		var loc =		$(event.target).prev().prev().prev().text();
		var price = 	$(event.target).prev().prev().text();
		
		$('#M2name').html(name);
		$('#M2PReservNo').html(PReservNo2);
		$('#M2date').html(date);
		$('#M2seat').html(seat);
		$('#M2loc').html(loc);
		$('#M2price').html(price);
		
		let prn = parseInt(PReservNo2.substring(7,));
		
		$("#name").val(name.substring(7,))
		$("#PReservNo2").val(prn);
		$("#date").val(date.substring(7,))
		$("#seatNo").val(seat.substring(7,))
		$("#loc").val(loc.substring(7,))
		$("#price").val(price.substring(7,))
	}
	
	function selectedFnc3(){
		var name = 		$(event.target).prev().prev().prev().prev().prev().prev().text();
		var PReservNo2= $(event.target).prev().prev().prev().prev().prev().text();
		var date = 		$(event.target).prev().prev().prev().prev().text();
		var seat = 		$(event.target).prev().prev().prev().text();
		var loc =		$(event.target).prev().prev().text();
		var price = 	$(event.target).prev().text();
		
		$('#M3name').html(name);
		$('#M3PReservNo').html(PReservNo2);
		$('#M3date').html(date);
		$('#M3seat').html(seat);
		$('#M3loc').html(loc);
		$('#M3price').html(price);
		
		let prn = parseInt(PReservNo2.substring(7,));
		
		$("#MVname").val(name.substring(7,))
		$("#MVPReservNo2").val(PReservNo2.substring(7,));
		$("#MVdate").val(date.substring(7,))
		$("#MVseatNo").val(seat.substring(7,))
		$("#MVloc").val(loc.substring(7,))
		$("#MVprice").val(price.substring(7,))
	}
	
	function selectedFnc4(){
		var name = 		$(event.target).prev().prev().prev().prev().prev().prev().prev().text();
		var PReservNo2= $(event.target).prev().prev().prev().prev().prev().prev().text();
		var date = 		$(event.target).prev().prev().prev().prev().prev().text();
		var seat = 		$(event.target).prev().prev().prev().prev().text();
		var loc =		$(event.target).prev().prev().prev().text();
		var price = 	$(event.target).prev().prev().text();
		
		$('#P3name').html(name);
		$('#P3PReservNo').html(PReservNo2);
		$('#P3date').html(date);
		$('#P3seat').html(seat);
		$('#P3loc').html(loc);
		$('#P3price').html(price);
		
		let prn = parseInt(PReservNo2.substring(7,));
		
		$("#pr3name").val(name.substring(7,))
		$("#pr3PReservNo2").val(PReservNo2.substring(7,));
		$("#p3date").val(date.substring(7,))
		$("#p3seatNo").val(seat.substring(7,))
		$("#pr3loc").val(loc.substring(7,))
		$("#pr3price").val(price.substring(6,))
	}
	
	
	// 슬라이더----------------
	// 요소
	const list = document.querySelector(".widthlist")

    // 사이즈
	const listScrollWidth = list.scrollWidth
	const listClientWidth = list.clientWidth
	
	// 필요한 변수
	let startX = 0
	let nowX = 0
	let endX = 0
	let listX = 0

	// 스크롤 시작
	const onScrollStart = (e) => {
	  startX = getClientX(e)
	  window.addEventListener("mousemove", onScrollMove)
	  window.addEventListener("touchmove", onScrollMove)
	  window.addEventListener("mouseup", onScrollEnd)
	  window.addEventListener("touchend", onScrollEnd)
	  
	}

	// 스크롤이 움직이면서 현재 위치 기록
	const onScrollMove = (e) => {
	  nowX = getClientX(e)
	  setTranslateX(listX + nowX - startX)
	}

	// 스크롤이 끝난 상태 기록
	const onScrollEnd = (e) => {
	  endX = getClientX(e)
	  listX = getTranslateX()

	  // 원위치로 돌아오는 기능 비활성화 하여 다른 기능에 사용
	  /* if (listX > 0) {
	      setTranslateX(0)
	      list.style.transition = `all 0.3s ease`;
	      listX = 0
	    } else if (listX < listClientWidth - listScrollWidth) {
	      setTranslateX(listClientWidth - listScrollWidth)
	      list.style.transition = `all 0.3s ease`;
	      listX = listClientWidth - listScrollWidth
	    } */

	  // 이벤트 리스너 초기화
	  window.removeEventListener("mousedown", onScrollStart)
	  window.removeEventListener("touchstart", onScrollStart)
	  window.removeEventListener("mousemove", onScrollMove)
	  window.removeEventListener("touchmove", onScrollMove)
	  window.removeEventListener("mouseup", onScrollEnd)
	  window.removeEventListener("touchend", onScrollEnd)
	  window.removeEventListener("click", onClick)

	  // 드래그 이후 대기시간(밀리초)
	  setTimeout(() => {
	    bindEvents()
	    list.style.transition = ""
	  }, 100)
	}

	// if문의 조건이 만족되지 않으면 onClick함수 실행 중단
	const onClick = (e) => {
	  if (startX - endX !== 0) {
	    e.preventDefault()
	  }
	}

	// 
	const getClientX = (e) => {
	  const isTouches = e.touches ? true : false
	  return isTouches ? e.touches[0].clientX : e.clientX
	}

	// x 좌표값을 int형으로 변환
	const getTranslateX = () => {
	  return parseInt(getComputedStyle(list).transform.split(/[^\-0-9]+/g)[5])
	}

	// x 좌표값을 touchend 위치로 설정
	const setTranslateX = (x) => {
	  list.style.transform = `translateX(\${x}px)`
	}

	// 이벤트를 부여
	const bindEvents = () => {
	  list.addEventListener("mousedown", onScrollStart)
	  list.addEventListener("touchstart", onScrollStart)
	  list.addEventListener("click", onClick)
	}

	// 원위치로 복귀시키는 함수
	const resetPosition = () => {
	  if (listX > 0) {
	    setTranslateX(0)
	    list.style.transition = `all 0.3s ease`
	    listX = 0
	  } else if (listX < listClientWidth - listScrollWidth) {
	    setTranslateX(listClientWidth - listScrollWidth)
	    list.style.transition = `all 0.3s ease`
	    listX = listClientWidth - listScrollWidth
	  }
	}
	
	bindEvents()
	</script>

</body>
</html>