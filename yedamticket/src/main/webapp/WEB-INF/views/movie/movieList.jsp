<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/users/css/movieList.css">
<script src="resources/users/js/movieList.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>

.btnn {
   display: block;
   margin: auto;
   margin-bottom: 35px;
   margin-right: 20px;
   padding: 0 50px;
   text-align: center;
   line-height: 34px;
   color: white;
   font-weight: 400;
   border-radius: 4px;
   font-family: fantasy;
   text-decoration: none;
   border: 1px solid #503396;
   vertical-align: middle;
   background-color: #fff;
   cursor: pointer;
   background-color: #503396;
}
.card {
   width: 280px;
   height: 390px;
   background: #000;
   overflow: hidden;
   
}
.card:hover .info {
  opacity: 0.9;
}
.info {
  position: absolute;
  padding:20px;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #0c0e0fed;
}
.pbox {
     font-size: 15px;
   margin: 10px 0 10px;
   color: white;
   display: block;
    font-size: 16px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    line-height: 1.2;
    height: 8.4em;
    text-align: left;
    word-wrap: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 7;
    -webkit-box-orient: vertical;
}
.container {
   min-width: 1200px;
   max-width: 1400px;
}
.col-3 {
   margin-top: 100px;
   text-align-last: center;
}
#mname {
   width: 280px;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
   margin: auto;
   margin-bottom: 20px;
   font-weight:bold;
   font-family: fantasy;
}

#result {
	position: relative;
}

.image {
	display: block;
	width: 100%;
	height: auto;
}

figure>img {
	display: block;
	/*  width: 100%; */
	height: auto;
}

.caption {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 100%;
	opacity: 0;
	transition: .5s ease;
	background-color: rgba(0, 0, 0, 0.7);
}

.text {
	color: white;
	font-size: 20px;
	top: 50%;
	left: 50%;
	position: relative;
	transform: translate(-50%, -50%);
	text-align: center;
}

#result>.card:hover .caption {
	opacity: 1;
}

</style>

</head>
<body>

<h1>박스오피스 순위</h1>
   <div id="show"></div>
   <div class="container">
      <div class="row">
         <c:forEach items="${movie }" var="movie" varStatus="status">
            <div class="col-3">
               <div class="card">
                  <div class="poster" id="poster">
                     <input class="rankPoster" type="hidden" value="${movie.fileCd}">
                     <img class="rPoster">
                  </div>
                  <div class="details">
                     <br> <br>
                     <div class="info">
                        <p class="pbox">${movie.content}</p>
                     </div>
                  </div>
               </div>
               <p id="mname">${movie.name}</p>
               <form action="movieDetail.do" method="post">
	               <div>
	               	 <input type="hidden" name="docId" id="docId" value="${movie.docId }">
	                  <button type="submit" class="btnn">상세보기</button>
	               </div>
               </form>
            </div>
         </c:forEach>
      </div>
    
  </div>	
	
	
	
	
	
<h1>상영 예정작</h1>
   <div id="show"></div>
   <div class="container">
      <div class="row">
         <c:forEach items="${movies }" var="m" varStatus="status">
            <div class="col-3">
               <div class="card">
                  <div class="poster" id="poster">
                     <input class="realesePoster" type="hidden" value="${m.fileCd}">
                     <img class="rePoster">
                  </div>
                  <div class="details">
                     <br> <br>
                     <div class="info">
                        <p class="pbox">${m.content}</p>
                     </div>
                  </div>
               </div>
               <p id="mname">${m.name}</p>
               <form action="movieDetail.do" method="post">
	               <div>
	               	 <input type="hidden" name="docId" id="docId" value="${m.docId }">
	                  <button type="submit" class="btnn">상세보기</button>
	               </div>
               </form>
            </div>
         </c:forEach>
      </div>
    
  </div>
  
 <script>
 ///박스오피스 포스터 filecd자르기
 let fileCd=document.getElementsByClassName('rankPoster');
 let rPoster=document.getElementsByClassName('rPoster');
 	for(var i =0;i<fileCd.length;i++){
 		
 		var split=(fileCd[i].defaultValue).split('|');
 		rPoster[i].setAttribute('src',split[0]);
 	}
//
 let fileCd1=document.getElementsByClassName('realesePoster');
 let rPoster1=document.getElementsByClassName('rePoster');
 	for(var i =0;i<fileCd.length;i++){
 		
 		var split=(fileCd1[i].defaultValue).split('|');
 		rPoster1[i].setAttribute('src',split[0]);
 	}
 
       
   </script>


<!--
	<h1>박스오피스 순위</h1>
	<div id="result"></div>
	<h1>상영 예정작</h1>
	<div id="wrapper">
		<c:forEach items="${movies }" var="m">
			<div class="card">
				<header>
					<h3>${m.name }</h3>
				</header>
				<figure>
					<img src="/upload/${m.renames }">
				</figure>
				<p>
					<span>감독: ${m.director }</span> <span>배우: ${m.actor }</span>
				</p>
				<p>
					<span>장르: ${m.genre } </span> <span>연령: ${m.rating } 상영시간:
						${m.runtime }</span>
				</p>
				<p>
					<span>개봉예정일: ${m.startDate }</span>
				</p>
			</div>
		</c:forEach>
	</div>
-->
</body>
</html>