<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      .item-wrap {
        max-width: 80%;
        margin: 0 auto;
      }
      .item-wrap .items {
        /* 자식들을 감싸고 있는 부모 */
        display: block;
        position: relative; /* 자식들의 기준점이 되기 위해 준 속성*/
        height: 30rem;
      }
      .item-wrap .items .item {
        /* 나란히 배치할 영역 */
        position: absolute;
        left: 0;
        width: 50%;
        height: 100%;
        text-align: center;
      }
      .item-wrap .items .item.left {
        padding-right: 5px;
      }
      .item-wrap .items .item.right {
        padding-left: 5px;
      }
      .item-wrap .items .item + .item {
        left: 50%; /* 다음에 올 영역에 left: 50%;을 사용해 나란히 배치 */
      }
      .item-wrap .items .item .inner {
        /* 나란히 배치할 영역 안 텍스트를 감싼 div */
        position: relative;
        height: 100%;
      }
      .item-wrap .items .item .inner:before {
        /* 텍스트를 수직 가운데 정렬하기 위한 가상선택자 */
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 0;
        height: 100%;
      }
      .item-wrap .items .item .inner span {
        /* 가상선택자와 나란히 배치하기 위해 준 속성 */
        position: absolute;
        top: 50%;
        left: 50%;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        word-break: break-all;
      }

	  .inner{
	  	height : 100%;
	  }
	
	  #lfrm{
	  	height : 100%;
	  }
	
		#rfrm{
	  	height : 100%;
	  }
	
      .button-48 {
        appearance: none;
        background-color: #ffffff;
        border-width: 0;
        box-sizing: border-box;
        color: #000000; /* 글자색깔 */
        cursor: pointer;
        display: inline-block;
        font-family: Clarkson, Helvetica, sans-serif;
        font-size: 44px;
        font-weight: 500;
        letter-spacing: 0;
        line-height: 1em;
        margin: 0;
        opacity: 1;
        outline: 0;
        padding: 1.5em 2.2em;
        position: relative;
        text-align: center;
        text-decoration: none;
        text-rendering: geometricprecision;
        text-transform: uppercase;
        transition: opacity 300ms cubic-bezier(0.694, 0, 0.335, 1),
          background-color 100ms cubic-bezier(0.694, 0, 0.335, 1),
          color 100ms cubic-bezier(0.694, 0, 0.335, 1);
        user-select: none;
        -webkit-user-select: none;
        touch-action: manipulation;
        vertical-align: baseline;
        white-space: nowrap;
        width: 100%;
        height: 100%;
        border: 1px solid black;
      }
      .button-48:before {
        animation: opacityFallbackOut 0.5s step-end forwards;
        backface-visibility: hidden;
        background-color: #ebebeb; /*채워지는 색*/
        clip-path: polygon(-1% 0, 0 0, -25% 100%, -1% 100%);
        content: "";
        height: 100%;
        left: 0;
        position: absolute;
        top: 0;
        transform: translateZ(0);
        transition: clip-path 0.5s cubic-bezier(0.165, 0.84, 0.44, 1),
          -webkit-clip-path 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
        width: 100%;
      }
      .button-48:hover:before {
        animation: opacityFallbackIn 0s step-start forwards;
        clip-path: polygon(0 0, 101% 0, 101% 101%, 0 101%);
      }
       .button-48:after {
        background-color: #FFFFFF;
      } 
      
      .button-48 span {
        z-index: 1;
        position: relative;
      }
      
      #btnl:before{
      	background-color:#aee2c2;
      }
      
      #btnr:before{
      	background-color:#bdbdef;
      }
      
    </style>
  </head>
  <body>
  	<h1>티켓 양도</h1>
  	
    <div class="item-wrap">
      <div class="items">
        <div class="item left">
          <div class="inner">
          	<form id="lfrm" action="ticketassignment_personal_1.do" method="POST">
		  	<input name="name" type="hidden" value="${name }">
		  	<input name="date" type="hidden" value="${date }">
		  	<input name="PReservNo" type="hidden" value="${PReservNo }">
		  	<input name="seatNo" type="hidden" value="${seatNo }">
		  	<input name="loc" type="hidden" value="${loc }">
		  	<input name="price" type="hidden" value="${price }">
	  	  	<button id="btnl" class="button-48" role="button" onclick="submitleft();" style="background-color:#9adbb36b">
            <span class="text">개인 거래</span>
            </button>
	  	  	</form>
          </div>
        </div>
        
        <div class="item right">
          <div class="inner">
          <form id="rfrm" action="ticketassignment_market_1.do" method="POST">
		  	<input name="name" type="hidden" value="${name }">
		  	<input name="date" type="hidden" value="${date }">
		  	<input name="PReservNo" type="hidden" value="${PReservNo }">
		  	<input name="seatNo" type="hidden" value="${seatNo }">
		  	<input name="loc" type="hidden" value="${loc }">
		  	<input name="price" type="hidden" value="${price }">
	  	  	<button id="btnr" class="button-48" role="button" onclick="submitright();" style="background-color:#E6E6FA">
              <span class="text">자유 거래</span>
            </button>
	  	  	</form>
          </div>
        </div>
      </div>
    </div>
    
    <script>
    function submitleft(){
    	$('#lfrm').submit();
    }
    
    function submitright(){
    	$('#lfrm').submit();
    }
    </script>
    
  </body>
</html>
	
	
	
