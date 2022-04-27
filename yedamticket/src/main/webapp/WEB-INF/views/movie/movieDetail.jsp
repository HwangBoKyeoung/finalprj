<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<style>
* {
	list-style: none;
}

.swal-button--confirm {
	background-color: #ffb236;
}

.container {
	margin-top: 30px;
	margin-bottom: 150px;
}

#logo {
	text-align: center;
}

h2 {
	font-family: 'Gowun Dodum', sans-serif;
}

h3 {
	font-weight: bold;
	font-family: 'Gowun Dodum', sans-serif;
}

p {
	color: black;
	text-align: left;
	font-family: 'Gowun Dodum', sans-serif;
}

.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.starAvg {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star starAvg {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.star span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}

.starAvg span {
	width: 0;
	position: absolute;
	left: 0;
	color: red;
	overflow: hidden;
	pointer-events: none;
}

#poster {
	width: 65%;
	box-sizing: content-box;
}

#reservBtn {
	margin-top: 18%
}

hr {
	height: 2.5px;
	background: #7a5ecf;
}

.table td, .table th {
	padding: 0.75rem;
	vertical-align: middle;
	border-bottom: 2px solid #dee2e6;
	border-top: 2px solid #7a5ecf;
}

textarea.form-control {
	max-width: 100%;
	max-height: 80px;
	padding: 10px 10px 0 50px;
	resize: none;
	border: none;
	border-bottom: 1px solid #E3E3E3;
	border-radius: 0;
	line-height: 1;
}
</style>

</head>

<body>
<input type="hidden" id="renames1" value="${movie.renames}">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<br>
				<div id="logo">
					<img id="poster" class="poster1">
				</div>
			</div>
			<div class="col-lg-6">
				<br>
				<div id="detail">
					<h3>${movie.name }</h3>
					<hr>
					<p>감독:${movie.director }</p>
					<p>배우:${movie.actor }</p>
					<p>장르:${movie.genre }</p>
					<p id="startD">
						<input type="hidden" value="${movie.startDate}" id="hd" name="hd">
					</p>

					<fmt:formatNumber var="starFloat" value="${star.star/20}"
						pattern="#.#" />
					<fmt:formatNumber var="starAvg" value="${star.star}" pattern="#.#" />
					<p>
						평점: <span class="starAvg"> ★★★★★ <span
							style="width:${starAvg}%;">★★★★★</span>
						</span>(${starFloat})
					</p>
					<button id="reservBtn" class="btn btn-lg"
						onclick="location.href='movieBooking.do'"
						style="background: #cfc5e9;">예매하기</button>
				</div>
			</div>
			<div class="col-lg-12" style="padding-top: 50px; text-align: center;">
				<hr>
				<h2>
					줄거리
				</h2>
				<br>
				<p style="text-align: center;">${movie.content }</p>
				<br>
				<hr>
				<br>
				<h2>
					트레일러/예고편
				</h2>
				<div id="tabMenu" style="padding-top: 30px;">
					<iframe width="80%" height="500"
						src="https://www.youtube.com/embed/5Zv_XlOW9Dc"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
			</div>

			<div class="col-lg-12" style="padding-top: 50px; text-align: center;">
					<hr>
				<c:if test="${not empty sessionId }">
					<div id="contents" style="padding-top: 50px;">
						<div id="links">
							<div id="comment">
								<form>
									<span class="star"> ★★★★★ <span>★★★★★</span> <input
										type="range" id="starValue" oninput="drawStar(this)" value="1"
										step="1" min="0" max="10">
									</span>
								</form>

								<form>
									<input type="hidden" name="star" id="star">
									<h3>
										<label for="content">Comments</label>
									</h3>
									<textarea class="form-control" style="float: left; width: 70%"
										rows="3" id="content" name="content" placeholder="댓글을 입력해주세요."
										required></textarea>
									<button type="button" class="btn btn-lg"
										style="background: #cfc5e9; float: left; margin-left: 53px;"
										onclick="aJaxCall()">입력</button>
								</form>
							</div>
					</div>
					</div>
				</c:if>
				<div id="reply">
					<br> <br> <br> <br> <br>
					<c:if test="${empty sessionId }">
					<h3>
						<label for="content">Comments</label>
					</h3>
					</c:if>
					<table class="table">
						<c:if test="${empty replys}">
							<h2>아직 입력된 댓글이 없습니다.</h2>
						</c:if>
						<c:forEach items="${replys }" var="r">
						
							<tr>
								<td>${r.UId }</td>
								<td><span class="star"> ★★★★★ <c:set var="star"
											value="${r.star}" /> <span style="width:${star}%;">★★★★★</span>
								</span></td>
								<td>
									<p>${r.content }</p>
									<p>${r.wrDt }</p>
								</td>
								<td>
								<c:if test="${sessionId eq r.UId }">
									<button type="button" class='btn' id="delBtn"
										onclick="deleteReply(${r.mvReNo })">삭제</button></c:if>
								</td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

</body>

<script>

let sd = $("#hd").val();
console.log(sd);

let sdStr = sd.substr(0,10);
console.log(sdStr);

$("#startD").append("개봉: " + sdStr);


const drawStar = (target) => {
    document.querySelector('.star span').style.width = (target.value * 10)+"%";
    let starValue = document.querySelector('#starValue');
    console.log(starValue.value);
    star.value=starValue.value;
};


//댓글 입력
function aJaxCall() {
    $.ajax({
       url : "movieReplyInsert.do",
       type : "post",
       data : {"UId" : "${sessionId}", "docId" : "${movie.docId}","content" : $("#content").val(),"star" : $("#star").val()},
       dataType : "text",
       success : function(data){
          console.log(data);
        if(data == "success"){
        	swal("", "댓글 입력이 완료되었습니다!", "success");
        	$(".swal-button--confirm").on("click", function(){
        		location.reload();
        	});
        }else{
        	swal("", "댓글 입력을 실패했습니다!", "error");
           location.reload();
        }
       }
    });
 }
//댓글 삭제
function deleteReply(no){
   $.ajax({
      url:"movieReplyDelete.do",
      type:"post",
      data:{"mvReNo":no},
      dataType:"text",
      success:function(data){
          console.log(data);
           if(data == "success"){
        	   swal("", "댓글 삭제가 완료되었습니다!", "success");
              console.log($('#delBtn').parent().parent().remove());
           }else{
        	   swal("", "댓글 삭제를 실패했습니다!", "error");
           }
      }
   });
}
//filecd가 여러개 잇는 값 자르기
let fileCd="${movie.fileCd}";

console.log(fileCd);
let poster1 = $(".poster1");
console.log(poster);
// for (var i = 0; i < fileCd.length; i++) {
	let splitCd=fileCd.split('|');
	console.log(splitCd[0]);
	console.log(splitCd[0].slice(0,3));
	console.log(splitCd.slice(0,8));
	if(splitCd[0].slice(0,3)=='htt'){
		poster1.attr('src', splitCd[0]);
	} else if(splitCd[0].slice(0,3)=='res'){
		poster1.attr('src',splitCd[0]);
	} else if(splitCd.indexOf('|') == -1){
		poster1.attr('src','/upload/' + $("#renames1").val());
	} else{
		poster1.attr('src', 'resources/yedamticket.png');
	}
// }

</script>
</html>
