<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-08
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <table class="table">
            <tr>
                <th>id</th>
                <th>memberId</th>
                <th>memberPassword</th>
                <th>memberName</th>
                <th>memberEmail</th>
                <th>memberMobile</th>
                <th>memberAddress</th>
            </tr>
            <c:forEach items="${memberList}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td>${member.memberId}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberMobile}</td>
                    <td>${member.memberAddress}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
