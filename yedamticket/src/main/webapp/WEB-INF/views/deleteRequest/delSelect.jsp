<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h4 class="card-title">삭제처리페이지</h4>
					<input type="hidden" name="delReqNo" id="delReqNo" value="${del.delReqNo }">
					<input type="hidden" name="PNo" id="PNo" value="${del.PNo }">
					<p class="card-description"></p>
					<form class="forms-sample" action="delUpdate.do" method="post">
					<input type="hidden" name="delReqNo" id="delReqNo" value="${del.delReqNo }">
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">삭제신청 사유</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="content" name="content" value="${del.performanceVO.content }">
							</div>
						</div>
						<div class="form-group row">
							<label for="exampleInputUsername2" class="col-sm-3 col-form-label">삭제신청 날짜</label>
							<div class="col-sm-6">
						 	<input type="date" class="form-control" id="delDt" name="delDt" value="${del.delDt }" readonly="readonly">
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
									<option value="신청" <c:if test="${del.deleteCd=='신청'}">selected</c:if>>신청</option>
									<option value="승인" <c:if test="${del.deleteCd=='승인'}">selected</c:if>>승인</option>
									<option value="거절" <c:if test="${del.deleteCd=='거절'}">selected</c:if>>거절</option>
								</select>
							</div>
						</div>
						
						<button type="submit" class="btn btn-gradient-primary me-2">요청처리</button>
						<button class="btn btn-light" type="reset">Cancel</button>
					</form>
					<%-- <input type="hidden" name="no" id="no" value="${pers.PNo}"> --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>