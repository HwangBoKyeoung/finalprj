<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인인포</title>
</head>
<body>
    ${sessionScope.token}
    <a href = "kakaoLogout.do">로그아웃</a><br>
</body>
</html>