<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<!-- star rating -->
    <script src="https://jsuites.net/v4/jsuites.js"></script>
    <link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css" type="text/css" />
    <script src="https://jsuites.net/v4/jsuites.webcomponents.js"></script>
<link rel="stylesheet" href="resources/table/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/table/css/style.css">
<style>
/* * {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}

#container {
   margin: 0 auto;
   width: 1200px;
}

head {
   width: 100%;
   height: 100px;
}

#logo {
   float: left;
   width: 300px;
   height: 300px;
}

#detail {
   float: right;
   width: 900px;
   height: 300px;
}

#slideShow {
   clear: both;
   width: 100%;
   height: 300px;
   overflow: hidden;
   position: relative;
}

#contents {
   width: 100%;
   height: 300px;
}

#tabMenu {
   float: left;
   width: 600px;
   height: 100%;
}

#links {
   float: right;
   width: 600px;
   height: 100%;
}

#logo>img {
   width: 300px;
   height: 300px;
} */

   .container{
      margin-top: 30px;
      margin-bottom: 150px;
   }
   
   #logo{
      text-align: center;
   }
   
   h3{
      font-weight: bold;
   }
   
   p{
      color: black;
   }
   
</style>

</head>

<body>

   <div class="container">
      <div class="row">
         <div class="col-lg-6">
            <div id="logo">
               <img id="poster">
            </div>
         </div>
         <div class="col-lg-6">
            <div id="detail">
               <h3>${movie.name }</h3>
               <hr>
               <p>감독:${movie.director }</p>
               <p>배우:${movie.actor }</p>
               <p>장르:${movie.genre }</p>
               <p>개봉:${movie.startDate }</p>
               <button class="btn btn-lg" style="background:#cfc5e9;">예매하기</button>
            </div>
         </div>
         <div class="col-lg-12" style="padding-top: 50px; text-align: center;">
            <hr>
            <div id="tabMenu" style="padding-top:30px;">
               <iframe width="800" height="500" src="https://www.youtube.com/embed/qhKCYXSHpWY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
         </div>
         <div class="col-lg-12" style="padding-top: 50px; text-align: center;">
            <hr>
            <div id="contents" style="padding-top: 50px;">
               <div id="links">
                  <div id="comment">
                     <form>
                        <jsuites-rating id="starsrating" value="0" tooltip="Ugly, Bad, Average, Good, Outstanding"></jsuites-rating>
                         <input type="hidden" name="star" id="star">
                        <h3><label for="content">Comments</label></h3>
                        <textarea class="form-control" style="float:left; width: 80%" rows="5" id="content" name="content" placeholder="댓글을 입력해주세요."></textarea>
                        <button type="button" class="btn btn-lg" style="background:#cfc5e9; float:left; margin-left:93px;" onclick="aJaxCall()">입력</button>
                     </form>
                  </div>
                  
                  <div id="reply">
                     <%-- <c:if test="${empty replys }">
                     <div>등록된 댓글이없어요</div>
                      <table class="table table-hover" id = "rtable" border = "1"></table>
                     </c:if> --%>
                     <c:if test="${not empty replys }">
                     
                     <table class="table table-hover" id = "rtable" style="margin-top: 120px;">
                        <c:forEach items="${replys}" var="reply">
                           <tr>
                              <td width="20%">${reply.UId}</td>
                              <td width="20%"> <jsuites-rating value=${reply.star }></jsuites-rating></td>
                                    <td width = "400">${reply.content }</td>
                                    <td width = "45 " align = "center">
                                       <button type="button" class="btn btn-primary" onclick="deleteReply(${reply.mvReNo})">삭제</button>
                                    </td>
                                  </tr>
                        </c:forEach>
                     </table>
                     </c:if>
                  </div>
               </div>
            </div>
         </div>
      </div>

      
      </div>
</body>

<script>
let star=$("<jsuites-rating value=4></jsuites-rating>");
//filecd가 여러개 잇는 값 자르기
   let fileCd="${movie.fileCd}";
   console.log(fileCd);
   let splitCd=fileCd.split('|');
   console.log(splitCd[0]);
   $('#poster').attr("src",splitCd[0]);
//ratingstar
 document.querySelector('jsuites-rating').addEventListener('onchange', function(e) {
    document.getElementById('star').value = this.value;
}); 
function aJaxCall() {
    $.ajax({
       url : "movieReplyInsert.do",
       type : "post",
       data : {"UId" : "enc1115", "docId" : "${movie.docId}","content" : $("#content").val(),"star" : $("#star").val()},
       dataType : "json",
       success : function(data){
    	 console.log(data);
         htmlConvert(data);
         $("#content").val('');
       }
    });
 } 
 
 function htmlConvert(data) {
   let tr=document.createElement('tr');
   $("#rtable").empty();
   $.each(data, function(idx, item){
      console.log(item.content);
      
      let tr = $("<tr>");
      tr.append(
         $("<td>").attr("width", "20%").text(item.UId),
         $("<td>").attr("width", "20%").append(
            $("<jsuites-rating value='"+item.star+"'>")   
         ).addClass("star"),
         $("<td>").attr("width", "400").text(item.content),
         $("<td>").attr({
            "width" : "45px",
            "align" : "center"
         }).append(
            $("<button>").addClass("btn btn-primary").attr("onclick","deleteReply("+item.mvReNo+")").text("삭제")
         )
      );
      $('#rtable').append(tr);
   });
   
  
 }
function deleteReply(n){ // 전달받은 replyId
   let btn = $(event.target);
   console.log(btn);
    $.ajax({
       url : "movieReplyDelete.do",
       type : "post",
       data : {"mvReNo" : n},
       async : false, // 전역변수를 동기화해서 같이 사용
       dataType : "text",
       success : function(data) {
        console.log(data);
        if(data =='success'){
           /* $(event.target).parent().parent().remove(); */
           btn.parent().parent().remove();
        }
        
       }
    });
   
 }
 console.log(document.getElementsByClassName('jrating'));
</script>
</html>