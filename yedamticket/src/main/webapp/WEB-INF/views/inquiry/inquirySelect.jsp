<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title" style="font-size: 40px;">1:1문의 내용</h4><br>
				<table class="table table-basic">
				<thead>
					<tr>					
						<th>NO</th>
						<td>${inq.inNo }</td>
					</tr>
					</thead>
					<tr>
						<th>KIND</th>
						<td>${inq.kind }</td>
					<tr>
					<tr>
						<th>TITLE</th>
						<td>${inq.title}</td>
					</tr>
					<tr>
						<th>DATE</th>
						<td>${inq.inDt }</td>
					</tr>
					<tr>
						<th>CONTENT</th>
						<td>${inq.content }</td>
					</tr>
				</table><br>
				 <div class="col-lg-12grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">답변</h4>
							<table class="table" id="replytable">							  
								<tr>					
									<th>상담 답변</th>	
									<td></td>								
								</tr>
								<tr id="body">
									<th>답변내용</th>
									<c:choose>
										<c:when test="${empty inqReply}">
											<td id="answer"><textarea cols="50" rows="8" style="text-align: left;" name="ans" id="ans"></textarea>
											<button id="btnAns" onclick="aJaxCall()"  class="btn-sm btn-primary">등록</button></td>
										</c:when>
										<c:otherwise>
											<td id="answer">${inqReply.ans}</td>
										</c:otherwise>
									</c:choose>
								</tr>
						    </table>
							<input type="button" value="목록" onclick="location.href='managerInquiryList.do'"  class="btn-sm btn-primary">		
						    <div id="show">
						    
						    </div>
						</div>
					</div>				
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function aJaxCall(){
			console.log(${inq.inNo });
			$.ajax({
				url : "ajaxReplyInsert.do",
				type : "post",
				data : {'inNo' : ${inq.inNo}, 'ans': $('#ans').val()},
				dataType : "json",
				success : function(data){
					if(data!=null){
// 						let div = $("<div>");
// 						div.text(data.ans);
// 						$("#show").append(div);
						html(data);
					}
				}
			});
		}
		function html(data){
			var tr = $("#body")
			tr.empty();
			console.log(data.ans)
			tr.append(
					$("<th>").text("답변내용"),
					$("<td>").text(data.ans));
			$("#btnAns").remove();
			/* $.add(data, function(index, item){
				console.log(item);
				tr.append(
						$("<td />").text(item.ans)
				);
				
			}) */
// 			$("#body").append($("#answer"));
		}
	</script>
</body>
</html>