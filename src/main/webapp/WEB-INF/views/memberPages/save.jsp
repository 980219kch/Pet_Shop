<%--
  Created by IntelliJ IDEA.
  User: kch80
  Date: 2022-06-07
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="container">
    <h2 class="display-4 fw-normal">회원가입</h2>
    <form action="/member/save" method="post">
        <div class="py-5 text-center">
            <input class="form-control mb-2" type="text" id="memberId" name="memberId" onblur="duplicateCheck()" placeholder="아이디">
            <p id="dup-check-result"></p>
            <input class="form-control mb-2" type="text" id="memberPassword" name="memberPassword" placeholder="비밀번호">
            <input class="form-control mb-2" type="text" name="memberName" placeholder="이름">
            <input class="form-control mb-2" type="text" name="memberEmail" placeholder="이메일">
            <input class="form-control mb-2" type="text" id="memberMobile" name="memberMobile" placeholder="전화번호">
            <input class="form-control mb-2" type="text" id="sample6_postcode" placeholder="우편번호">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            <input class="form-control mb-2" type="text" id="sample6_address" name="memberAddress" placeholder="주소">
            <input class="form-control mb-2" type="text" id="sample6_detailAddress" name="memberAddress" placeholder="상세주소">
            <input class="form-control mb-2" type="text" id="sample6_extraAddress" name="memberAddress" placeholder="참고항목">
            <input class="btn btn-primary" type="submit" value="회원가입">
        </div>
    </form>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post",
            url: "duplicate-check",
            data: {"memberId": memberId},
            dataType: "text",
            success: function (result) {
                if(result == "no") {
                    checkResult.innerHTML = "사용 가능한 아이디 입니다.";
                    checkResult.style.color = "green";
                } else {
                    checkResult.innerHTML = "이미 사용중인 아이디입니다.";
                    checkResult.style.color = "red";
                }
            },error: function () {
                alert("오타체크");
            }
        });
    }
</script>
</html>
