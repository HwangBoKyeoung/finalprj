<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
 .login{
 position: relative;
 top:-15px;

  
 }
</style>
<nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent " color-on-scroll="400">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="home.do" rel="tooltip" title="Designed by 1석3조" data-placement="bottom" >
          <img width="200" src="resources/users/img/logo8.png">
        </a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar top-bar"></span>
          <span class="navbar-toggler-bar middle-bar"></span>
          <span class="navbar-toggler-bar bottom-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="./resources/img/blurred-image-1.jpg">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown">
             <i class="fa-solid fa-shop fa-2x"></i>
              <p>굿즈</p>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1">
              <a class="dropdown-item" href="cGoodsList.do">
                <i class="fa-solid fa-gift fa-2x"></i> 공연굿즈
              </a>
              <a class="dropdown-item"  href="mGoodsList.do">
               <i class="fa-solid fa-gifts fa-2x"></i>영화굿즈
              </a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown">
              <i class="fa-solid fa-film fa-2x "></i>
             영화
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1">
              <a class="dropdown-item" href="./index.html">
               <i class="fa-solid fa-ticket fa-2x"></i> 영화예매
              </a>
              <a class="dropdown-item" href="movieList.do">
                <i class="fa-solid fa-ranking-star fa-2x"></i> 박스오피스 순위
              </a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown">
             <i class="fa-solid fa-drum fa-2x "></i>공연
             
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1">
              <a class="dropdown-item" href="./index.html">
                <i class="fa-solid fa-ticket-simple fa-2x"></i> 공연예매
              </a>
              <a class="dropdown-item" target="_blank" href="https://demos.creative-tim.com/now-ui-kit/docs/1.0/getting-started/introduction.html">
               <i class="fa-solid fa-list-ul fa-2x"></i> 지역별 공연리스트
              </a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown">
              <i class="fa-solid fa-head-side-cough fa-2x "></i>
              게시판
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1">
              <a class="dropdown-item" href="./index.html">
                <i class="fa-solid fa-circle-exclamation fa-2x"></i> 공지사항
              </a>
              <a class="dropdown-item" target="_blank" href="https://demos.creative-tim.com/now-ui-kit/docs/1.0/getting-started/introduction.html">
                <i class="fa-solid fa-handshake fa-2x "></i> 양도거래
              </a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink1" data-toggle="dropdown">
              <i class="fa-solid fa-headset fa-2x"></i>
              고객센터
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink1">
              <a class="dropdown-item" href="./index.html">
                <i class="fa-regular fa-comment-dots fa-2x"></i> 상담
              </a>
              <a class="dropdown-item" target="_blank" href="https://demos.creative-tim.com/now-ui-kit/docs/1.0/getting-started/introduction.html">
                <i class="fa-regular fa-circle-question fa-2x"></i> FAQ
              </a>
            </div>
           
          </li>
       
          <li>
           <div>
           
           <a class="nav-link"  data-placement="bottom" href="login.do" target="_blank">
              <button  class="btn btn-primary btn-round login" type="button">로그인</button>
            </a>
             </div>
          </li>
            <li>
           <div>
           
           <a class="nav-link"  data-placement="bottom" href="https://twitter.com/CreativeTim" target="_blank">

            <i class="fa-solid fa-user fa-2x"></i>마이페이지  
            </a>
             </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
   <div class="wrapper">
    <div class="page-header clear-filter" >
      <div class="page-header-image" data-parallax="true" style="background-image:url('resources/users/img/love.jpg');">
      </div>
      <div class="container">
        <div class="content-center brand">
          
          <h1 class="h1-seo">1석3조.</h1>
          <h3>BTS 오빠들 사랑해여</h3>
        </div>
        
      </div>
    </div>
    
    </div>
</html>