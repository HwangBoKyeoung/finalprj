<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>

   .container{
      margin-top: 30px;
      margin-bottom: 150px;
   }
   
   #logo{
      text-align: center;
   }
   h2{
      font-family: 'Gowun Dodum', sans-serif;
   }
   h3{
      font-weight: bold;
      font-family: 'Gowun Dodum', sans-serif;
   }
   
   p{
      color: black;
      text-align : left;
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
  #poster{
  	width:65%;
  	box-sizing: content-box;
  }
  #reservBtn{
  margin-top: 18%
  }
  hr{
  height: 2.5px;
  background: #7a5ecf;
  }
  .table td, .table th {
    padding: 0.75rem;
    vertical-align: middle;
    border-bottom : 2px solid #dee2e6;
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
   <div class="container">
      <div class="row">
         <div class="col-lg-6"><br>
            <div id="logo">
               <img id="poster">
            </div>
         </div>
         <div class="col-lg-6">
            <br><div id="detail">
               <h3>${movie.name }</h3>
               <hr>
               <p>감독:${movie.director }</p>
               <p>배우:${movie.actor }</p>
               <p>장르:${movie.genre }</p>
               <p id="startD"><input type="hidden" value="${movie.startDate}" id="hd" name="hd"></p>
              
               <fmt:formatNumber var="starFloat" value="${star.star/20}" pattern="#.#"/>
               <fmt:formatNumber var="starAvg" value="${star.star}" pattern="#.#"/>
               <p>평점:
               
               <span class="starAvg">
              ★★★★★
              <span style="width:${starAvg}%;" >★★★★★</span>           
            </span>(${starFloat})
            </p>
               <button id="reservBtn" class="btn btn-lg" style="background:#cfc5e9;">예매하기</button>
            </div>
         </div>
         <div class="col-lg-12" style="padding-top: 50px; text-align: center;">
            <hr>
            <h2><ins>줄거리</ins></h2> <br>
            <p style="text-align: center;">${movie.content }</p>
            <br><hr><br>
            <h2><ins>트레일러/예고편</ins></h2>
            <div id="tabMenu" style="padding-top:30px;">
               <iframe width="80%" height="500" src="https://www.youtube.com/embed/qhKCYXSHpWY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
         </div>
         <div class="col-lg-12" style="padding-top: 50px; text-align: center;">
            <hr>
            <div id="contents" style="padding-top: 50px;">
               <div id="links">
                  <div id="comment">
                     <form>
                       <span class="star">
                    ★★★★★
                    <span>★★★★★</span>
                    <input type="range" id="starValue" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                </span>
                </form>
                <form>
                         <input type="hidden" name="star" id="star">
                        <h3><label for="content">Comments</label></h3>
                        <textarea class="form-control" style="float:left; width: 70%" rows="3" id="content" name="content" placeholder="댓글을 입력해주세요." required></textarea>
                        <button type="button" class="btn btn-lg" style="background:#cfc5e9; float:left; margin-left:53px;" onclick="aJaxCall()">입력</button>
                     </form>
                  </div>
                  
                  <div id="reply">
                  <br><br><br><br><br>
                    <table class="table">
                    <c:forEach items="${replys }" var="r">
                       <tr>
                          <td>${r.UId }</td>
                          <td>
                             <span class="star">
                          ★★★★★ 
                          <c:set var="star" value="${r.star}"/>
                          <span style="width:${star}%;">★★★★★</span>                    
                         </span>
                          </td>
                          <td>
                             <p>${r.content }</p>
                             <p>${r.wrDt }</p>
                          </td>
                          <td>
                             <button type="button" class='btn' id="delBtn" onclick="deleteReply(${r.mvReNo })">삭제</button>
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
           alert("댓글을 입력햇습니다.");
           location.reload();
        }else{
           alert("댓글입력 실패 ㅠㅠ.");
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
              alert("댓글을 삭제햇습니다.");
              console.log($('#delBtn').parent().parent().remove());
           }else{
              alert("댓글삭제 실패 ㅠㅠ.");
           }
      }
   });
}
//filecd가 여러개 잇는 값 자르기
let fileCd="${movie.fileCd}";
let splitCd=fileCd.split('|');
$('#poster').attr("src",splitCd[0]);

</script>
</html>
