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

.container {
	max-width: 95%;
	max-height: 60%;
	margin: 50px auto;
	background: #f8f8f8;
}

.list {
	padding: 1rem 0;
	width: 100%;
	display: flex;
}

.item {
	border: 1px solid black;
	margin: 15px;
	min-width: 15rem;
	min-height: 25rem;
	list-style: none;
	user-select: none;
	text-align: center;
}

.btnArea {
	
}
</style>
</head>
<body>
	<div align="center">
		<h1>티켓양도</h1>
		<h2>${sessionId }님이보유한티켓정보</h2>

		<%-- <c:if test="${empty prInfo }">
			<div>
				<h1>보유중인 티켓이 없습니다..!</h1>
			</div>
		</c:if> --%>
 
		<div class="container">
			<ul class="list">
				<%-- <c:if test="${not empty prInfo}">
					<c:forEach items="${prInfo }" var="pr">
						<li class="item">
							<p>예매번호 : ${pr.PReservNo }</p> <br>
							<p>예매일자 : ${pr.reserveDttm}</p> <br>
							<p>좌석번호 : ${pr.seatNo }</p> 
						    <!-- 
						    <p>예매번호 : 123</p> <br>
							<p>예매일자 : 123</p> <br>
							<p>좌석번호 : 123</p> 
							-->
						
							<div class="btnArea">
								<input class="btn" type="button" value="선택">
							</div>
						</li>
					</c:forEach>
				</c:if> --%>
				          <li class="item">
            <p>영화 제목</p>
            <br />
            <p>영화 예매일</p>
            <br />
            <p>가격</p>
            <div class="btnArea">
              <input class="btn" type="button" value="선택" />
            </div>
          </li>

          <li class="item">
            <p>영화 제목</p>
            <br />
            <p>영화 예매일</p>
            <br />
            <p>가격</p>
            <div class="btnArea">
              <input class="btn" type="button" value="선택" />
            </div>
          </li>

          <li class="item">
            <p>영화 제목</p>
            <br />
            <p>영화 예매일</p>
            <br />
            <p>가격</p>
            <div class="btnArea">
              <input class="btn" type="button" value="선택" />
            </div>
          </li>

          <li class="item">
            <p>영화 제목</p>
            <br />
            <p>영화 예매일</p>
            <br />
            <p>가격</p>
            <div class="btnArea">
              <input class="btn" type="button" value="선택" />
            </div>
          </li>

          <li class="item">
            <p>영화 제목</p>
            <br />
            <p>영화 예매일</p>
            <br />
            <p>가격</p>
            <div class="btnArea">
              <input class="btn" type="button" value="선택" />
            </div>
          </li>
			</ul>
		</div>
	</div>

	<script>

		
	
	// 요소
	  const list = document.querySelector(".list")
	  // 사이즈
	  const listScrollWidth = list.scrollWidth
	  const listClientWidth = list.clientWidth
	  // 필요한 변수
	  let startX = 0
	  let nowX = 0
	  let endX = 0
	  let listX = 0
	
	  const onScrollStart = (e) => {
	    startX = getClientX(e)
	    window.addEventListener("mousemove", onScrollMove)
	    window.addEventListener("touchmove", onScrollMove)
	    window.addEventListener("mouseup", onScrollEnd)
	    window.addEventListener("touchend", onScrollEnd)
	  }
	
	  const onScrollMove = (e) => {
	    nowX = getClientX(e)
	    setTranslateX(listX + nowX - startX)
	  }
	
	  const onScrollEnd = (e) => {
	    endX = getClientX(e)
	    listX = getTranslateX()
	    if (listX > 0) {
	      setTranslateX(0)
	      list.style.transition = 'all 0.3s ease'
	      listX = 0
	    } else if (listX < listClientWidth - listScrollWidth) {
	      setTranslateX(listClientWidth - listScrollWidth)
	      list.style.transition = 'all 0.3s ease'
	      listX = listClientWidth - listScrollWidth
	    }
	
	    window.removeEventListener("mousedown", onScrollStart)
	    window.removeEventListener("touchstart", onScrollStart)
	    window.removeEventListener("mousemove", onScrollMove)
	    window.removeEventListener("touchmove", onScrollMove)
	    window.removeEventListener("mouseup", onScrollEnd)
	    window.removeEventListener("touchend", onScrollEnd)
	    window.removeEventListener("click", onClick)
	
	    setTimeout(() => {
	      bindEvents()
	      list.style.transition = ""
	    }, 300)
	  }
	
	  const onClick = (e) => {
	    if (startX - endX !== 0) {
	      e.preventDefault()
	    }
	  }
	
	  const getClientX = (e) => {
	    const isTouches = e.touches ? true : false
	    return isTouches ? e.touches[0].clientX : e.clientX
	  }
	
	  const getTranslateX = () => {
	    return parseInt(
	      getComputedStyle(list).transform.split(/[^\-0-9]+/g)[5]
	    )
	  }
	
	  const setTranslateX = (x) => {
	    list.style.transform = 'translateX(${x}px)'
	  }
	
	  const bindEvents = () => {
	    list.addEventListener("mousedown", onScrollStart)
	    list.addEventListener("touchstart", onScrollStart)
	    list.addEventListener("click", onClick)
	  }
	
	  bindEvents()
	</script>

</body>
</html>