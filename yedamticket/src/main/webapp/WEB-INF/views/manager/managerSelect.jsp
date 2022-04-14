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
            <h4 class="card-title">상세페이지</h4>
            <form class="forms-sample" action="managerUpdate.do" method="post">
               <div class="form-group">
                  <label for="exampleInputUsername1">ID</label> <input type="text"
                     class="form-control" id="MId" name="MId" readonly="readonly" value="${mana.MId }">
               </div>
               
               <div class="form-group">
                  <label for="exampleInputEmail1">Password</label> <input
                     type="password" class="form-control" id="pwd" name="pwd" value="${mana.pwd }" readonly="readonly">
               </div>
               
               <div class="form-group">
                  <label for="exampleInputUsername1">Name</label> <input type="text"
                     class="form-control" id="name" name="name" value="${mana.name }" readonly="readonly">
               </div>
               <c:if test="${sessionId eq 'micol'}">
               <div class="form-group">
                  <label for="exampleInputUsername1">Depart</label> <input
                     type="text" class="form-control" id="depart" value="${mana.depart }" name="depart">
               </div>
               </c:if>
               <c:if test="${sessionId ne 'micol'}">
               <div class="form-group">
                  <label for="exampleInputUsername1">Depart</label> <input
                     type="text" class="form-control" id="depart" value="${mana.depart }" name="depart" readonly="readonly">
               </div>
               </c:if>
               <div class="form-group">
                  <label for="exampleInputUsername1">Phone</label> <input
                     type="text" class="form-control" id="phone" name="phone"
                     placeholder="Mobile number" value="${mana.phone }" readonly="readonly">
               </div>
               
               <div class="form-group">
                  <label for="exampleInputMobile">AuthCode</label>
                  <div class="input-group-prepend">
                  	<c:if test="${sessionId eq 'micol'}">
	                     <select name="authCd" id="selectedval" data-auth="${mana.authCd }" class="col-md-6">
	                        <option value="movie" <c:if test="${mana.authCd=='movie'}"> selected</c:if>> 영화담당자</option>
	                        <option value="consert" <c:if test="${mana.authCd=='consert'}"> selected</c:if>> 공연담당자</option>
	                        <option value="goods" <c:if test="${mana.authCd=='goods'}"> selected</c:if>> 굿즈담당자 </option>
	                     </select>
                     </c:if>
                     <c:if test="${sessionId ne 'micol'}">
	                     <select name="authCd" id="selectedval" data-auth="${mana.authCd }" class="col-md-6" disabled="disabled">
	                        <option value="movie" <c:if test="${mana.authCd=='movie'}"> selected</c:if>> 영화담당자</option>
	                        <option value="consert" <c:if test="${mana.authCd=='consert'}"> selected</c:if>> 공연담당자</option>
	                        <option value="goods" <c:if test="${mana.authCd=='goods'}"> selected</c:if>> 굿즈담당자 </option>
	                     </select>
                     </c:if>
                  </div>
               </div>
                  <button type="submit" class="btn btn-gradient-primary me-2">UPDATE</button>
            </form>
            
            <div>
            	<button style="margin-right:7px;" class="btn btn-gradient-primary me-2" onclick="location.href='managerDelete.do?MId=${mana.MId}'">DELETE</button>
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-gradient-primary me-2" onclick="location.href='manager.do'">Cancel</button>
            </div>
            
         </div>
      </div>
   </div>
   
   <script type="text/javascript">
   		
   		/* $("#defaults").on('click', function(){
   			location.href='managerdelete.do?MId='+ ${mana.MId};
   			console.log(${mana.MId});
   		}); */
   
   </script>

</body>
</html>