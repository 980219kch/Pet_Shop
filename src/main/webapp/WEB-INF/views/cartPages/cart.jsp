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
        table th {
            border-bottom: 1px solid black;
            padding: 10px;
        }
        table td {
            border-bottom: 1px solid black;
            padding: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <h2 style="text-align: center;">장바구니</h2><br>
    <table>
        <form>
            <tr>
                <th><input type="checkbox" class="all_check_input" checked>&nbsp;전체 선택하기</th>
                <th colspan="2" style="padding-left: 130px;">상품정보</th>
                <th>상품금액</th>
                <th>개수</th>
                <th>총합</th>
                <th></th>
            </tr>
            <c:forEach items="${cartList}" var="cart">
                <tr>
                    <td class="cart_info_td">
                        <input type="checkbox" class="individual_cart_checkbox" checked>
                        <input type="hidden" class="individual_product_price" value="${cart.productPrice}">
                        <input type="hidden" class="individual_total_price" value="${cart.productPrice * cart.productCount}">
                    </td>
                    <td style="width: 170px"><img src="${pageContext.request.contextPath}/upload/${cart.productFileName}" alt="" width="100" height="100"></td>
                    <td>${cart.productName}</td>
                    <td>${cart.productPrice}</td>
                    <td>${cart.productCount}</td>
                    <td>${cart.productPrice * cart.productCount}</td>
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
        총 결제금액: <span class="finalTotalPrice_span"></span>
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
            amount: $(".finalTotalPrice_span").text(),
            buyer_email: '${member.memberEmail}',
            buyer_name: '${member.memberName}',
            buyer_tel: '${member.memberMobile}',
            buyer_addr: '${member.memberAddress}'
        }, function (rsp) {
            if(rsp.success) {
                const msg = "결제가 완료되었습니다.";
                alert(msg);
                location.href = "/a";
            } else {
                let msg = "결제에 실패하였습니다.";
                msg += rsp.error_msg;
                alert(msg);
            }
        });
    }
    $(".all_check_input").click(function () {
        if($(".all_check_input").is(":checked")) {
            $(".individual_cart_checkbox").prop("checked", true);
        } else {
            $(".individual_cart_checkbox").prop("checked", false);
        }
        setTotalInfo($(".cart_info_td"));
    });
    $(".individual_cart_checkbox").click(function() {
        const total = $(".individual_cart_checkbox").length;
        const checked = $(".individual_cart_checkbox:checked").length;
        if(total != checked) {
            $(".all_check_input").prop("checked", false);
        } else {
            $(".all_check_input").prop("checked", true);
        }
        setTotalInfo($(".cart_info_td"));
    });
    $(document).ready(function() {
        setTotalInfo();
    });

    $(".individual_cart_checkbox").on("change", function() {
        setTotalInfo($(".cart_info_td"));
    })
    function setTotalInfo() {
        let totalPrice = 0;
        let finalTotalPrice = 0;

        $(".cart_info_td").each(function (index, element) {
            if($(element).find(".individual_cart_checkbox").is(":checked") === true) {
                totalPrice += parseInt($(element).find(".individual_total_price").val());
            }
        });
        finalTotalPrice = totalPrice;
        $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
    }

</script>
</html>
