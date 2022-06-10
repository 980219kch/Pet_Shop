<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-09
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            width: 100%;
            border-top: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            border-bottom: 1px solid black;
            padding: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <table>
        <form>
            <tr>
                <th colspan="2" style="text-align: center">상품정보</th>
                <th>상품금액</th>
                <th>개수</th>
                <th></th>
            </tr>
            <c:forEach items="${cartList}" var="cart">
                <tr>
                    <td style="width: 170px"><img src="${pageContext.request.contextPath}/upload/${cart.productFileName}" alt="" width="100" height="100"></td>
                    <td>${cart.productName}</td>
                    <td>${cart.productPrice}</td>
                    <td>${cart.productCount}</td>
                    <td><input type="button" value="삭제" onclick="deleteCart()"></td>
                    <script>
                        const deleteCart = () => {
                            location.href = "/cart/delete?id=${cart.id}"
                        }
                    </script>
                </tr>
            </c:forEach>
        </form>
    </table>
</body>

</html>
