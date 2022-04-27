<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		*{
			list-style:none;
		}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"> 
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
					<h4 class="card-title">Performance Update</h4>
					<p class="card-description"></p>
					<form class="forms-sample" action="companyPerforUpdate.do"
						method="post" enctype="multipart/form-data">
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">공연번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="PNo" name="PNo" value="${pers.PNo}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">공연이름</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name" value="${pers.name }">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label">공연설명</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="content" name="content"
									value="${pers.content}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">출연자이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="actor" name="actor" value="${pers.actor }">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">공연지역</label>
							<div class="col-sm-9">
								<select class="col-md-10" id="selectedval" name="loc" data-loc="${pers.loc }">
								  <option value="강원도" <c:if test="${pers.loc=='강원도'}">selected</c:if>> 강원도</option>
								  <option value="광주광역시" <c:if test="${pers.loc=='광주광역시'}">selected</c:if>> 광주광역시</option>
								  <option value="경기도" <c:if test="${pers.loc=='경기도'}">selected</c:if>> 경기도</option>
								  <option value="경상남도" <c:if test="${pers.loc=='경상남도'}">selected</c:if>> 경상남도</option>
								  <option value="경상북도" <c:if test="${pers.loc=='경상북도'}">selected</c:if>> 경상북도</option>
								  <option value="대구광역시" <c:if test="${pers.loc=='대구광역시'}">selected</c:if>> 대구광역시</option>
								  <option value="대전광역시" <c:if test="${pers.loc=='대전광역시'}">selected</c:if>> 대전광역시</option>
								  <option value="부산광역시" <c:if test="${pers.loc=='부산광역시'}">selected</c:if>> 부산광역시</option>
								  <option value="서울특별시" <c:if test="${pers.loc=='서울특별시'}">selected</c:if>> 서울특별시</option>
								  <option value="세종특별자치시" <c:if test="${pers.loc=='세종특별자치시'}">selected</c:if>> 세종특별자치시</option>
								  <option value="인청광역시" <c:if test="${pers.loc=='인청광역시'}">selected</c:if>> 인청광역시</option>
								  <option value="울산광역시" <c:if test="${pers.loc=='울산광역시'}">selected</c:if>> 울산광역시</option>
								  <option value="전라남도" <c:if test="${pers.loc=='전라남도'}">selected</c:if>> 전라남도</option>
								  <option value="전라북도" <c:if test="${pers.loc=='전라북도'}">selected</c:if>> 전라북도</option>
								  <option value="제주특별자치도" <c:if test="${pers.loc=='제주특별자치도'}">selected</c:if>> 제주특별자치도</option>
								  <option value="충천남도" <c:if test="${pers.loc=='충천남도'}">selected</c:if>> 충천남도</option>
								  <option value="충청북도" <c:if test="${pers.loc=='충청북도'}">selected</c:if>> 충청북도</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">공연장 상세주소</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="addr" name="addr" value="${pers.addr }">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">요청 상태</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="confirm" name="confirm" value="${pers.confirm }">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">공연가격</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="price" name="price" value="${pers.price }">
							</div>
						</div>
					 <div style="margin-bottom: 70px;">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label" style="text-align: left;padding-left:0px;">포스터</label>
							<input type="file" accept="image/gif, image/jpeg, image/png" id="file" name="file">
							<img id="preImage" src="/upload/${pers.renames}" alt="image_title"/>
						</div>
						<button type="submit" class="btn me-2" style="background: #301e4e;">수정</button>
						<input type="button" class="btn btn-light" style="background: #301e4e;" value="목록" onclick="location.href='companyPerforList.do'">
					</form>
						<button class="btn btn-gradient-primary me-2" style="background: #301e4e;margin-top: 5px;" onclick="location.href='companyPerforDel.do?PNo=${pers.PNo}&cId=${pers.CId}'">삭제요청</button>
						<%-- <input type="hidden" name="no" id="no" value="${pers.PNo}"> --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
