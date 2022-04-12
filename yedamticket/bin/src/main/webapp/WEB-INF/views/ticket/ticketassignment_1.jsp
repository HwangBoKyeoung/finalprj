<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>>>>>>> develop
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
<<<<<<< HEAD
/* 기본 구조 */
.wrap {
max-width:95%;
max-height:60%;
margin:50px auto;
background:#f8f8f8;
}

/* 가로 스크롤 적용 */
.scroll__wrap {
overflow-x:auto; 
white-space:nowrap; 
font-size:0
}

.scroll--element {
display:inline-block; 
width:250px; 
height:350px; 
border:1px solid #222; 
background:#fff; 
font-size:16px; 
line-height:150px; 
text-align:center;
}

.scroll--element + .scroll--element {
margin-left:15px;

.btn{
height:20px;

}
}

</style>
</head>
<body>
${prInfo }
	<div align="center">
	<h1>티켓양도</h1>
	<h1>위 값은 ? ${prInfo }</h1>
	<h2>${sessionId }님이 보유한 티켓정보</h2>
	
	<div class="wrap">
	  <div class="scroll__wrap">
	  <c:forEach items="${prInfo }" var="pr">
	  <h1>값은 ?    ${pr }</h1>
	    <div class="scroll--element">${pr.PReservNo }
	    ${pr.reserveDttm}
	    	<div>
		    	<input class="btn" type="button" value="확인">
	    	</div>
	    </div>
	  </c:forEach>
	  </div>
	</div>
	</div>
=======
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
<h1>티켓양도</h1>
<h3>${sessionId }님이 보유중인 티켓입니다!</h3>
	<div align="center">
		<c:if test="${empty prInfo }">
			<div>
				<h1>보유중인 티켓이 없습니다..!</h1>
			</div>
		</c:if>
 
 		<div id="widthslider" align="center">
			<ul class="widthlist">
				<c:forEach items="${prInfo }" var="pr">
				<li class="widthitem">
					<div class="card" style="width: 20rem;">
					  <div class="card-body">
					    <p class="card-title" >공연 명 : ${pr.name }</p>
					    <p class="card-text">공연일정 : ${pr.frDt }</p>
					    <p class="card-text">좌석번호 : ${pr.seatNo }</p>
					    <p class="card-text">좌석구역 : ${pr.loc }</p>
					    <p class="card-text">가  격 : ${pr.price }</p>
					    <input type="button" onclick="selectedFnc()" class="btn btn-primary" data-toggle="modal" data-target="#prInfoModal" value="선택">
					  </div>
					</div>
				</li>
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
			      	
			      	<p id="Mdate"></p>
			      	<input type="hidden" id="date" name="date">
			      	
			      	<p id="Mseat" ></p>
			      	<input type="hidden" id="seatNo" name="seatNo">
			      	
			      	<p id="Mloc" ></p>
			      	<input type="hidden" id="loc" name="loc">
			      	
			      	<p id="Mprice" ></p>
			      	<input type="hidden" id="price" name="price">
			      </div>
			      <div class="modal-footer">
			      	<p>맞으시면 확인 버튼을 눌러주세요.</p>
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
	
	<script>
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
	
	function selectedFnc(){
		var name = $(event.target).prev().prev().prev().prev().prev().text();
		var date = $(event.target).prev().prev().prev().prev().text();
		var seat = $(event.target).prev().prev().prev().text();
		var price = $(event.target).prev().prev().text();
		var loc = $(event.target).prev().text();
		
		$('#Mname').html(name);
		$('#Mdate').html(date);
		$('#Mseat').html(seat);
		$('#Mprice').html(price);
		$('#Mloc').html(loc);
		
		$("#name").val(name.substring(7,))
		$("#date").val(date.substring(7,))
		$("#seatNo").val(seat.substring(7,))
		$("#price").val(price.substring(7,))
		$("#loc").val(loc.substring(7,))
	}
	
	</script>

>>>>>>> develop
</body>
</html>