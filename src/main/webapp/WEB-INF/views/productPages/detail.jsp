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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <table style="margin-top: 80px; height: 300px; width: 60%; margin-left: auto; margin-right: auto">
        <tr>
            <td style="width: 50%;">
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

    <c:if test="${not empty sessionScope.loginMemberId}">
        <div class="container mt-5">
            <h2>리뷰</h2>
            <div id="review-write" class="input-group mb-3">
                <div class="form-floating">
                    <input type="text" id="reviewWriter" class="form-control" value="${sessionScope.loginMemberId}" readonly>
                    <label for="reviewWriter">작성자</label>
                </div>
                <div class="form-floating">
                    <input type="text" id="reviewContents" class="form-control" placeholder="내용">
                    <label for="reviewContents">내용</label>
                </div>
                <button onclick="reviewWrite()" class="btn btn-primary">리뷰작성</button>
            </div>
    </c:if>
            <div id="review-list">
                <table class="table">
                    <tr>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                    </tr>
                    <c:forEach items="${reviewList}" var="review">
                        <tr>
                            <td>${review.reviewWriter}</td>
                            <td>${review.reviewContents}</td>
                            <td><fmt:formatDate value="${review.reviewCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
</body>
<script>
    const reviewWrite = () => {
        const productId = `${product.id}`;
        const reviewWriter = document.getElementById("reviewWriter").value;
        const reviewContents = document.getElementById("reviewContents").value;
        $.ajax({
            type: "post",
            url: "/review/save",
            data: {
                "productId": productId,
                "reviewWriter": reviewWriter,
                "reviewContents": reviewContents
            },
            dataType: "json",
            success: function (result) {
                console.log(result)
                let output = "<table class='table'>";
                output += "<tr><th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].reviewWriter+"</td>";
                    output += "<td>"+result[i].reviewContents+"</td>";
                    output += "<td>"+moment(result[i].reviewCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('review-list').innerHTML = output;
                document.getElementById('reviewContents').value='';
            }, error: function () {
                alert("오류");
            }

        });
    }
</script>
</html>
