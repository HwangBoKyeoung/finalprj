<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/performance/css/bootstrap.min.css">
<!-- FontAwesome CSS -->
<link rel="stylesheet" href="resources/performance/css/font-awesome.min.css">
<!-- Swiper CSS -->
<link rel="stylesheet" href="resources/performance/css/swiper.min.css">
<!-- Styles -->
<link rel="stylesheet" href="resources/performance/css/style.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>



<body class="events-list-page">
<form class="events-search" action="pList.do" method="post">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-3">
                <input type="date" id="frDt" name="frDt" placeholder="날짜" required>
            </div>

            <div class="col-12 col-md-3">
                <input type="text" id="name" name="name"placeholder="행사명" >
            </div>

            <div class="col-12 col-md-3">
                <input type="text" id="loc" name="loc" placeholder="지역">
            </div>

            <div class="col-12 col-md-3">
                <input class="btn gradient-bg" type="submit" value="Search Events">
            </div>
            <!-- hidden으로 숨겨서 들어갈 값 -->
			<input type="hidden" name="pageNum" value="1">
			<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
			<input type="hidden" name="amount" value="${pageVO.amount }">
        </div>
    </div>
</form>

<div class="container">
    <div class="row events-list">
    	<c:forEach items="${performance }" var="p">
    	<form action="pBookingForm.do" method="post">
        <div class="col-12 col-lg-6 single-event">
            <figure class="events-thumbnail">
                <a href="#"><img src="resources/performance/images/event-1.jpg" alt=""></a>
            </figure>

            <div class="event-content-wrap">
                <header class="entry-header flex justify-content-between">
                    <div>
                        <h2 class="entry-title">${p.name }</h2>

                        <div class="event-location">${p.loc }</div>
						
                        <div class="event-date">${p.performanceScheduleVO.frDt }  ${p.performanceScheduleVO.time }</div>
                    </div>
                    <div class="event-cost flex justify-content-center align-items-center">
                        <p>${p.price }</p>
                    </div>
                    <!-- pno으로 해야하는데 임시 -->
                   <input type="hidden" name='name' value="${p.name }">
                    
                </header>

                <footer class="entry-footer">
                    <button type="submit"  class="btn gradient-bg" >Buy Tikets</button>
                </footer>
            </div>
        </div>
        </form>
 		</c:forEach>
    </div>
</div>
<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="pList.do?pageNum=${pageVO.startPage-1 }"> <input
							type="button" value="이전" class="btn gradient-bg"></a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="pList.do?pageNum=${num }"> <input type="button"
							value="${num }" class="btn gradient-bg"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="pList.do?pageNum=${pageVO.endPage+1 }"> <input
							type="button" value="다음" class="btn gradient-bg"></a>
					</c:if>
				</div>
<div class="upcoming-events-outer">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="upcoming-events">
                    <div class="upcoming-events-header">
                        <h4>Upcoming Events</h4>
                    </div>

                    <div class="upcoming-events-list">
                        
					<c:forEach items="${Eperformance }" var="ep">
                        <div class="upcoming-event-wrap flex flex-wrap justify-content-between align-items-center">
                            <figure class="events-thumbnail">
                                <a href="#"><img src="resources/performance/images/upcoming-2.jpg" alt=""></a>
                            </figure>

                            <div class="entry-meta">
                                <div class="event-date">27
                                    <span>February</span>
                                </div>
                            </div>

                            <header class="entry-header">
                                <h3 class="entry-title"><a href="#">${ ep.name}</a></h3>

                                <div class="event-date-time">${ep.performanceScheduleVO.frDt }  ${ep.performanceScheduleVO.time }</div>

                                <div class="event-speaker">${ep.actor }</div>
                            </header>

                            <footer class="entry-footer">
                                <a href="#">Buy Tikets</a>
                            </footer>
                        </div>

                       </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>

//달력에 현재 날짜입력 yyyy-mm-dd
let date=new Date();
let year=date.getFullYear();
let day=date.getDate();
var month = date.getMonth() + 1;
if(day < 10 ) {
    day='0'+ day
} else{
    day='' + day
}; 
if(month < 10 ) {
    month='0'+ month
} else{
    month='' + month
}; 
let now=String(year)+'-'+String(month)+'-'+String(day);
console.log(now);
$('#frDt').val(now);

//
</script>

<script type='text/javascript' src='resources/performance/js/jquery.js'></script>
<script type='text/javascript' src='resources/performance/js/masonry.pkgd.min.js'></script>
<script type='text/javascript' src='resources/performance/js/jquery.collapsible.min.js'></script>
<script type='text/javascript' src='resources/performance/js/swiper.min.js'></script>
<script type='text/javascript' src='resources/performance/js/jquery.countdown.min.js'></script>
<script type='text/javascript' src='resources/performance/js/circle-progress.min.js'></script>
<script type='text/javascript' src='resources/performance/js/jquery.countTo.min.js'></script>
<script type='text/javascript' src='resources/performance/js/custom.js'></script>
</body>
</html>
