<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var fileTarget = $('.filebox .upload-hidden');

						fileTarget.on('change', function() {
							if (window.FileReader) {
								// 파일명 추출
								var filename = $(this)[0].files[0].name;
								console.log(filename);
							}

							else {
								// Old IE 파일명 추출
								var filename = $(this).val().split('/').pop()
										.split('\\').pop();
							}

							$(this).siblings('.upload-name').val(filename);
						});

						//preview image 
						var imgTarget = $('.preview-image .upload-hidden');

						imgTarget
								.on(
										'change',
										function() {
											var parent = $(this).parent();
											parent.children('.upload-display')
													.remove();

											if (window.FileReader) {
												//image 파일만
												if (!$(this)[0].files[0].type
														.match(/image\//))
													return;

												var reader = new FileReader();
												reader.onload = function(e) {
													var src = e.target.result;
													parent
															.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
												}
												reader
														.readAsDataURL($(this)[0].files[0]);
											}

											else {
												$(this)[0].select();
												$(this)[0].blur();
												var imgSrc = document.selection
														.createRange().text;
												parent
														.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

												var img = $(this).siblings(
														'.upload-display')
														.find('img');
												img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
														+ imgSrc + "\")";
											}
										});
					});
</script>
<style type="text/css">
body {
	margin: 10px;
}

.where {
	display: block;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

label {
	margin: 0px;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.filebox .upload-display {
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}
</style>
</head>
<body>
	<div>
		<div class="col-md-10 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Performance Update</h4>
					<p class="card-description"></p>
					<form class="forms-sample" action="companyPerforUpdate.do"
						method="post">
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
								class="col-sm-3 col-form-label">공연가격</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="price" name="price" value="${pers.price }">
							</div>
						</div>
<!-- 						<div class="filebox bs3-primary preview-image"> -->
<!-- 								<br> -->
<!-- 								<label for="input_file">업로드</label> -->
<%-- 								<input class="upload-name" value="${pers.fileCd}" id="fileCd" name="fileCd" disabled="disabled" style="width: 200px;"> --%>
<!-- 								<input type="file" name="file" id="input_file" class="upload-hidden"> -->
<!-- 						</div> -->
							<%-- <div class="input-group no-border">
								<input type="hidden" class="form-control" id="goodsCd"
									name="goodsCd" placeholder="1" readonly="readonly"
									value="${gds.goodsCd}">
							</div> --%>
						<%-- <div class="form-group row">
							<label for="input_file" 
								class="col-sm-3 col-form-label"   >공연이미지</label>
							<div class="filebox bs3-primary preview-image">
								<input class="upload-name" value="${pers.fileCd}" disabled="disabled" style="width: 200px;">
								<input type="file" class="upload-hidden" id="input_file" name="file">
							</div>
						</div> --%>
						<button type="submit" class="btn btn-gradient-primary me-2">Update</button>
						<button class="btn btn-light" type="reset">Cancel</button>
					</form>
						<button class="btn btn-gradient-primary me-2" onclick="location.href='companyPerforDel.do?PNo=${pers.PNo}&cId=${pers.CId}'">삭제요청</button>
						<%-- <input type="hidden" name="no" id="no" value="${pers.PNo}"> --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>