<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
${sessionId }
<input type="button" value="공연" onclick="pffold();">
<input type="button" value="영화" onclick="mvfold();" >
	
	<!-- ticket assginment  style="visibility: hidden"-->
	<div id="pf_container">
	
	<div align="center">
		<c:if test="${empty prInfo }">
			<div>
				<h1>공연 예약 / 거래 현황이 없습니다.</h1>
			</div>
		</c:if>
 		
 		<div id="widthslider" align="center">
 		<h1>공연 예약 / 거래 현황</h1>
			<ul class="widthlist">
				<c:forEach items="${prInfo }" var="pr">
				<c:if test="${pr.frDt > sysdate }">
					<c:if test="${pr.status == 'P'}">
					<li class="widthitem">
						<div class="card" style="width: 20rem;">
						  <div class="card-body">
						    <p class="card-title" >공연 명 : ${pr.name }</p>
						  	<p class="card-text" >예약번호 : ${pr.PReservNo}</p>
						    <p class="card-text">공연일정 : ${pr.frDt }</p>
						    <p class="card-text">좌석번호 : ${pr.seatNo }</p>
						    <p class="card-text">좌석구역 : ${pr.loc }</p>
						    <p class="card-text">가  격 : ${pr.price }</p>
						    <input type="button" onclick="selectedFnc()" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal" value="선택">
						  </div>
						</div>
					</li>
					</c:if>
				</c:if>
					</c:forEach>
					
				<c:forEach items="${prInfo }" var="pr">
				<c:if test="${pr.frDt > sysdate }">
					<c:if test="${pr.status == 'F'}">
					<li class="widthitem">
						<div class="card" style="width: 20rem;">
						  <div class="card-body" style="background-color : #add8e6">
						    <p class="card-title" >공연 명 : ${pr.name }</p>
						  	<p class="card-text" >예약번호 : ${pr.PReservNo}</p>
						    <p class="card-text">공연일정 : ${pr.frDt }</p>
						    <p class="card-text">좌석번호 : ${pr.seatNo }</p>
						    <p class="card-text">좌석구역 : ${pr.loc }</p>
						    <p class="card-text">가  격 : ${pr.price }</p>
						    <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="자유시장에 올라가있는 티켓입니다!">선택</button>
						    <input type="button" onclick="selectedFnc2()" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal2" value="취소">
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
						  <div class="card-body" style="background-color : gray">
						    <p class="card-title" >공연 명 : ${pr.name }</p>
						  	<p class="card-text" >예약번호 : ${pr.PReservNo}</p>
						    <p class="card-text">공연일정 : ${pr.frDt }</p>
						    <p class="card-text">좌석번호 : ${pr.seatNo }</p>
						    <p class="card-text">좌석구역 : ${pr.loc }</p>
						    <p class="card-text">가  격 : ${pr.price }</p>
						    <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="bottom" title="거래를 예정중인 티켓입니다!">선택</button>
						    <input type="button" onclick="selectedFnc2()" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal2" value="취소">
						  </div>
						</div>
					</li>
					</c:if>
				</c:if>
				</c:forEach>
			</ul>
			<input type="button" onclick="resetPosition()" value="원위치로" />
			
			<!-- Modal -->
			<div class="modal fade" id="prInfoModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
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
			      	
			      	<p id="Mseat" ></p>
			      	<input type="hidden" id="seatNo" name="seatNo">
			      	
			      	<p id="Mloc" ></p>
			      	<input type="hidden" id="loc" name="loc">
			      	
			      	<p id="Mprice" ></p>
			      	<input type="hidden" id="price" name="price">
			      </div>
			      <div class="modal-footer" style="display:block">
			      	<p>맞으시면 확인 버튼을 눌러주세요.         </p><br>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <input type="submit" class="btn btn-primary" value="확인">
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			<!-- Modal End -->
			
			<!-- Modal2 -->
			<div class="modal fade" id="prInfoModal2">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
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
			      	
			      	<p id="M2seat" ></p>
			      	<input type="hidden" id="seatNo" name="seatNo">
			      	
			      	<p id="M2loc" ></p>
			      	<input type="hidden" id="loc" name="loc">
			      	
			      	<p id="M2price" ></p>
			      	<input type="hidden" id="price" name="price">
			      </div>
			      <div class="modal-footer" style="display:block">
			      	<p>예약을 취소하시려면 버튼을 눌러주세요.</p>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <input type="submit" class="btn btn-primary" value="확인">
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			<!-- Modal2 End -->
			
		</div>
		</div>
	</div>
	
	<!-- movie assignment -->
	<div id="mv_container">
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
						<li class="widthitem">
							<div class="card" style="width: 20rem;">
							  <div class="card-body">
							    <p class="card-title" >영화 명 : ${mr.name }</p>
							  	<p class="card-text" >예약번호 : ${mr.mvReservNo}</p>
							    <p class="card-text">공연일정 : ${mr.schDate }</p>
							    <p class="card-text">좌석번호 : ${mr.seatName }</p>
							    <p class="card-text">영화관지역 : ${mr.reservHall }</p>
							    <p class="card-text">가  격 : 13000원</p>
							    <input type="button" onclick="selectedFnc()" class="btn btn-primary" data-toggle="modal" data-target="#mrInfoModal" value="선택">
							  </div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
			<input type="button" onclick="resetPosition()" value="원위치로" />
			
			<!-- Modal -->
			<div class="modal fade" id="mrInfoModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
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
			      	
			      	<p id="Mseat" ></p>
			      	<input type="hidden" id="seatNo" name="seatNo">
			      	
			      	<p id="Mloc" ></p>
			      	<input type="hidden" id="loc" name="loc">
			      	
			      	<p id="Mprice" ></p>
			      	<input type="hidden" id="price" name="price">
			      </div>
			      <div class="modal-footer" style="display:block">
			      	<p>맞으시면 확인 버튼을 눌러주세요.         </p><br>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <input type="submit" class="btn btn-primary" value="확인">
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			<!-- Modal End -->
			
			<!-- Modal2 -->
			<div class="modal fade" id="prInfoModal2">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
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
			      	
			      	<p id="M2seat" ></p>
			      	<input type="hidden" id="seatNo" name="seatNo">
			      	
			      	<p id="M2loc" ></p>
			      	<input type="hidden" id="loc" name="loc">
			      	
			      	<p id="M2price" ></p>
			      	<input type="hidden" id="price" name="price">
			      </div>
			      <div class="modal-footer" style="display:block">
			      	<p>예약을 취소하시려면 버튼을 눌러주세요.</p>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <input type="submit" class="btn btn-primary" value="확인">
			      </div>
			      </form>
			    </div>
			  </div>
			</div>
			<!-- Modal2 End -->
			
		</div>
		</div>
	</div>
	
	
	<script>
	function pffold(){
		$("#pf_container").css("visibility","visibility")
		$("#mv_container").css("visibility", "hidden")
	}	
	
	function mvfold(){
		$("#mv_container").css("visibility","visibility")
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
		
		console.log('예약번호===');
		console.log(PReservNo);
		
		$('#M2name').html(name);
		$('#M2PReservNo').html(PReservNo2);
		$('#M2date').html(date);
		$('#M2seat').html(seat);
		$('#M2loc').html(loc);
		$('#M2price').html(price);
		
		let prn = parseInt(PReservNo2.substring(7,));
		console.log('====================');
		console.log(typeof(prn));
		
		$("#name").val(name.substring(7,))
		$("#PReservNo2").val(prn);
		$("#date").val(date.substring(7,))
		$("#seatNo").val(seat.substring(7,))
		$("#loc").val(loc.substring(7,))
		$("#price").val(price.substring(7,))
		
		console.log('------------------');
		console.log(parseInt(PReservNo2.substring(7,)));
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