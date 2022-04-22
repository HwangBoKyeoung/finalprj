<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<br>
				<h2 class="text-center">굿즈 등록</h2>
				<form id="frm" action="goodsInsert.do" method="post"
					enctype="multipart/form-data">
					<table class="table">
						<tr>
							<td>기업명</td>
							<td><input type="text" id="seller" name="seller"
								value="${sessionName }" class="form-control" readonly="readonly"></td>
						</tr>
						<tr>
							<td>굿즈 분류</td>
							<td><select name="goodsCd" id="goodsCd" class="form-control" required="required">
									<option value="mv" selected="selected">영화굿즈</option>
									<option value="pf">공연굿즈</option>
							</select></td>
						</tr>
						<tr>
							<td>굿즈이름</td>
							<td><input type="text" id="name" name="name" required="required"
								class="form-control"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" id="price" name="price" required="required"
								class="form-control"></td>
						</tr>
						<tr>
						<tr>
							<td>사진</td>
							<td><input type="file" id="file" name="file"
								accept="image/gif, image/jpeg, image/png" class="form-control" required="required"></td>
						</tr>
						<tr>
							<td>상세정보</td>
							<td><textarea rows="10" cols="90" id="content"
									name="content" required="required"></textarea></td>
						</tr>
					</table>
					<button type="submit" class="form-control">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>