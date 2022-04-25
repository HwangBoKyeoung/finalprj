<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./resources/users/js/core/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div>
		<div class="col-md-10 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size: 50px;">영화 등록 요청</h4>
					<br>
					<input type="hidden" name="mvNo" id="mvNo" value="${conS.mvNo }">
					<input type="hidden" name="#" id="#" value="#">
					<p class="card-description"></p>
					<form class="forms-sample" action="movieConfirmUpdate.do" method="post">
					<input type="hidden" name="mvNo" id="mvNo" value="${conS.mvNo }" >
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">영화번호</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="mvNo" name="mvNo" value="${conS.mvNo }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">담당기업</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="CId" name="CId" value="${conS.CId }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">영화제목</label>
							<div class="col-sm-6">
						 	<input type="text" class="form-control" id="name" name="name" value="${conS.name }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">장르</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="genre" name="genre" value="${conS.genre }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">감독</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="director" name="director" value="${conS.director }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">관람등급</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="rating" name="rating" value="${conS.rating }" readonly="readonly">
							</div>
						</div>	
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">국가</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="country" name="country" value="${conS.country }" readonly="readonly">
							</div>
						</div>	
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">영화설명</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="content" name="content" value="${conS.content }" readonly="readonly">
							</div>
						</div>	
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">출연진</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="actor" name="actor" value="${conS.actor }" readonly="readonly">
							</div>
						</div>	
						<%-- <div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">포스터</label>
							<div class="col-sm-6">
								<input type="file" class="form-control" id="fileCd" name="fileCd" value="${conS.fileCd }" readonly="readonly">
							</div>
						</div>	 --%>
						<%-- <div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">트레일러</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="#" name="#" value="${conS. }" readonly="readonly">
							</div>
						</div> --%>							
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">요청상태</label>
							<div class="col-sm-9">
								<select class="col-md-10" id="selectedval" name="confirm"
										data-loc="${conS.confirm}">
									<option value="대기" <c:if test="${conS.confirm == '대기' }">selected</c:if>>대기</option>
									<option value="승인" <c:if test="${conS.confirm == '승인' }">selected</c:if>>승인</option>
									<option value="거부" <c:if test="${conS.confirm == '거부' }">selected</c:if>>거부</option>
								</select>
							</div>
						</div>
								<div class="form-group row" id="selectedShow" style="display:none">
								<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">거부사유</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="거부사유" id="refuseRs" name="refuseRs" value="${conS.refuseRs }">
									</div>
								</div>
						<button type="submit" class="btn btn-gradient-primary me-2">요청처리</button>
						<button class="btn btn-gradient-primary me-2" type="reset" onclick="location.href='movieConfirmList.do'">Cancel</button>
					</form>
					<input type="hidden" value="${conS.confirm }" id="confirm">
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$("#selectedval").change(function() {
		if($(this).val()=='거부'){
			$("#selectedShow").show();
		} else{
			$("#selectedShow").hide();
		}
		});
	</script>
</body>
</html>