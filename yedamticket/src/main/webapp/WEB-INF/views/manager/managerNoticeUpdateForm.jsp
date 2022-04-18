<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
textarea {
    resize: none;
  }
</style>
<body>
<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-9">
				<br>
				<form id="frm" action="managerNoticeUpdate.do" method="post">
                    <input type="hidden" value="${notice.noticeNo}" id="noticeNo" name="noticeNo">
					<table class="table">
						<tr>
                            <th >작성일자</th>
                            <td >
                                <input type="date" id="wrDt" name="wrDt" value="${notice.wrDt }" readonly="readonly" class="form-control"> 
                            </td>
                        </tr>
						<tr>
                            <th>제목</th>
                            <td >
                                <input type="text" size="75" id="title" name="title" value="${notice.title }" class="form-control"> 
                            </td>	
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td >
                                 <textarea rows="10" cols="80" id="content" name="content" >${notice.content }</textarea>
                            </td>
                        </tr>	
					</table>
					<div align="center">
                            <input type="submit" class="btn btn-success" value="수정">
                            <input type="button" class="btn btn-primary" onclick="location.href='managerNotice.do'" value="목록">
                            <input type="reset" class="btn btn-warning" value="취소">
                        </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>