<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
}

body {
	width: 100%;
/* 	padding: 4rem 0; */
/* 	overflow: hidden; */
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

.hr-sect{
	color: #7a5ecf;
	text-align: left;
	margin-top: 50px;
	margin-bottom: 5px;
	font-family: 'Gowun Dodum', sans-serif;
	width: 1400px;
	font-size: 3.5em;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div align="center" class="container">
	<h1 class="hr-sect">자유거래</h1>
	<hr>
	
	<div align="center">
 		<div id="widthslider" align="center">
			<ul class="widthlist">
				<c:forEach items="${list }" var="t">
				<li class="widthitem">
					<div class="card" style="width: 20rem;">
					  <div class="card-body">
					    <p class="card-title" hidden="" >${t.UId }</p>
					    <p class="card-title" >공연 명 : ${t.name }</p>
					  	<p class="card-text" >예약번호 : ${t.PReservNo}</p>
					    <p class="card-text">공연일정 : ${t.frDt }</p>
					    <p class="card-text">좌석번호 : ${t.seatNo }</p>
					    <c:set var="seatCnt" value="${fn:split(t.seatNo, ',') }"/>
						<c:set var="seatCnt2" value="0"/>
							<c:forEach var="seatCntFor" items="${seatCnt }">
								<c:set var="tt" value="${seatCnt2 = seatCnt2 + 1 }"/>
							</c:forEach>	
					    <p class="card-text">좌석구역 : ${t.loc }</p>
					    <fmt:formatNumber value="${t.price * seatCnt2}" var="Point3"/>
					    <p class="card-text">가  격 : ${Point3}원</p>
					    
					    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal" onclick="selectedFnc();">선택</button>
					  </div>
					</div>
				</li>
				</c:forEach>
			</ul>
			<!-- <input type="button" onclick="resetPosition()" value="원위치로" /> -->
			
			<!-- Modal -->
			<div class="modal fade" id="prInfoModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			       <!--  <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
			          <span aria-hidden="true">&times;</span>
			        </button> -->
			      </div>
			      <form action="ticketmarket_2.do" method="POST">
			      <input type="hidden" id="UId" name="UId">
			      <input type="hidden" name="buyerAddr" id="buyerAddr">
			      <input type="hidden" name="ownerAddr" id="ownerAddr">
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
			      	
			      	<p id="MUId" ></p>
			      	<input type="hidden" id="UId" name="UId">
			      	
			      	
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
		</div>
	</div>
</div>
	
	
	<script>
	function selectedFnc(){
		var UId = 		$(event.target).prev().prev().prev().prev().prev().prev().prev().text();
		var name = 		$(event.target).prev().prev().prev().prev().prev().prev().text();
		var PReservNo = $(event.target).prev().prev().prev().prev().prev().text();
		var date = 		$(event.target).prev().prev().prev().prev().text();
		var seat = 		$(event.target).prev().prev().prev().text();
		var loc =		$(event.target).prev().prev().text();
		var price = 	$(event.target).prev().text();
		
		if(UId == '${sessionId}'){
			alert("자신의 티켓을 선택할 수 없습니다.")
			document.location.href='ticketmarket_1.do';
			return false;
		}
		
		$('#Mname').html(name);
		$('#MPReservNo').html(PReservNo);
		$('#Mdate').html(date);
		$('#Mseat').html(seat);
		$('#Mloc').html(loc);
		$('#Mprice').html(price);
		$('#UId').html(UId);
		
		$("#name").val(name.substring(7,))
		$("#PReservNo").val(PReservNo.substring(7,))
		$("#date").val(date.substring(7,))
		$("#seatNo").val(seat.substring(7,))
		$("#loc").val(loc.substring(7,))
		$("#price").val(price.substring(7,))
		$("#UId").val(UId)
		
		
		
		
		$.ajax({
		url: "loginChk",
		type: "post",
		dataType: "text",
		data: {
			"UId": UId
		},
		success: function(data) {
			console.log(data)
			$("#ownerAddr").val(data)
		}
	})
		
	}
	
	$.ajax({
		url: "loginChk",
		type: "post",
		dataType: "text",
		data: {
			"UId": '${sessionId}'
		},
		success: function(data) {
			console.log(data)
			$("#buyerAddr").val(data)
		}
	})
	
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
