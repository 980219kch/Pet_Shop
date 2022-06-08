<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-08
  Time: 오전 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <span>메인페이지</span>
    <a href="/member/save">회원가입</a>
    <a href="/member/login">로그인</a>
    로그인 중인 아이디: ${sessionScope.loginMemberId}
</body>
</html>
