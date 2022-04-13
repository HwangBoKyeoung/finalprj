<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
 src="resources/js/jquery.min.js"></script>

</head>
<style>
textarea {
    resize: none;
  }
  th {
	width: 120px;
}
</style>
<body>
 	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<br>
				<h3 class="text-left">문의 수정</h3>
                <form id="frm" action="inqUpdate.do" method="post">
                    <input type="hidden" value="${inqs.inNo}" id="inNo" name="inNo">
                    <table class="table">
                        <tr>
                            <td>수정일자</td>
                            <td><input type="date" id="inDt" name="inDt" readonly="readonly"  class="form-control"value=""></td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" size="75" id="title" name="title" value="${inqs.title }" class="form-control" required="required"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea rows="10" cols="90" id="content" name="content" >${inqs.content }</textarea></td>
                        </tr>
                        <tr>

                            <td colspan="2" class="text-center">
                            	<input type="hidden" id="UId" name="UId" value="${inqs.UId }" class="form-control" readonly="readonly">
                                <input type="submit"  class="btn btn-success" value="수정">
                                <input type="reset" class="btn btn-warning" value="취소">
                                <input type="button" class="btn btn-primary" onclick="location.href='inqList.do'" value="목록">
                            </td>
                        </tr>

                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
<script>
	document.getElementById('inDt').valueAsDate = new Date();
</script>
</html>