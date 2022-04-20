<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
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
            <li class="nav-item"><a class="nav-link" href="homeM.do">
                <span class="menu-title">Admin Home</span> 
                <i class="mdi mdi-home menu-icon"></i>
            </a></li>
            <c:if test="${sessionAuthCd eq 'CEO'}">
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">CONFIRM</span> <i class="menu-arrow"></i> 
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
              <span class="menu-title">MOVIE</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerMovieDeleteList.do">Management</a></li>
                  <li class="nav-item"><a class="nav-link" href="movieSalesChart.do">Sales</a></li>
                  <li class="nav-item"><a class="nav-link" href="moviePopularitychart.do">Popularity Chart</a></li>
                </ul>
              </div></li>
              <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">Performance</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerPerforDeleteList.do">Management</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforSalesChart.do">Sales</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforpopularitychart.do">Popularity Chart</a></li>
                </ul>
              </div></li>
             </c:if> 
            <c:if test="${sessionAuthCd eq 'movie'}">
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">CONFIRM</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="movieConfirmList.do">영화승인요청</a></li>
                </ul>
              </div></li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">MOVIE</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerMovieDeleteList.do">Management</a></li>
                  <li class="nav-item"><a class="nav-link" href="movieSalesChart.do">Sales</a></li>
                  <li class="nav-item"><a class="nav-link" href="moviePopularitychart.do">Popularity Chart</a></li>
                </ul>
              </div></li>
             </c:if> 
             <c:if test="${sessionAuthCd eq 'performance'}">
             <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">CONFIRM</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="perforSalesChart.do">공연승인요청</a></li>
                </ul>
              </div></li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">Performance</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerPerforDeleteList.do">Management</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforSalesChart.do">Sales</a></li>
                  <li class="nav-item"><a class="nav-link" href="perforpopularitychart.do">Popularity Chart</a></li>
                </ul>
              </div></li>
              </c:if>
             <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">Inquiry</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="managerInquiryList.do">Inquiry</a></li>
                  <li class="nav-item"><a class="nav-link" href="managerFaq.do">FAQ</a></li>
                   <li class="nav-item"><a class="nav-link" href="managerNotice.do">Notice</a></li>
                </ul>
              </div></li>           

            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#general-pages"
              aria-expanded="false" aria-controls="general-pages"> 
              <span class="menu-title">Member</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-account"></i>
            </a>
              <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link"
                    href="managerUser.do"> User </a></li>
                  <li class="nav-item"><a class="nav-link"
                    href="managerCompany.do"> Company </a></li>
                  <li class="nav-item"><a class="nav-link"
                    href="manager.do"> Manager </a></li>
                  </ul>
              </div></li>
          </ul>
        </nav>
