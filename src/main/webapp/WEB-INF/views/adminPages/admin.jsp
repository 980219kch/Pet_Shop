<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-08
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <a href="/member/findAll">회원목록 조회</a> <br>
    <a href="/product/save">상품 등록</a>
    <a href="/product">상품목록 조회</a>
</body>
</html>
