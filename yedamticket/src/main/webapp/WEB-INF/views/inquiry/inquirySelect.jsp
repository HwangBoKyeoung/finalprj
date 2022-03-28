<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="col-lg-6 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Inquiry Select</h4>
				<table class="table">
					<tr>					
						<th>NO</th>
						<td>${inq.inNo }</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<td>${inq.title}</td>
					</tr>
					<tr>
						<th>DATE</th>
						<td>${inq.inDt }</td>
					</tr>
					<tr>
						<th>CONTENT</th>
						<th>${inq.content }</th>
					</tr>
				</table><br>
				
				<div class="col-lg-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
						 <h4 class="card-title">답변</h4>
							<table class="table">
							  
								<tr>					
									<th>NO</th>
									<td>${inq.inNo }</td>
								</tr>
								<tr>
									<th>TITLE</th>
									<td>${inq.title}</td>
								</tr>
								<tr>
									<th>DATE</th>
									<td>${inq.inDt }</td>
								</tr>
								<tr>
									<th>CONTENT</th>
									<th>${inq.content }</th>
								</tr>
						    </table>
						</div>
					</div>				
				</div>
			</div>
		</div>
	</div>
</body>
</html>