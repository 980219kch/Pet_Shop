<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-13
  Time: 오전 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    작성자: ${board.memberId} <br>
    제목: ${board.boardTitle} <br>
    내용: ${board.boardContents} <br>
    작성일자: ${board.boardCreatedDate} <br>

    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <div class="container mt-5">
            <div id="reply-write" class="input-group mb-3">
                <div class="form-floating">
                    <input type="text" id="replyWriter" class="form-control" value=${sessionScope.loginMemberId} readonly>
                    <label for="replyWriter">작성자</label>
                </div>
                <div class="form-floating">
                    <input type="text" id="replyContents" class="form-control" placeholder="내용">
                    <label for="replyContents">내용</label>
                </div>
                <button onclick="replyWrite()" class="btn btn-primary">댓글작성</button>
            </div>
    </c:if>

            <div id="reply-list">
                <table class="table">
                    <tr>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                    </tr>
                    <c:forEach items="${replyList}" var="reply">
                        <tr>
                            <td>${reply.replyWriter}</td>
                            <td>${reply.replyContents}</td>
                            <td><fmt:formatDate value="${reply.replyCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
</body>
<script>
    const replyWrite = () => {
        const boardId = `${board.id}`;
        const replyWriter = document.getElementById("replyWriter").value;
        const replyContents = document.getElementById("replyContents").value;
        $.ajax({
            type: "post",
            url: "/reply/save",
            data: {
                "boardId": boardId,
                "replyWriter": replyWriter,
                "replyContents": replyContents
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>관리자</td>";
                    output += "<td>"+result[i].replyContents+"</td>";
                    output += "<td>"+moment(result[i].replyCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('reply-list').innerHTML = output;
                document.getElementById('replyContents').value='';
            },
            error: function() {
                alert("오류");
            }
        });
    }
</script>
</html>
