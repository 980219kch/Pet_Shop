<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-08
  Time: 오후 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        section#content ul li {
            display: inline-block; margin: 10px;
        }
        section#content div.productImg img {
            width: 200px; height: 200px;
        }
        section#content div.productName {
            padding: 10px 0; text-align: center;
        }
        section#container {
            margin: 50px;
        }
    </style>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <section id="container">
        <div id="container_box">
            <section id="content">
                <ul>
                    <c:forEach items="${productList}" var="product">
                        <li>
                            <div class="productImg">
                                <img src="${pageContext.request.contextPath}/upload/${product.productFileName}" alt="">
                            </div>
                            <div class="productName">
                                <a href="/product/detail?id=${product.id}">${product.productName}</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </section>
        </div>
    </section>

</body>
</html>
