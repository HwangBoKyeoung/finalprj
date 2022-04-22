<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta charset="utf-8" />
<title>koreaMap</title>
<style type="text/css">
.p1 {
   font-size: 150%;
   font-weight: bold;
   padding-left: 20px;
}

.p2 {
   font-size: 100%;
   font-weight: bold;
   padding-left: 20px;
}

.jbwrap {
   width: 50%;
   margin: 10px auto;
}

.jbwrap img {
   width: 50%;
   height: 30%;
   vertical-align: middle;
}

.jbtext {
   padding: 5px 10px;
   background-color: transparent;
   text-align: center;
}










</style>
</head>
<!-- css -->
<link rel="stylesheet" href="resources/home/assets/css/reset19.css">
<link rel="stylesheet" href="resources/home/assets/css/style19.css">
<link rel="stylesheet" href="resources/home/assets/css/swiper.css">
<link rel="stylesheet" href="resources/home/assets/css/locList.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/home/assets/icons/favicon.ico">
<!-- 지도 -->
<link rel="stylesheet" href="resources/css/korea.css" />
<script type="text/javascript" src="resources/js/d3.js"></script>
<script type="text/javascript" src="resources/js/korea.js"></script>
<body>

   <br>
   <br>

   <p class="p1">티켓거래</p>
   <p class="p2"></p>
   <div class="jbwrap">
      <img src="resources/ticketdeal.png">
   </div>
   <div class="jbtext">
      <p class="p3">공연&영화의 폭넓은 티켓 양도 및 거래는 예담 티켓에서!</p>
   </div>
   <hr>

   <br>

   <p class="p1">지역별 공연 리스트</p>
   <p class="p2">* 아래의 지도에서 지역을 클릭하시면 그 지역의 공연목록을 볼 수 있습니다.</p>
   <hr>
   <!--지역별 공연-->
   <section>
      <div class="row">
         <div class="col-4">
            <div id="container"></div>
         </div>
         <div class="col-8">
            <h1 id="demo"></h1>           
         </div>          
         </div>
      <div class="cards" style="display: none;">
              <div class="card">
                <div class="card__image-holder">
                  <img class="card__image" src="https://source.unsplash.com/300x225/?wave" alt="wave" />
                </div>
                <div class="card-title">
                  <a  class="toggle-info btn">
                    <span class="left"></span>
                    <span class="right"></span>
                  </a>
                  <h2>
                      Card title
                  </h2>
                  <p>Image from unsplash.com</p>
                </div>
                <div class="card-flap flap1">
                  <div class="card-description">
                    This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
                  </div>
                  <div class="card-flap flap2">
                    <div class="card-actions">
                      <a id="reservBtn" class="btn">예매하기</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
   </section>
   <br>
   <div class="hr-sect">영화 인기순위 및 상영예정작 안내</div>
   <br>
   <!-- 박스오핏  -->
   <section id="movie">
      <div class="container">
         <div class="row">
            <h2 class="ir_so">영화 예매</h2>
            <div class="movie">
               <div class="movie_title">
                  <ul class="clearfix">
                     <li class="active"><a href="#">박스오피스</a></li>
                     <li><a href="#">상영예정작</a></li>
                  </ul>
               </div>
               <div class="movie_chart">
                  <!-- 영화순위-->
                  <div class="swiper-container2">
                     <div class="chart_cont1 swiper-wrapper">
                        <c:forEach items="${movie }" var="movie" varStatus="status">
                           <div class="swiper-slide">
                              <div class="poster">
                                 <figure>
                                    <input type="hidden" class="rankPoster"
                                       value="${movie.fileCd }">
                                    <img class="rPoster">
                                 </figure>
                                 <div class="rank">
                                    <strong>${status.count }</strong>
                                 </div>
                                 <div class="mx">
                                    <span class="icon m ir_pm">MX</span>
                                 </div>
                              </div>
                              <div class="infor">
                                 <h3>
                                    <!-- all -->
                                    <c:if test="${movie.rating eq '전체관람가능' }">
                                       <span class="icon all ir_pm">전체관람가능</span>
                                    </c:if>
                                    <c:if test="${movie.rating eq '전체관람가' }">
                                       <span class="icon all ir_pm">전체관람가능</span>
                                    </c:if>
                                    <!-- 7세 -->
                                    <c:if test="${movie.rating eq '7세관람가' }">
                                       <span class="icon all ir_pm">7세관람가</span>
                                    </c:if>
                                    <!-- 12 -->
                                    <c:if test="${movie.rating eq '12세관람가' }">
                                       <span class="icon a15 ir_pm">12세관람가</span>
                                    </c:if>
                                    <!-- 15 -->
                                    <c:if test="${movie.rating eq '15세관람가' }">
                                       <span class="icon a19 ir_pm">15세관람가</span>
                                    </c:if>
                                    <!-- 19 -->
                                    <c:if test="${movie.rating eq '18세관람가' }">
                                       <span class="icon a12 ir_pm">18세이상관람가</span>
                                    </c:if>
                                    <c:if test="${movie.rating eq '18세관람가(청소년관람불가)' }">
                                       <span class="icon a12 ir_pm">18세이상관람가</span>
                                    </c:if>

                                    <strong>${movie.name }</strong>

                                 </h3>
                                 <div class="infor_btn">
                                    <a href="#">상세정보</a> <a href="#">예매하기</a>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
                  <!-- 상영예정작-->

                  <div class="swiper-container2">
                     <div class="chart_cont3 swiper-wrapper">
                        <c:forEach items="${movies }" var="movies" varStatus="status">
                           <div class="swiper-slide">
                              <div class="poster">
                                 <figure>
                                    <img src="resources/home/assets/img/poster03.jpg">
                                 </figure>
                                 <div class="rank">
                                    <strong>${status.count }</strong>
                                 </div>
                                 <div class="mx">
                                    <span class="icon m ir_pm">YEDAM</span>
                                 </div>
                              </div>
                              <div class="infor">
                                 <h3>
                                    <!-- all -->
                                    <c:if test="${movies.rating eq '전체관람가능' }">
                                       <span class="icon all ir_pm">전체관람가능</span>
                                    </c:if>
                                    <c:if test="${movies.rating eq '전체관람가' }">
                                       <span class="icon all ir_pm">전체관람가능</span>
                                    </c:if>
                                    <!-- 7세 -->
                                    <c:if test="${movies.rating eq '7세관람가' }">
                                       <span class="icon all ir_pm">7세관람가</span>
                                    </c:if>
                                    <!-- 12 -->
                                    <c:if test="${movies.rating eq '12세관람가' }">
                                       <span class="icon a15 ir_pm">12세관람가</span>
                                    </c:if>
                                    <!-- 15 -->
                                    <c:if test="${movies.rating eq '15세관람가' }">
                                       <span class="icon a19 ir_pm">15세관람가</span>
                                    </c:if>
                                    <!-- 19 -->
                                    <c:if test="${movies.rating eq '18세관람가' }">
                                       <span class="icon a12 ir_pm">18세이상관람가</span>
                                    </c:if>
                                    <c:if test="${movies.rating eq '18세관람가(청소년관람불가)' }">
                                       <span class="icon a12 ir_pm">18세이상관람가</span>
                                    </c:if>
                                    <strong>${movies.name }</strong>
                                 </h3>
                                 <div class="infor_btn">
                                    <a href="movieDetail.do?docId=${movies.docId }"
                                       class="badge badge-warning">상세정보</a>

                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                     </div>
                  </div>
                  <!-- //chart_cont3-->
               </div>
            </div>
         </div>
      </div>
   </section>
