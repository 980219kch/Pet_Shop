<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-08
  Time: 오후 3:21
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
    <div class="container">
        <h2 class="display-4 fw-normal">상품등록</h2>
        <form action="/product/save" method="post" enctype="multipart/form-data">
            <div class="py-5">
                <input class="form-control mb-4" type="text" name="productName" placeholder="상품이름">
                <select class="form-select mb-4" name="productKind">
                    <option selected>상품종류 선택</option>
                    <option value="사료">사료</option>
                    <option value="간식">간식</option>
                    <option value="용품">용품</option>
                </select>
                <input class="form-control mb-4" type="text" name="productPrice" placeholder="상품가격">
                <input class="form-control mb-4" type="text" name="productCount" placeholder="상품개수">
                <input class="form-control mb-4" type="text" name="productDetail" placeholder="상품내용">
                <input type="file" name="productFile">
                <input class="btn btn-primary" type="submit" value="등록">
            </div>
        </form>
    </div>
</body>
</html>
