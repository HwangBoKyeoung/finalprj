<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	font-weight: bold;
	font-family: fantasy;
}

.rPoster {
    width: 300px;
    height: 390px;																																																	
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	${search}
	<input type="hidden" name="search" id="search" value="${search}">
	<%-- <input type="hidden" name="searchName" id="searchName" value="${searchName }"> --%>
	<%--    <table class="table">
      <thead>
         <tr>
            <th scope="col">제목</th>
            <th scope="col">배우</th>
            <th scope="col">줄거리</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${searchName }" var="sN">
            <tr>
               <td>${sN.name}</td>
               <td>${sN.actor}</td>
               <td>${sN.content}</td>
            </tr>
            <tr>
               <td>${var.performanceVO.name}</td>
               <td>${var.performanceVO.actor}</td>
               <td>${var.performanceVO.content}</td>
            </tr>
         </c:forEach>
      </tbody>
   </table> --%>
	<div id="show"></div>
	<div class="container">
		<br>
		<br>
		<h2>전체목록</h2>
		<br>
		<div class="row">
			<c:forEach items="${searchName}" var="sN" varStatus="status">
				<div class="col-3">
					<div class="card">
						<div class="poster" id="poster">
							<%-- <input id="imgTag${status.index }" class="imgInfo" type="hidden"
								value="${sN.fileCd}"> <img id="posterA" class=""> --%>
								<input type="hidden" class="rankPoster" value="${sN.fileCd }">
								<img class="rPoster">
						</div>
						<div class="details">
							<br> <br>
							<div class="info">
								<p class="pbox">${sN.content}</p>
							</div>
						</div>
					</div>
					<p id="mname">${sN.name}</p>
					<form action="movieDetail.do" method="post">
							<div>
								<input type="hidden" name="docId" id="docId"
									value="${sN.docId }">
								<button type="submit" class="btnn">상세보기</button>
							</div>
						</form>
				</div>
			</c:forEach>
			<c:forEach items="${searchName2}" var="sN" varStatus="status">
				<div class="col-3">
					<div class="card">
						<div class="poster" id="poster">
							<%-- <input id="imgTag${status.index }" class="imgInfo" type="hidden"
								value="${sN.fileCd}"> <img id="posterA" class=""> --%>
								<input type="hidden" class="rankPoster" value="${sN.fileCd }">
								<img class="rPoster">
						</div>
						<div class="details">
							<br> <br>
							<div class="info">
								<p class="pbox">${sN.content}</p>
							</div>
						</div>
					</div>
					<p id="mname">${sN.name}</p>
					<form action="pBookingForm.do" method="post">
							<div>
								<input type="hidden" name="PNo" id="PNo"
									value="${sN.PNo }">
								<button type="submit" class="btnn">예매</button>
							</div>
						</form>
				</div>
			</c:forEach>
		</div>
		<c:if test="${empty searchName }">
			<tr>
				<td>검색된 아이템이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${empty searchName2 }">
			<tr>
				<td>검색된 아이템이 없습니다.</td>
			</tr>
		</c:if>
	</div>

	<script>
		
		  /*  $.ajax({
		      url: "ajaxFileCd.do",
		      type: "post",
		      data: {"searchName":$("#search").val()},
		      dataType: "json",
		      success: function(result){
		//              console.log(result);
		//              console.log(result.fileCd);
		         let img = $("<img>"); 
		         $.each(result, function(idx, item){
		            let a = '';
		            let data = item.fileCd;
		            
		            if(data=='' || data == null){
		               a = data;
		               $("#imgTag").attr("src", "resources/yedamticket.png");
		            } else{
		               a = data.split('|');
		               let b = a[0];
		               $("#imgTag").attr("src", b);
		            }
		         });
		      }
		   }); */
		 
		 
		 
		/* $('.imgInfo').each(function(index, item) {
			var data = item.value;
			var imgId = item.id;
			if (data == '' || data == null) {
				$("#" + imgId).next().attr("src", "resources/yedamticket.png");
			} else {
				var dataAry = data.split('|');
				let img = dataAry[0];
				$("#" + imgId).next().attr("src", img);
			}
		}); */
		
		 ///박스오피스 포스터 filecd자르기
		 let fileCd=document.getElementsByClassName('rankPoster');
		 let rPoster=document.getElementsByClassName('rPoster');
		 console.log(fileCd);
		    for(var i =0;i<fileCd.length;i++){
		    	
		    	if(fileCd[i].defaultValue == null || fileCd[i].defaultValue == ''){
		          rPoster[i].setAttribute('src','resources/yedamticket.png');
		    		 console.log(fileCd[i]);
		         }else{
		            var split=(fileCd[i].defaultValue).split('|');
		            rPoster[i].setAttribute('src',split[0]);   
		         }
		    }
		//

		
	</script>
</body>
</html>