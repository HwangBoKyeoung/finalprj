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
			<div class="col-md-8">
				<br>
				<form id="frm" action="noticeUpdate.do" method="post">
                    <input type="hidden" value="${notice.noticeNo}" id="noticeNo" name="noticeNo">
					<table class="table">
						<tr>
                            <th width="100">작성자</th>
                            <td width="150">
                                <input type="text" id="writer" name="writer" value="${notice.writer }" readonly="readonly">
                            </td>
                            <th width="100">작성일자</th>
                            <td width="150">
                                <input type="date" id="wrDt" name="wrDt" value="${notice.wrDt }" readonly="readonly"> 
                            </td>
                        </tr>
						<tr>
                            <th>제목</th>
                            <td colspan="3">
                                <input type="text" size="75" id="title" name="title" value="${notice.title }"> 
                            </td>	
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                 <textarea rows="10" cols="80" id="content" name="content" >${notice.content }</textarea>
                            </td>
                        </tr>	
					</table>
					<div align="center">
                            <input type="submit" class="btn btn-success" value="수정">
                            <input type="button" class="btn btn-primary" onclick="location.href='noticeList.do'" value="목록">
                            <input type="reset" class="btn btn-warning" value="취소">
                        </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>