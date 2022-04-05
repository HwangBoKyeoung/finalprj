<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <script src="https://kit.fontawesome.com/84d54512c7.js" crossorigin="anonymous"></script>
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/users/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/users/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
 <title><tiles:getAsString name="title"/></title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="./resources/users/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./resources/users/css/now-ui-kit.css?v=1.3.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./resources/users/demo/demo.css" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/84d54512c7.js" crossorigin="anonymous"></script>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/"><!-- 부트스트랩 cdn -->

 <!--   Core JS Files   -->
  <script src="./resources/users/js/core/jquery.min.js" type="text/javascript"></script>
     <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script> 
  <script src="./resources/users/js/core/popper.min.js" type="text/javascript"></script>
  <script src="./resources/users/js/core/bootstrap.min.js" type="text/javascript"></script>
  <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
  <script src="./resources/users/js/plugins/bootstrap-switch.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="./resources/users/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
 <!--  <script src="./resources/users/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script> -->
  <!--  Google Maps Plugin    -->
  <!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
  <script src="./resources/users/js/now-ui-kit.js?v=1.3.0" type="text/javascript"></script>
<style>
	html, body {
	    margin: 0;
	    padding: 0;
	    height: 100%;
	}
	
	.main-panel{
		min-height: 100%;
		position: relative;
	}
	
	.body-content{
		margin-top: 70px;
		padding-bottom: 100px;	/* footer 높이 */
		padding-left: 100px;
	}
	
	.footer{
		width: 100%;
	    height: 100px; /* footer의 높이 */
	    position: absolute;  
	    bottom: 0;
	    left: 0;
	}
</style>
</head>
<style>
header {
  height: 75px;
  padding: 1rem;
  color: white;
  background: teal;
  font-weight: bold;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
<body class="index-page sidebar-collapse">
  <!-- Navbar -->
  <tiles:insertAttribute name="header"/>
  <!-- End Navbar -->
    <div class="main">
    <div class="main-panel">
        	<div class="body-content">
      <tiles:insertAttribute name="body"/>
      </div>
      </div>
    <!--  End Modal -->
    <!--start footer-->
    <div class="footer">
    <tiles:insertAttribute name="footer"/>
    </div>
    <!--end footer-->
  </div>
 
  <script>
    $(document).ready(function() {
      // the body of this function is in assets/js/now-ui-kit.js
      nowuiKit.initSliders();
    });

    function scrollToDownload() {

      if ($('.section-download').length != 0) {
        $("html, body").animate({
          scrollTop: $('.section-download').offset().top
        }, 1000);
      }
    }
  </script>
</body>

</html>