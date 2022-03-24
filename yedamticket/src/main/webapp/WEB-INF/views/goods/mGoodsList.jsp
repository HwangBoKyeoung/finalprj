<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<body>
<h1>영화굿즈</h1>
 <div class="album py-5 bg-light">
    <div class="container">
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach var="i" items="${mGoods }">
					<div class="col-4">
						<div class="card shadow-sm" >
						
						<img src="resources/users/img/bts.jpg" width="100%" height="225">
							<%-- <svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>${i.name}</title><rect width="100%" height="100%"
									fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
 --%>
							<div class="card-body">
								<p class="card-text">${i.content}</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button class="btn btn-danger">view</button>
										<button class="btn btn-danger">Edit</button>
										
									</div>
									<p><b>${i.price}원</b></p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
     </div>
  </div>
</body>
</html>