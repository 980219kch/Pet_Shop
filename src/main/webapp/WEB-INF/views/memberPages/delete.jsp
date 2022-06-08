<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-08
  Time: 오후 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/member/delete" method="post" name="deleteForm">
        <input type="text" name="memberId" value="${deleteMember.memberId}" readonly> <br>
        <input type="text" id="pwCheck" name="memberPassword" placeholder="비밀번호"> <br>
        <input type="button" onclick="deleteMember()" value="탈퇴">
    </form>
</body>
<script>
    const deleteMember = () => {
        const pwCheck = document.getElementById("pwCheck").value;
        const pwDB = `${deleteMember.memberPassword}`;
        if(pwCheck == pwDB) {
            deleteForm.submit();
        } else {
            alert("비밀번호 불일치!!");
        }
    }
</script>
</html>
