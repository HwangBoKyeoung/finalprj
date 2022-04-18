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
<style>

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
              
               <fmt:formatNumber var="starFloat" value="${star.star/10}" pattern="#.#"/>
               <fmt:formatNumber var="starAvg" value="${star.star}" pattern="#.#"/>
               <p>평점:
               
               <span class="starAvg">
              ★★★★★
              <span style="width:${starAvg}%;" >★★★★★</span>           
            </span>(${starFloat})
            </p>
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
                       <span class="star">
                    ★★★★★
                    <span>★★★★★</span>
                    <input type="range" id="starValue" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
                </span>
                </form>
                <form>
                         <input type="hidden" name="star" id="star">
                        <h3><label for="content">Comments</label></h3>
                        <textarea class="form-control" style="float:left; width: 80%" rows="5" id="content" name="content" placeholder="댓글을 입력해주세요."></textarea>
                        <button type="button" class="btn btn-lg" style="background:#cfc5e9; float:left; margin-left:93px;" onclick="aJaxCall()">입력</button>
                     </form>
                  </div>
                  
                  <div id="reply">
                    <table border="1">
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
                             ${r.content }
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
      <sec:csrfInput /> 
</body>

<script>
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
       data : {"UId" : "enc1115", "docId" : "${movie.docId}","content" : $("#content").val(),"star" : $("#star").val()},
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
