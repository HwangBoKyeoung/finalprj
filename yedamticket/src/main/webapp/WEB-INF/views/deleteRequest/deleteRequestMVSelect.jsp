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
					<h4 class="card-title">삭제처리페이지</h4>
					<input type="hidden" name="delReqNo" id="delReqNo" value="${del.delReqNo }">
					<input type="button" name="mvNo" id="mvNo" value="공연정보" onclick="location.href='movieDetail.do?mvNo=${del.mvNo}'">
					<input type="hidden" name="mvNo" id="mvNo" value="${del.mvNo }">
					
					<p class="card-description"></p>
					<form class="forms-sample" action="deleteRequestMVUpdate.do" method="post">
					<input type="hidden" name="delReqNo" id="delReqNo" value="${del.delReqNo }" >
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">삭제신청 사유</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="content" name="content" value="${del.performanceVO.content }"  readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">삭제신청 날짜</label>
							<div class="col-sm-6">
						 	<input type="date" class="form-control" id="delDt" name="delDt" value="${del.delDt }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">기업 회원 아이디</label>
							<div class="col-sm-6">
						 	<input type="text" class="form-control" id="CId" name="CId" value="${del.CId }" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2"
								class="col-sm-3 col-form-label">공연이름</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="name" name="name" value="${del.performanceVO.name}" readonly="readonly">
							</div>
						</div>				
						<div class="form-group row">
							<label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">신청상태</label>
							<div class="col-sm-9">
								<select class="col-md-10" id="selectedval" name="deleteCd"
										data-loc="${del.deleteCd }">
									<option value="" <c:if test="${del.deleteCd==''}">selected</c:if>>선택</option>
									<option value="승인" <c:if test="${del.deleteCd=='승인'}">selected</c:if>>승인</option>
									<option value="거절" <c:if test="${del.deleteCd=='거절'}">selected</c:if>>거절</option>
								</select>
								<div id="show">
									<input type="text" placeholder="삭제사유" id="refusal" name="refusal" value="${del.refusal }" style="display:none">
								</div>
							</div>
						</div>
						
						<button type="submit" class="btn btn-gradient-primary me-2">요청처리</button>
						<input type="button" class="btn btn-light" value="Cancel" onclick="location.href='managerMovieDeleteList.do'">
					</form>
					<input type="hidden" value="${del.deleteCd}" id="del">
				</div>
			</div>
		</div>
	</div>
	<script>
		console.log($("#selectedval").data("loc"));
		$("#selectedval").change(function() {
			/* alert($(this).val()); */
			if($(this).val()=='거절'){
				$("#refusal").show();
			} else{
				$("#show").empty();
			}
			});
	</script>
</body>
</html>