<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/users/css/practice.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#logo{
	    width: 80%;
	    margin: 50px 50px 0 33px;
}
</style>
</head>
<body id="searchShow">
<nav class="sidebar sidebar-offcanvas" id="sidebar">
		<div class="navbar-translate" id="titleLogo"
			style="width: 100%;">
			<a class="navbar-brand" href="managerSelet.do?MId=${sessionId }" title="Designed by 1석3조"
				data-placement="bottom"> <img width="50%"
				src="resources/users/img/YDTICKET.png" id="logo"></a>
          <ul class="nav">
            <li class="nav-item nav-profile"><a href="managerSelet.do?MId=${sessionId }" class="nav-link">
                <div class="nav-profile-image">
                  <img src="resources/managers/assets/images/faces/face1.jpg" alt="profile"> <span
                    class="login-status online"></span>
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2">${sessionId }</span>
                  <span class="text-secondary text-small">${sessionDp } / ${sessionAuthCd }</span>
                </div> <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a></li>
            
            <c:if test="${sessionAuthCd eq 'CEO'}">
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">승인 요청</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="movieConfirmList.do">영화승인요청</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforConfirmList.do">공연승인요청</a></li>
                  <li class="nav-item"><a class="nav-link" href="goodsConfirmList.do">굿즈승인요청</a></li>
                </ul>
              </div></li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">영화</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerMovieDeleteList.do">삭제 요청</a></li>
                  <li class="nav-item"><a class="nav-link" href="movieSalesChart.do">일일 매출</a></li>
                  <li class="nav-item"><a class="nav-link" href="moviePopularitychart.do">TOP10 인기순위</a></li>
                </ul>
              </div></li>
              <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">공연</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerPerforDeleteList.do">삭제 요청</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforSalesChart.do">일일 매출</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforpopularitychart.do">TOP10 인기순위</a></li>
                </ul>
              </div></li>
             </c:if> 
            <c:if test="${sessionAuthCd eq 'movie'}">
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">승인 요청</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="movieConfirmList.do">영화 승인 요청</a></li>
                </ul>
              </div></li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">MOVIE</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerMovieDeleteList.do">삭제 요청</a></li>
                  <li class="nav-item"><a class="nav-link" href="movieSalesChart.do">일일 매출</a></li>
                  <li class="nav-item"><a class="nav-link" href="moviePopularitychart.do">TOP10 인기순위</a></li>
                </ul>
              </div></li>
             </c:if> 
             <c:if test="${sessionAuthCd eq 'performance'}">
             <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">승인 요청</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="perforSalesChart.do">공연 승인 요청</a></li>
                </ul>
              </div></li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">Performance</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerPerforDeleteList.do">삭제 요청</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforSalesChart.do">일일 매출</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforpopularitychart.do">TOP10 인기순위</a></li>
                </ul>
              </div></li>
              </c:if>
             <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">게시판</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerInquiryList.do">1:1 문의</a></li>
                  <li class="nav-item"><a class="nav-link" href="managerFaq.do">FAQ</a></li>
                   <li class="nav-item"><a class="nav-link" href="managerNotice.do">공지사항</a></li>
                </ul>
              </div></li>           

            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#general-pages"
              aria-expanded="false" aria-controls="general-pages"> 
              <span class="menu-title">사용자</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-account"></i>
            </a>
              <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link"
                    href="managerUser.do"> 일반 회원 </a></li>
                  <li class="nav-item"><a class="nav-link"
                    href="managerCompany.do"> 기업 회원 </a></li>
                  <li class="nav-item"><a class="nav-link"
                    href="manager.do"> 관리자 </a></li>
                  </ul>
              </div></li>
          </ul>
        </div>
        </nav>
</body>
</html>