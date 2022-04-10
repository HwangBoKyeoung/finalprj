<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {
    resize: none;
  }
</style>
</head>
<input type="hidden" name="PNo" id="PNo">
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<br>
				<h2 class="text-center">공연 등록</h2>
				<form id="frm" action="perInsert.do" method="post" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<td>등록자</td>
							<td><input type="text" id="CId" name="CId" value="${sessionId }"class="form-control" readonly="readonly"></td>
						</tr>
						<tr>
							<td>공연 이름</td>
							<td><input type="text" id="name" name="name"
								class="form-control"></td>
						</tr>
						<tr>
							<td>출연 배우</td>
							<td><input type="text" id="actor" name="actor"
								class="form-control"></td>
						</tr>
						<tr>
							<td>지역</td>
							<td><input type="text" id="loc" name="loc"
								class="form-control"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" id="addr" name="addr"
								class="form-control"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" id="price" name="price"
								class="form-control"></td>
						</tr>
						<tr>
							<td>포스터</td>
							<td><input type="file" id="file" name="file" accept="image/gif, image/jpeg, image/png" 
								class="form-control"></td>
						</tr>
						<tr>
							<td>줄거리</td>
							<td><textarea rows="10" cols="75" id="content" name="content"
								></textarea></td>
						</tr>
					</table>
					<button type="submit" class="form-control">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>