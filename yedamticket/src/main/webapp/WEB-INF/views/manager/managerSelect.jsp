<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/users/js/core/jquery.min.js" type="text/javascript"></script>
</head>
<style>
	button{
		float: left;
	}
</style>
<body>
<div class="col-md-6 grid-margin stretch-card">
      <div class="card">
         <div class="card-body">
            <h4 class="card-title" style="font-size: 40px;">관리자 정보</h4><br>
            <form class="forms-sample" action="managerUpdate.do" method="post">
               <div class="form-group">
               	<c:if test="${sessionId eq mana.MId}">
                  <label for="exampleInputUsername1">아이디</label> <input type="text"
                     class="form-control" id="MId" name="MId" value="${mana.MId }">
                </c:if>
                <c:if test="${sessionId ne mana.MId}">
                  <label for="exampleInputUsername1">아이디</label> <input type="text"
                     class="form-control" id="MId" name="MId" readonly="readonly" value="${mana.MId }">
                </c:if>
               </div>
               
               <div class="form-group">
                  <label for="exampleInputEmail1">비밀번호</label> <input
                     type="password" class="form-control" id="pwd" name="pwd" readonly="readonly">
               </div>
               
               <div class="form-group">
               <c:if test="${sessionId eq mana.MId}">
                  <label for="exampleInputUsername1">이름</label> <input type="text"
                     class="form-control" id="name" name="name" value="${mana.name }">
               </c:if>
               <c:if test="${sessionId ne mana.MId}">
                  <label for="exampleInputUsername1">이름</label> <input type="text"
                     class="form-control" id="name" name="name" readonly="readonly" value="${mana.name }">
               </c:if>
               </div>
               <c:if test="${sessionId eq 'micol'}">
               <div class="form-group">
                  <label for="exampleInputUsername1">부서</label> <input
                     type="text" class="form-control" id="depart" value="${mana.depart }" name="depart">
               </div>
               </c:if>
               <c:if test="${sessionId ne 'micol'}">
               <div class="form-group">
                  <label for="exampleInputUsername1">부서</label> <input
                     type="text" class="form-control" id="depart" value="${mana.depart }" name="depart" readonly="readonly">
               </div>
               </c:if>
               <div class="form-group">
                  <label for="exampleInputUsername1">전화번호</label> <input
                     type="text" class="form-control" id="phone" name="phone"
                     placeholder="Mobile number" value="${mana.phone }" readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="exampleInputMobile">권한</label>
                  <div class="input-group-prepend">
                  	<c:if test="${sessionDp eq '대표'}">
	                     <select name="authCd" id="selectedval" data-auth="${mana.authCd }" class="col-md-6">
	                        <option value="movie" <c:if test="${mana.authCd=='movie'}"> selected</c:if>> 영화담당자</option>
	                        <option value="performance" <c:if test="${mana.authCd=='performance'}"> selected</c:if>> 공연담당자</option>
	                     </select>
                     </c:if>
                     <c:if test="${sessionDp ne '대표'}">
	                     <select name="authCd" id="selectedval" data-auth="${mana.authCd }" class="col-md-6" disabled="disabled">
	                        <option value="movie" <c:if test="${mana.authCd=='movie'}"> selected</c:if>> 영화담당자</option>
	                        <option value="performance" <c:if test="${mana.authCd=='performance'}"> selected</c:if>> 공연담당자</option>
	                     </select>
                     </c:if>
                  </div>
               </div>
                  <button type="submit" class="btn btn-gradient-primary me-2">수정</button>
            </form>
            
            <div>
            	<c:if test="${sessionDp eq '대표'}">
            	<button style="margin-right:7px;" class="btn btn-gradient-primary me-2" onclick="location.href='managerDelete.do?MId=${mana.MId}'">삭제</button>
            	</c:if>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-gradient-primary me-2" onclick="location.href='manager.do'">취소</button>
            </div>
            
         </div>
      </div>
   </div>

</body>
</html>