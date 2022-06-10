<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-09
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table style="padding-top: 80px; height: 300px; width: 60%">
        <tr>
            <td style="width: 70%; padding-left: 40px;" >
                <img src="${pageContext.request.contextPath}/upload/${product.productFileName}" alt="">
            </td>
            <td>
                <table style="padding-right: 40px;">
                    <tr>
                        <td>상품명</td>
                        <td>${product.productName}</td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><fmt:formatNumber value="${product.productPrice}" pattern="###,###"></fmt:formatNumber></td>
                    </tr>
                    <tr>
                        <td>상품설명</td>
                        <td>${product.productDetail}</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <form action="/cart/save" method="post">
                                <input type="hidden" name="memberId" value="${sessionScope.loginMemberId}">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="productName" value="${product.productName}">
                                <input type="hidden" name="productPrice" value="${product.productPrice}">
                                <input type="hidden" name="productFileName" value="${product.productFileName}">
                                <select name="productCount">
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
