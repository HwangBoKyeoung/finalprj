<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/84d54512c7.js"
	crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
@import url("https://fonts.googleapis.com/css?family=Nunito:400,900|Montserrat|Roboto");
body {
  background: linear-gradient(to right, #3fb6a8, #7ed386);
}

.container {
  background: #ffffff;
  width: 700px;
  height: 500px;
  margin: 0 auto;
  position: relative;
  margin-top: 10%;
  box-shadow: 2px 5px 20px rgba(119, 119, 119, 0.5);
 
  background-repeat:no-repeat;
}

.logo {
  float: right;
  margin-right: 12px;
  margin-top: 12px;
  font-family: "Nunito Sans", sans-serif;
  color: #3dbb3d;
  font-weight: 900;
  font-size: 1.5em;
  letter-spacing: 1px;
}

.CTA {
  width: 80px;
  height: 40px;
  right: -20px;
  bottom: 0;
  margin-bottom: 90px;
  position: absolute;
  z-index: 1;
  background: #7ed386;
  font-size: 1em;
  transform: rotate(-90deg);
  transition: all 0.5s ease-in-out;
  cursor: pointer;
}
.CTA h1 {
  color: #ffffff;
  margin-top: 10px;
  margin-left: 9px;
}
.CTA:hover {
  background: #3fb6a8;
  transform: scale(1.1);
}

.leftbox {
  float: left;
  top: -5%;
  left: 5%;
  position: absolute;
  width: 15%;
  height: 110%;
  background: #7ed386;
  box-shadow: 3px 3px 10px rgba(119, 119, 119, 0.5);
}

nav a {
  list-style: none;
  padding: 35px;
  color: #ffffff;
  font-size: 1.1em;
  display: block;
  transition: all 0.3s ease-in-out;
}
nav a:hover {
  color: #3fb6a8;
  transform: scale(1.2);
  cursor: pointer;
}
nav a:first-child {
  margin-top: 7px;
}

.active {
  color: #3fb6a8;
}

.rightbox {
  float: right;
  width: 60%;
  height: 100%;
}

.profile,
.payment,
.subscription,
.privacy,
.settings {
  transition: opacity 0.5s ease-in;
  position: absolute;
  width: 70%;
}

h1 {
  font-family: "Montserrat", sans-serif;
  color: #7ed386;
  font-size: 1.2em;
  margin-top: 40px;
  margin-bottom: 35px;
}

h2 {
  color: #777777;
  font-family: "Roboto", sans-serif;
  width: 80%;
  text-transform: uppercase;
  font-size: 20px;
  letter-spacing: 1px;
  margin-left: 2px;
}

p {
  border-width: 1px;
  border-style: solid;
  border-image: linear-gradient(to right, #3fb6a8, rgba(126, 211, 134, 0.5)) 1 0%;
  border-top: 0;
  width: 80%;
  font-family: "Montserrat", sans-serif;
  font-size: 0.9em;
  padding: 7px 0;
  color: #070707;
}

span {
  font-size: 0.5em;
  color: #777777;
}

.btn {
  float: right;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  font-size: 10px;
  border: none;
  color: #3fb6a8;
}

.btn:hover {
  text-decoration: underline;
  font-weight: 900;
}

input {
  border: 1px solid #dddddd;
  font-family: "Roboto", sans-serif;
  padding: 2px;
  margin: 0;
}

.privacy h2 {
  margin-top: 25px;
}

.settings h2 {
  margin-top: 25px;
}

.noshow {
  opacity: 0;
}



        
    </style>
</head>
<body>

${re }
${sch }
${user }
    <div class="container">
        <div id="logo"><h1 class="logo"><a href='goBack();'>뒤로가기</a></h1>
          <div class="CTA">
          <form action="pPay.do" method="post">
          		<!-- 구역 -->
          		<input type="hidden" id="loc" name="loc" value="${re.loc }">
          		<!-- 좌석이름 -->
          		<input type="hidden" id="seatNo" name="seatNo" value="${re.seatNo }">
          		<!-- 공연 스케쥴 넘버 -->
          		<input type="hidden" id="PSchNo" name="PSchNo" value="${re.PSchNo }">
          		<!--아이디 -->
          		<input type="hidden" id="UId" name="UId" value="micol1234">
         		<!--차감될금액-->
				<input type="hidden" id="pay" name="pay" >
				<!-- 영화인지 공연인지 코드 -->
				<input type="hidden" id="buyCtntCd" name="buyCtntCd" value="pf">
				<button type="submit" class="btn">결제하기</button>
			</form>
            </div>
        </div>
        <div class="leftbox">
          <nav>
            <a id="profile" class="active"><i class="fa fa-user"></i></a>
            <a id="payment"><i class="fa fa-credit-card"></i></a>
            <a id="subscription"><i class="fa-solid fa-tv"></i></a>
            <a id="privacy"><i class="fa fa-tasks"></i></a>
            <a id="settings"><i class="fa fa-cog"></i></a>
          </nav>
        </div>
        <div class="rightbox">
          <div class="profile noshow">
            <h1>Personal Info</h1>
            <h2>Full Name</h2>
            <p>${user.name } </p>
            <h2>Birthday</h2>
            <p>${user.birthDt }</p>
           
            <h2>Email</h2>
            <p>${user.email} <button class="btn" >update</button></p>
            <h2>Password </h2>
            <p>••••••• <button class="btn">Change</button></p>
          </div>
          
          <div class="payment noshow">
            <h1>MemberShip</h1>
            <h2>${user.membership }</h2>
            <p>${user.point }원<button class="btn">충전하러가기</button></p>
           
          </div>
      
          <div class="subscription ">
            <h1>영수증</h1>
            <h2>제목</h2>
            <h2>${sch.performanceVO.name }<button class="btn">pay now</button></h2>
            <h2>구역 </h2>
            <p>${re.loc }</p>
            <h2>좌석</h2>
            <p>${re.seatNo }</p>      
            <h2> <button class="btn">change plan</button></h2>
            <h2>가격</h2>
            <h2 id="price"><button class="btn">change plan</button></h2>
            <!--  <img src="resources/users/img/eva.jpg">-->
          </div>
      
          <div class="privacy noshow">
            <h1>Privacy Settings</h1>
            <h2>Manage Email Notifications<button class="btn">manage</button></h2>
            <p></p>
            <h2>Manage Privacy Settings<button class="btn">manage</button></h2>
            <p></p>
            <h2>View Terms of Use <button class="btn">view</button></h2>
            <p></p>
            <h2>Personalize Ad Experience <button class="btn">update</button></h2>
            <p></p>
            <h2>Protect Your Account <button class="btn">protect</button></h2>
            <p></p>
          </div>
       <div class="settings noshow">
            <h1>Account Settings</h1>
            <h2>Sync Watchlist to My Stuff<button class="btn">sync</button></h2>
            <p></p>
            <h2>Hold Your Subscription<button class="btn">hold</button></h2>
            <p></p>
            <h2>Cancel Your Subscription <button class="btn">cancel</button></h2>
            <p></p>
            <h2>Your Devices <button class="btn">Manage Devices</button></h2>
            <p></p>
           
          </div>
          
        </div>
      </div>
</body>
<script>
function goBack(){
	window.history.back();
}
(function (){
	
	let seatName='${re.seatNo }';
	let cnt=0;
	let price=${sch.performanceVO.price};
	for(var i =0;i<seatName.length;i++){
		if(i%3==0){
			cnt++;
		}
	}
	$('#price').text(price*cnt+'원');
	$('#pay').val(price*cnt);
})();

/*active button class onclick*/
$('nav a').click(function(e) {
  e.preventDefault();
  $('nav a').removeClass('active');
  $(this).addClass('active');
  if(this.id === !'payment'){
    $('.payment').addClass('noshow');
  }
  else if(this.id === 'payment') {
    $('.payment').removeClass('noshow');
    $('.rightbox').children().not('.payment').addClass('noshow');
  }
  else if (this.id === 'profile') {
    $('.profile').removeClass('noshow');
     $('.rightbox').children().not('.profile').addClass('noshow');
  }
  else if(this.id === 'subscription') {
    $('.subscription').removeClass('noshow');
    $('.rightbox').children().not('.subscription').addClass('noshow');
  }
    else if(this.id === 'privacy') {
    $('.privacy').removeClass('noshow');
    $('.rightbox').children().not('.privacy').addClass('noshow');
  }
  else if(this.id === 'settings') {
    $('.settings').removeClass('noshow');
    $('.rightbox').children().not('.settings').addClass('noshow');
  }
});
</script>
</html>