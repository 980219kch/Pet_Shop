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
    <link href="/resources/css/signin.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body class="text-center">
<main class="form-signin">
    <form action="/member/login" method="post">
        <h1 class="h3 mb-3 fw-normal">Pet Shop</h1> <br>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" name="memberId">
            <label for="floatingInput">아이디</label>
        </div>
        <div class="form-floating">
            <input type="text" class="form-control" id="floatingPassword" name="memberPassword">
            <label for="floatingPassword">비밀번호</label>
        </div><br>

        <input type="submit" class="btn btn-primary" value="로그인">
    </form>
</main>

</body>
</html>
