<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<h4 class="card-title" style="font-size: 50px;">기업회원 목록</h4>
				<br>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>기업아이디</th>
							<th>기업이름</th>
							<th>이메일</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${coms }" var="com">
							<tr onclick="location.href='managerCompanySelect.do?CId=${com.CId}' ">
								<td>${com.CId}</td>
								<td>${com.name}</td>
								<td>${com.email}</td>
								<td>${com.phone}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<form id="actionForm" action="managerCompany.do" method="get">
					<input type="hidden" name="pageNum" value="${pageVO.pageNum }">
                    <input type="hidden" name="amount" value="${pageVO.amount }">
                    <input type="hidden" name="searchType" value="${pageVO.cri.searchType }">
                    <input type="hidden" name="searchName" value="${pageVO.cri.searchName }">
               </form>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
                     <!-- 이전버튼 활성화 여부 -->
                     <a href="${pageVO.startPage-1 }"> <input
                        type="button" value="이전" class="btn btn-secondary"></a>
                  </c:if>
                  <!-- pageNum -->
                  <c:forEach var="num" begin="${pageVO.startPage }"
                     end="${pageVO.endPage }">
                     <a class="${pageVO.pageNum == num ? 'active': '' }"
                        href="${num }"> <input type="button"
                        value="${num }" class="btn btn-secondary"></a>
                  </c:forEach>
                  <!-- 다음버튼 -->
                  <c:if test="${pageVO.next }">
                     <a href="${pageVO.endPage+1 }"> <input
                        type="button" value="다음" class="btn btn-secondary"></a>
                  </c:if>
				</div>
				<br>
				<form action="managerCompany.do">
					<div class="searchBar" align="right">
							<select id="inputState" name="searchType" style="border-style: none;">
							<option value="ALL"
								${pageVO.cri.searchType eq 'ALL' ? 'selected' : '' }>전체</option>
							<option value="NAME"
								${pageVO.cri.searchType eq 'NAME' ? 'selected' : '' }>이름</option>
							<option value="EMAIL"
								${pageVO.cri.searchType eq 'EMAIL' ? 'selected' : '' }>이메일</option>
							<option value="CID"
								${pageVO.cri.searchType eq 'CID' ? 'selected' : '' }>아이디</option>
						</select> <input type="text" name="searchName"
							value="${pageVO.cri.searchName }">
						<button type="submit" class="btn-sm btn-primary">검색</button>
						<input type="hidden" name="pageNum" value="1">
						<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
						<input type="hidden" name="amount" value="${pageVO.amount }">
					</div>
			</form>
			</div>
			</div>
		</div>
<script>

	let frm1 = $("input[name='pageNum']").val();
	let frm2 = $("input[name='amount']").val();
	let frm3 = $("input[name='searchType']").val();
	let frm4 = $("input[name='searchName']").val();
	
	console.log(frm1+', '+frm2+', '+frm3+', '+frm4);
	
	console.log()
      let actionForm = $("#actionForm");
      $("#content a").on("click", function(e){
         e.preventDefault();
         console.log("click");
         console.log($(this).attr("href"));
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         
         actionForm.submit();
      });
      
      let searchForm = $("#searchForm");
      $("#searchForm button").on("click", function(e){
         if(!searchForm.find("input[name='searchName']").val()){
            alert('키워드를 입력하세요.');
            return false;
         }
         
         searchForm.find("input[name='pageNum']").val("1");
         e.preventDefault();
         
         searchForm.submit();
      })
   </script>
</body>
</html>