<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="section section-team text-center">
      <div class="container">
        <h2 class="title">멤버십 안내</h2>
        <p class="category text-default">저희 <b style="color: red">Yedam Ticket</b> 고객님께 제공하는 멤버십 고객 등급 제도입니다.</p>
        <p class="category text-default">고객님의 <b class="category text-primary">월 결제내역</b>에 따라 고객등급이 산정됩니다.</p>
        <div class="team">
          <div class="row">
            <div class="col-md-4">
              <div class="team-player">
                <img src="resources/membership/img/membershipImg.png" alt="membership Image" class="rounded-circle img-fluid img-raised">
                <h4 class="title" style="color: red">VVIP</h4>
                <p class="category text-danger">월 20만원 이상 결제하신 고객님</p>
                <p class="category text-primary">공연할인 혜택</p> <hr color="#cfccc6">
                <p class="category text-default"><b style="color: red">VVIP</b>등급의 고객님께서는 멤버쉽이 유지되는 동안 <b class="category text-primary">30%의 공연할인 혜택</b>을 받으실 수 있습니다</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="team-player">
                <img src="resources/membership/img/membershipImg.png" alt="membership Image" class="rounded-circle img-fluid img-raised">
                <h4 class="title" style="color: purple">VIP</h4>
                <p class="category text-danger">월 15만원 이상 결제하신 고객님</p>
                <p class="category text-primary">공연할인 혜택</p> <hr color="#cfccc6">
                <p class="category text-default"><b style="color: purple">VIP</b>등급의 고객님께서는 멤버쉽이 유지되는 동안 <b class="category text-primary">20%의 공연할인 혜택</b>을 받으실 수 있습니다</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="team-player">
                <img src="resources/membership/img/membershipImg.png" alt="membership Image" class="rounded-circle img-fluid img-raised">
                <h4 class="title" style="color: gold">GOLD</h4>
                <p class="category text-danger">월 10만원 이상 결제하신 고객님</p>
                <p class="category text-primary">공연할인 혜택</p> <hr color="#cfccc6">
                <p class="category text-default"><b style="color: gold">GOLD</b>등급의 고객님께서는 멤버쉽이 유지되는 동안 <b class="category text-primary">10%의 공연할인 혜택</b>을 받으실 수 있습니다</p>
              </div>
            </div>
            <c:if test="${not empty sessionId }">
	            <div style="width: 100%">
	            	<a type="button" class="btn btn-primary" href="userPointList.do" id="payHistory">나의 결제내역</a>
	            </div>
            </c:if>
          </div> 
        </div>
      </div>
    </div>
</body>
</html>