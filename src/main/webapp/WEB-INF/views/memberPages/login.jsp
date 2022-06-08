<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-07
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="/member/login" method="post">
        <input type="text" name="memberId"> <br>
        <input type="text" name="memberPassword"> <br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