</body>
<script src="resources/home/assets/js/jquery.min_1.12.4.js"></script>
<script src="resources/home/assets/js/modernizr-custom.js"></script>
<script src="resources/home/assets/js/ie-checker.js"></script>
<script src="resources/home/assets/js/swiper.min.js"></script>
<script src="resources/home/assets/js/iframe_api.js"></script>
<script src="resources/home/assets/js/movie.js"></script>
<script>
   //포스터 filecd잘라주기
   let fileCd = document.getElementsByClassName('rankPoster');
   console.log(fileCd);
   let rPoster = document.getElementsByClassName('rPoster');
   console.log(rPoster);
   for (var i = 0; i < fileCd.length; i++) {

      let split = (fileCd[i].defaultValue).split('|');
      console.log(split[0]);
      rPoster[i].setAttribute('src', split[0]);
   }

   function pBookingForm(pNo) {
      location.href = "pBookingForm.do?pNo=" + pNo;
   }

   //영화차트 이미지 슬라이드
   var swiper = new Swiper('.swiper-container2', {
      slidesPerView : 4,
      spaceBetween : 24,
      //            mousewheel: {
      //                invert: true,
      //            },
      keyboard : {
         enabled : true,
         onlyInViewport : false,
      },
      autoplay : {
         delay : 6000,
      },
      breakpoints : {
         600 : {
            slidesPerView : 1.4,
            spaceBetween : 24
         },
         768 : {
            slidesPerView : 2,
            spaceBetween : 24
         },
         960 : {
            slidesPerView : 3,
            spaceBetween : 24
         }
      }
   });

   //영화차트 탭 메뉴
   var movBtn = $(".movie_title > ul > li");
   var movCont = $(".movie_chart > div");

   movCont.hide().eq(0).show();

   movBtn.click(function(e) {
      e.preventDefault();
      var target = $(this);
      var index = target.index();
      movBtn.removeClass("active");
      target.addClass("active");
      movCont.css("display", "none");
      movCont.eq(index).css("display", "block");
   });

   //공지사항 탭 메뉴
   var tabMenu = $(".notice");

   //컨텐츠 내용을 숨겨주세요!
   tabMenu.find("ul > li > ul").hide();
   tabMenu.find("li.active > ul").show();

   function tabList(e) {
      //e.preventDefault(); //#의 기능을 차단
      var target = $(this);
      target.next().show().parent("li").addClass("active").siblings("li")
            .removeClass("active").find("ul").hide();
      //버튼을 클릭하면 ~ div를 보여주고
      //부모의 li 태그에 클래스 추가하고
      //형제의 li 태그에 클래스 제거하고
      //제거한 자식의 div 태그를 숨겨줌 
   }

   tabMenu.find("ul > li > a").click(tabList).focus(tabList);
</script>
</html>
