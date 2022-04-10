<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h4 class="card-title">Goods Update</h4>
					<p class="card-description"></p>
					<form class="forms-sample" id="frm" action="goodsUpdate.do" method="post"> <!--  enctype="multipart/form-data" -->
						<input type="hidden" value="${gds.GNo}" id="GNo" name="GNo">
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">굿즈 이름</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name" value="${gds.name}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputPassword2"
								class="col-sm-3 col-form-label">기업명</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="seller" name="seller"
									value="${gds.seller}" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">굿즈 가격</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="price" name="price" value="${gds.price}">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2"
								class="col-sm-3 col-form-label">굿즈 설명</label>
							<div class="col-sm-9">
								<textarea rows="7" cols="20" class="form-control"
									placeholder="굿즈설명" id="content" name="content" >${gds.content}</textarea>
							</div>
						</div>
						<div class="filebox bs3-primary preview-image">
								<br>
								<label for="input_file">업로드</label>
								<input class="upload-name" value="${gds.fileCd }" disabled="disabled" style="width: 200px;">
								<input type="file" id="input_file" class="upload-hidden">
						</div>
							<div class="input-group no-border">
								<input type="hidden" class="form-control" id="goodsCd"
									name="goodsCd" placeholder="1" readonly="readonly"
									value="${gds.goodsCd}">
							</div>
						<button type="submit" class="btn btn-gradient-primary me-2">Update</button>
						<button class="btn btn-light" type="reset">Cancel</button>
						<button class="btn btn-gradient-primary me-2" onclick="location.href='goodsDelete.do?gNo=${gds.GNo}'">삭제</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>