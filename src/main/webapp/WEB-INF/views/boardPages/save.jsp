<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-10
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container" style="width: 500px">
        <h2 class="display-4 fw-normal">문의글쓰기</h2>
        <form action="/board/save" method="post">
            <div class="py-5">
                아이디<input class="form-control mb-2" type="text" name="memberId" value="${sessionScope.loginMemberId}">
                제목<input class="form-control mb-2" type="text" name="boardTitle">
                문의내용<textarea class="form-control mb-2" name="boardContents" cols="20" rows="20"></textarea>
                <input type="submit" value="작성완료">
            </div>
        </form>
    </div>
</body>
</html>
