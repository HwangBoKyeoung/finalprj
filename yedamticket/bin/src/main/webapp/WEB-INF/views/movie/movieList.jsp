<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/users/css/movieList.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<script src="resources/users/js/movieList.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
h1 {
	color: #7a5ecf;
	text-align: left;
	margin-top: 50px;
	margin-bottom: 5px;
	font-family: 'Gowun Dodum', sans-serif;
}

.btnn {
	display: block;
	margin: auto;
	margin-bottom: 35px;
	margin-right: 20px;
	padding: 0 30px;
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
	font-family: 'Gowun Dodum', sans-serif;
}

.card:hover .info {
	opacity: 0.9;
}

.info {
	position: absolute;
	padding: 20px;
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
	font-size: 16px;
	margin: 25px;
	color: white;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: none;
	line-height: 2.5;
	height: 100%;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
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
	font-weight: bold;
	font-family: 'Gowun Dodum', sans-serif;
}

#result {
	position: relative;
}

.image {
	display: block;
	width: 100%;
	height: auto;
}

.rPoster {
	width: 100%;
	height: 100%;
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
/*
.rPoster{
	width:100%;
	height:100%;
}
.rank {
    position: absolute;
    top: 17px;
    left: 0;
    width: 50px;
    height: 50px;
    line-height: 50px;
    background-color: #38116a;
    text-align: center;
    box-shadow: 3px 3px 8px rgb(0 0 0 / 50%);
    color: white;
    font-size:25px;
  }
*/
hr {
	height: 2.5px;
	border-color: #7a5ecf;
}

.rank {
	position: absolute;
	top: 17px;
	left: 0;
	width: 50px;
	height: 50px;
	line-height: 50px;
	background-color: #38116a;
	text-align: center;
	box-shadow: 3px 3px 8px rgb(0 0 0/ 50%);
	color: white;
	font-size: 25px;
}
</style>

</head>
<body>
	<br>
	<div id="show"></div>
	<div class="container">
		<h1 class="hr-sect">박스오피스 순위</h1>
		<hr>
		<div class="row">
			<c:forEach items="${movie }" var="movie" varStatus="status">
				<div class="col-3">
					<div class="card">
						<div class="rank">
							<strong>${status.count }</strong>
						</div>
						<div class="poster" id="poster">
							<input class="rankPoster" type="hidden" value="${movie.fileCd}">
							<img class="rPoster">
						</div>
						<div class="details">
							<br> <br>
							<div class="info">
								<p class="pbox">${movie.content}......</p>
							</div>
						</div>
					</div>
					<p id="mname">${movie.name}</p>
					<div style="display: -webkit-inline-box;">
						<form action="movieDetail.do" method="post">
							<input type="hidden" name="docId" id="docId"
								value="${movie.docId }">
							<button type="submit" class="btnn">상세보기</button>
						</form>
						<button type="button" class="btnn"
							onclick="location.href='movieBooking.do'">예매하기</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>



	<div id="show"></div>
	<div class="container">
		<h1 class="hr-sect">상영 예정작</h1>
		<hr>
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
								<p class="pbox">${m.content}......</p>
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
	 console.log(fileCd);
	    for(var i =0;i<fileCd.length;i++){
	       if(fileCd[i].defaultValue == null || fileCd[i].defaultValue == ''){
	          rPoster[i].setAttribute('src','resources/yedamticket.png');
	       }else{
	          var split=(fileCd[i].defaultValue).split('|');
	          rPoster[i].setAttribute('src',split[0]);   
	       }
	       
	    }
	//
	 let fileCd1=document.getElementsByClassName('realesePoster');
	 let rPoster1=document.getElementsByClassName('rePoster');
	    for(var i =0;i<fileCd.length;i++){
	       
	       var split=(fileCd1[i].defaultValue).split('|');
	       rPoster1[i].setAttribute('src',split[0]);
	    }
	</script>

</body>
</html>