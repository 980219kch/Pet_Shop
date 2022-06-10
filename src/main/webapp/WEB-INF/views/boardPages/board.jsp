<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-10
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <table>
        <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
        </tr>
        <tr>
            <td>${board.boardTitle}</td>
            <td>${board.memberId}</td>
            <td>${board.boardCreatedDate}</td>
        </tr>
    </table>
</body>
</html>
