<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile"><a href="#" class="nav-link">
                <div class="nav-profile-image">
                  <img src="resources/managers/assets/images/faces/face1.jpg" alt="profile"> <span
                    class="login-status online"></span>
                </div>
                <div class="nav-profile-text d-flex flex-column">
                  <span class="font-weight-bold mb-2">David Grey. H</span> 
                  <span class="text-secondary text-small">Project Manager</span>
                </div> <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a></li>
            <li class="nav-item"><a class="nav-link" href="homeM.do">
                <span class="menu-title">Admin Home</span> 
                <i class="mdi mdi-home menu-icon"></i>
            </a></li>
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
              aria-controls="ui-basic"> 
              <span class="menu-title">MOVIE</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-chart-areaspline"></i>
            </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="movie.do">Management</a></li>
                  <li class="nav-item"><a class="nav-link" href="sales.do">Sales</a></li>
                  <li class="nav-item"><a class="nav-link" href="popularitychart.do">Popularity Chart</a></li>
                </ul>
              </div></li>
            <li class="nav-item"><a class="nav-link" href="goods.do"> <span class="menu-title">Goods</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a></li>
            <li class="nav-item"><a class="nav-link" href="consert.do"> <span class="menu-title">Consert</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a></li>
            <li class="nav-item"><a class="nav-link" href="inquiry.do"> <span class="menu-title">Inquiry</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a></li>            
            <li class="nav-item"><a class="nav-link" data-bs-toggle="collapse" href="#general-pages"
              aria-expanded="false" aria-controls="general-pages"> 
              <span class="menu-title">Member</span> <i class="menu-arrow"></i> 
              <i class="mdi mdi-account"></i>
            </a>
              <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link"
                    href="user.do"> User </a></li>
                  <li class="nav-item"><a class="nav-link"
                    href="company.do"> Company </a></li>
                  <li class="nav-item"><a class="nav-link"
                    href="admin.do"> Admin </a></li>
                  </ul>
              </div></li>
            <li class="nav-item sidebar-actions"><span class="nav-link">
                <div class="border-bottom">
                  <h6 class="font-weight-normal mb-3">Projects</h6>
                </div>
                <button class="btn btn-block btn-lg btn-gradient-primary mt-4">+
                  MY Page</button>
                <div class="mt-4">
                  <div class="border-bottom">
                    <p class="text-secondary">Categories</p>
                  </div>
                  <ul class="gradient-bullet-list mt-4">
                    <li>Free</li>
                    <li>Pro</li>
                  </ul>
                </div>
            </span></li>
          </ul>
        </nav>