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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
        section#content div.productPrice {
            text-align: center;
        }
        section#container {
            margin-top: 50px;
            width: 550px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="container mt-3">
        <form action="/product/search" method="get">
            <input type="text" name="text" placeholder="검색어입력..">
            <input type="submit" value="검색">
        </form>
    </div>

    <section id="container">
        <div id="container_box">
            <section id="content">
                <ul>
                    <c:forEach items="${productList}" var="product">
                        <li>
                            <div class="productImg">
                                <a href="/product/detail?page=${paging.page}&id=${product.id}"><img src="${pageContext.request.contextPath}/upload/${product.productFileName}" alt=""></a>
                            </div>
                            <div class="productName">
                                <a href="/product/detail?page=${paging.page}&id=${product.id}">${product.productName}</a>
                            </div>
                            <div class="productPrice">
                                <div>${product.productPrice}원</div>
                            </div>
                            <c:if test="${sessionScope.loginMemberId eq 'admin'}">
                                <div class="productButton">
                                    <button onclick="updateProduct()">수정</button>&nbsp;&nbsp;&nbsp;
                                    <button onclick="deleteProduct()">삭제</button>
                                </div>
                                <script>
                                    const updateProduct = () => {
                                        location.href = "/product/update?id=${product.id}";
                                    }
                                    const deleteProduct = () => {
                                        location.href = "/product/delete?id=${product.id}";
                                    }
                                </script>
                            </c:if>
                        </li>
                    </c:forEach>.
                </ul>
            </section>
        </div>
    </section>
    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/product/findAll?page=${paging.page-1}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/product/findAll?page=${i}">${i}</a>
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
                        <a class="page-link" href="/product/findAll?page=${paging.page+1}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
</html>
