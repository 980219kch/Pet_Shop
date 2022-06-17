<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-17
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="display-4 fw-normal">myPage</h2>
    <div class="py-5">
        <form action="/product/update" method="post" name="updateForm">
            상품이름 <input class="form-control mb-2" type="text" name="productName" value="${updateProduct.productName}">
            <select class="form-select mb-4" name="productKind">
                <option selected>${updateProduct.productKind}</option>
                <option value="사료">사료</option>
                <option value="간식">간식</option>
                <option value="용품">용품</option>
            </select>
            상품가격 <input class="form-control mb-2" type="text" name="productPrice" value="${updateProduct.productPrice}">
            상품재고 <input class="form-control mb-2" type="text" name="productCount" value="${updateProduct.productCount}">
            상품내용 <input class="form-control mb-2" type="text" name="productDetail" value="${updateProduct.productDetail}">
            상품사진 <img src="${pageContext.request.contextPath}/upload/${updateProduct.productFileName}" alt="">
            변경할 상품사진 <input type="file" name="productFile">
            <input class="btn btn-primary" type="button" onclick="update()" value="저장하기">
        </form>
    </div>
</div>
</body>
<script>
    const update = () => {
        updateForm.submit();
    }
</script>
</html>
