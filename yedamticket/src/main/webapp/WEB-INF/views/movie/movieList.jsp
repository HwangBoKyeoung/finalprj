<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/users/css/movieList.css">
<script src="resources/users/js/movieList.js"></script>
<style>
#result {
  position: relative;
  
}
.image {
  display: block;
  width: 100%;
  height: auto;
}
figure > img{
  display: block;
  width: 100%;
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
  background-color: rgba(0,0,0,0.7);
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
#result> .card:hover .caption {
  opacity: 1;
}

</style>
</head>
<body>
<%-- <c:set var="upLoadPath" value="/upload"/> --%>
   <h1>박스오피스 순위</h1>
   <div id="result">
   
   </div>
   <h1>상영 예정작</h1>
        <div id="wrapper">
   <c:forEach items="${movies }" var="m">
       <div class="card">
       <header>
       <h3> ${m.name }</h3>
       </header><figure>
         <img src="/upload/${m.renames }" style="max-width: 100%; height: auto;" >
       </figure>
       <p>
       <span>감독: ${m.director }</span>
       <span>배우: ${m.actor }</span>
       </p>
       <p>
       <span>장르: ${m.genre } </span>
       <span>연령: ${m.rating } 상영시간: ${m.runtime }</span>
       </p>
       <p>
       <span>개봉예정일: ${m.startDate }</span>
       </p>
       </div> 
</c:forEach>
    </div>
</body>
</html>