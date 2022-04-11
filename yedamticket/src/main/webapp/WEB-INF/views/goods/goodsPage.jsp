<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
			<form action="goodsPage.do" enctype="multipart/form-data">
				<h4 class="card-title">Goods List</h4>
				<p class="card-description">굿즈 리스트</p>
				<div class="searchBar" align="right">
					<select id="inputState" name="searchType" style="border-style: none;">
						<option value="name"
							${pageVO.cri.searchType eq 'name' ? 'selected' : '' }>이름</option>
						<option value="goodsCd"
							${pageVO.cri.searchType eq 'goodsCd' ? 'selected' : '' }>영화/공연 구분</option>
					</select> <input type="text" name="searchName"
						value="${pageVO.cri.searchName }">
					<button type="submit" class="btn btn-primary">검색</button>
					<!-- hidden으로 숨겨서 들어갈 값 -->
					<input type="hidden" name="pageNum" value="1">
					<!-- 검색버튼을 누르면 무조건 페이지 번호 1번으로 다시세팅 -->
					<input type="hidden" name="amount" value="${pageVO.amount }">
				</div>
				<table class="table table-hover" id="contents">
					<thead>
						<tr>
							<th>굿즈 이름</th>
							<th>기업명</th>
							<th>상품 구분</th>
							<th>가 격</th>
						</tr>
					</thead>
					<tbody id="body">
						<c:forEach items="${gods }" var="gds">
							<tr onclick="location.href='goodsSelect.do?gNo=${gds.GNo}' ">
								<td>${gds.name}</td>
								<td>${gds.seller}</td>
								<td>&nbsp;&nbsp;&nbsp;<c:set var="goodsCd" value="" />
								<c:if test="${gds.goodsCd eq'0'}">
									<c:out value="영화"/>
								</c:if>
								<c:set var="goodsCd" value="" />
								<c:if test="${gds.goodsCd eq'1'}">
									<c:out value="공연"/>
								</c:if></td>
								<%-- <td>${gds.goodsCd}</td> --%>
								<td>${gds.price}원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="content" align="center">
					<c:if test="${pageVO.prev }">
						<!-- 이전버튼 활성화 여부 -->
						<a href="goodsPage.do?pageNum=${pageVO.startPage-1 }"> <input
							type="button" value="이전" class="btn btn-secondary"></a>
					</c:if>
					<!-- pageNum -->
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<a class="${pageVO.pageNum == num ? 'active': '' }"
							href="goodsPage.do?pageNum=${num }"> <input type="button"
							value="${num }" class="btn btn-secondary"></a>
					</c:forEach>
					<!-- 다음버튼 -->
					<c:if test="${pageVO.next }">
						<a href="goodsPage.do?pageNum=${pageVO.endPage+1 }"> <input
							type="button" value="다음" class="btn btn-secondary"></a>
					</c:if>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>