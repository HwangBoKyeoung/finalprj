<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="col-md-10 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Movie Update</h4>
					<p class="card-description"></p>
					<form class="forms-sample" action="companyMovieUpdate.do"method="post">
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">영화번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="mvNo" name="mvNo" value="${mv.mvNo}">
								<input type="hidden" class="form-control" id="CId" name="CId" value="${mv.CId}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">영화</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name" value="${mv.name }">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">영화장르</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="genre" name="genre" value="${mv.genre}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">영화감독</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="director" name="director" value="${mv.director}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">관람등급</label>
							<div class="col-sm-9">
								<select class="col-md-10" id="selectedval" name="rating" data-rating="${mv.rating }">
								  <option value="전체관람가능" <c:if test="${mv.rating=='전체관람가능'}">selected</c:if>> 전체관람가능</option>
								  <option value="7세관람가" <c:if test="${mv.rating=='7세관람가'}">selected</c:if>> 7세관람가</option>
								  <option value="12세관람가" <c:if test="${mv.rating=='12세관람가'}">selected</c:if>> 12세관람가</option>
								  <option value="15세관람가" <c:if test="${mv.rating=='15세관람가'}">selected</c:if>> 15세관람가</option>
								  <option value="18세관람가" <c:if test="${mv.rating=='18세관람가'}">selected</c:if>> 18세관람가</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">국가</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="country" name="country" value="${mv.country}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label">영화내용</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="content" name="content" value="${mv.content}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">출연자이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="actor" name="actor" value="${mv.actor }">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">공연영상</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="vname" name="vname" value="${videos.vname }">
								</div>
						</div>
						<input type="hidden" name="fileCd" id="fileCd" value="${videos.fileCd }">
						<button type="submit" class="btn btn-gradient-primary me-2">Update</button>
						<button class="btn btn-light" type="reset">Cancel</button>
					</form>
						<button class="btn btn-gradient-primary me-2" onclick="location.href='companyMoviedel.do?mvNo=${mv.mvNo}&cId=${mv.CId}'">삭제요청</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>