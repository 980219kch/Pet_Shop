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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js"></script>
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
    <div style="float: right;">
        총 결제금액: ${totalPrice}
        <button onclick="pay()">결제하기</button>
    </div>
</body>
<script>
    const pay = () => {
        const IMP = window.IMP;
        IMP.init("imp73350321");
        IMP.request_pay({
            pg: "kakaopay",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '결제',
            amount: `${totalPrice}`,
            buyer_email: 'kimch8063@naver.com',
            buyer_name: '${sessionScope.loginMemberId}',
            buyer_tel: '010-6605-8063',
            buyer_addr: '인천광역시 연수구 송도동',
            buyer_postcode: '123-456'
        }, function (rsp) {
            if(rsp.success) {
                const msg = "결제가 완료되었습니다.";
                alert(msg);
                location.href = "/";
            } else {
                let msg = "결제에 실패하였습니다.";
                msg += rsp.error_msg;
                alert(msg);
            }
        });
    }
</script>
</html>
