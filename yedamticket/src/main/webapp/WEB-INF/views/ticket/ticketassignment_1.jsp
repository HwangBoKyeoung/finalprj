<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	border: 1px solid black;
	margin: 15px;
	min-width: 15rem;
	min-height: 25rem;
	list-style: none;
	user-select: none;
	text-align: center;
}
</style>

</head>
<body>
	<div align="center">
		<h1>티켓양도</h1>
		<h2>${sessionId }님이보유한티켓정보</h2>

		<c:if test="${empty prInfo }">
			<div>
				<h1>보유중인 티켓이 없습니다..!</h1>
			</div>
		</c:if>
 
 		<div id="widthslider" align="center">
			<ul class="widthlist">
				<c:forEach items="${prInfo }" var="pr">
					<li class="widthitem">
						<p>공연이름 : ${pr.name }
						<p>공연일정 : ${pr.frDt}</p> <br>
						<p>좌석번호 : ${pr.seatNo }</p> <br>
						<p>가격 : ${pr.price }</p>
					    
						<div class="btnArea">
							<input class="btn" type="button" value="선택">
						</div>
					</li>
				</c:forEach>
			</ul>
			<input type="button" onclick="resetPosition()" value="원위치로" />
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
	</script>

</body>
</html>