<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#vfile").on('change', function(){
        readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#prevImage').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
}
        $(function() {
            $("#file").on('change', function(){
                readURL(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                  $('#preImage').attr('src', e.target.result);
               }
               reader.readAsDataURL(input.files[0]);
            }
        }
      
        
</script>
</head>
<body>
	<div>
		<div class="col-md-10 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Movie Update</h4>
					<p class="card-description"></p>
					<form class="forms-sample" action="companyMovieUpdate.do" method="post" enctype="multipart/form-data">
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
								class="col-sm-3 col-form-label">요청상태</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="confirm" name="confirm" value="${mv.confirm }" readonly="readonly">
							</div>
						</div>
						<div>
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label" style="text-align: left;padding-left:0px;">영상</label>
							<input type="file" accept="video/mp4,video/mkv, video/x-m4v,video/*" id="vfile" name="vfile">
							<img id="prevImage" src="/upload/${mv.movieVideoVO.vRenames}" alt="${mv.movieVideoVO.vRename}"/>
						</div>
						<div>
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label" style="text-align: left;padding-left:0px;">포스터</label>
							<input type="file" accept="image/gif, image/jpeg, image/png" id="file" name="file">
							<img id="preImage" src="/upload/${mv.renames}" alt="${mv.fileCd}"/>
						</div>
						 
						<button type="submit" style="background: #301e4e;margin-top: 5px;" class="btn btn-gradient-primary me-2">Update</button>
						<input type="button" class="btn btn-light" style="background: #301e4e;margin-top: 5px;" value="Cancel" onclick="location.href='companyMovieList.do'">
					</form>
						<button class="btn btn-gradient-primary me-2" style="background: #301e4e;margin-top: 5px;" onclick="location.href='companyMoviedel.do?mvNo=${mv.mvNo}&cId=${mv.CId}'">삭제요청</button>
						<input type="hidden" value="${mv.docId }" id="docId" name="docId">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
