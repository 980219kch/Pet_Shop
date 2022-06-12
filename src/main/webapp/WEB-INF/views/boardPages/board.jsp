<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-10
  Time: 오후 3:16
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
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <table class="table">
        <tr>
            <th>작성자</th>
            <th>제목</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.memberId}</td>
                <td><a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
                <td>${board.boardCreatedDate}</td>
            </tr>
        </c:forEach>
    </table>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌(링크x) --%>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <%-- for(int i=startPage; i<=endPage; i++) --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
<script>
    const reply = () => {
        const reply = document.getElementById("reply").value;
        let replyContents = document.getElementById("replyContents");
        replyContents = reply;
    }
</script>
</html>
