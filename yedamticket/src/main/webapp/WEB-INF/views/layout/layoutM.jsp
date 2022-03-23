<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- plugins:css -->
<link rel="stylesheet" href="resources/managers/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="resources/managers/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="resources/managers/assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="resources/managers/assets/images/favicon.ico" />
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
<body>
	<div class="container-scroller">
      
      <!-- partial:partials/_navbar.html header-->
      <tiles:insertAttribute name="header" />
      <!-- partial navbar -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html sidebar-->
        <tiles:insertAttribute name="sidebar" />
        <!-- partial -->
        <div class="main-panel">
        	<div class="body-content">
          		<tiles:insertAttribute name="body" />
          	</div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <div class="footer">
          	<tiles:insertAttribute name="footer" />
          </div>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="resources/managers/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="resources/managers/assets/vendors/chart.js/Chart.min.js"></script>
    <script src="resources/managers/assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="resources/managers/assets/js/off-canvas.js"></script>
    <script src="resources/managers/assets/js/hoverable-collapse.js"></script>
    <script src="resources/managers/assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="resources/managers/assets/js/dashboard.js"></script>
    <script src="resources/managers/assets/js/todolist.js"></script>
    <!-- End custom js for this page -->
</body>
</html>