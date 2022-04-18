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
<input type="hidden" name="mvNo" id="mvNo">
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<br>
				<h2 class="text-center">영화 등록</h2>
				<form id="frm" action="movieInsert.do" method="post" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<td>등록자</td>
							<td><input type="text" id="CId" name="CId" value="${sessionId }"class="form-control" readonly="readonly"></td>
						</tr>
						<tr>
							<td>영화 이름</td>
							<td><input type="text" id="name" name="name"
								class="form-control"></td>
						</tr>
						<tr>
							<td>장르</td>
							<td><input type="text" id="genre" name="genre"
								class="form-control"></td>
						</tr>
						<tr>
							<td>관람 등급</td>
							<td><select name="rating" class="form-control">
									<option value="전체 관람가" selected="selected">전체 관람가</option>
									<option value="12세 관람가">12세 관람가</option>
									<option value="15세 관람가">15세 관람가</option>
									<option value="청소년 관람불가">청소년 관람불가</option>
							</select></td>
						</tr>
						<tr>
							<td>감독</td>
							<td><input type="text" id="director" name="director"
								class="form-control"></td>
						</tr>
						<tr>
							<td>출연 배우</td>
							<td><input type="text" id="actor" name="actor"
								class="form-control"></td>
						</tr>
						<tr>
							<td>개봉일</td>
							<td><input type="date" id="startDate" name="startDate" value=""
								class="form-control"></td>
						</tr>
						<tr>
							<td>상영 시간(분)</td>
							<td><input type="text" id="runtime" name="runtime"
								class="form-control"></td>
						</tr>
						<tr>
							<td>배급사</td>
							<td><input type="text" id="distributor" name="distributor"
								class="form-control"></td>
						</tr>
						<tr>
							<td>제작 국가</td>
							<td><input type="text" id="country" name="country"
								class="form-control"></td>
						</tr>
						<tr>
							<td>포스터</td>
							<td><input type="file" id="file" name="file" multiple="multiple" accept="image/gif, image/jpeg, image/png" 
								class="form-control"></td>
						</tr>
						<tr>
							<td>영화 코드</td>
							<td><input type="text" id="docId" name="docId"
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