<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<title>계정 교회</title>
</head>
<body>



				
  
  
  
    <!-- Contact Section -->
  <div class="w3-container w3-padding-64" id="contact">
    <h1>픽업신청 수정</h1><br>
    <p class="w3-text-blue-black w3-large"><b>※ 유아 및 어린이 회원은 승.하차가 익숙해질 때까지 보호자께서 동승하여 주시기 바랍니다.</b></p>
    <p class="w3-text-blue-black w3-large"><b>※ 교회버스 승.하차 시 시간보다 10분 정도 일찍 나와주시기 바라며, 손을 흔들어 탑승 의사를 표현해 주시기 바랍니다.</b></p>
    <p class="w3-text-blue-black w3-large"><b>※ 교회버스 도착시간 보다 지연될 경우 도로사정, 차량정체 등으로 인한 지연이오니 다른 교통수단을 이용해 주시기 바랍니다.</b></p>
	<form:form modelAttribute="pickBoard" id="form" action="/pickup/add?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" method="post">

	
<form:input path="pbname" class="w3-input w3-padding-16" id="uname" placeholder="성명" value="${uname}" type="text" />


	
	<form:input path="pbtel" class="w3-input w3-padding-16" placeholder="전화번호" type="text" />
	<br>

	

	
	<div class="w3-third" style="width: 15%;">
		  <label class="w3-text-teal"><b>주소</b></label>
  	<form:input path="pbaddress" id="pbaddress" type="hidden" />
	<input class="w3-border w3-light-grey" id="sample6_postcode" placeholder="우편번호" type="text" />
	</div>


	<button type="button" class="w3-aqua" onclick="sample6_execDaumPostcode()" style="margin-top: 20px;">우편번호 찾기</button>
	 		<div style="width: 30%; padding-top: 10px;">
	<input style="width: 100%;" class="w3-border" id="sample6_address" placeholder="주소" type="text" />
	</div>
	 	 		<div style="width: 50%; padding-top: 10px;">
<input type="text" id="sample6_detailAddress" style="width: 30%;" class="w3-border" placeholder="상세주소">
<input type="text" id="sample6_extraAddress" style="width: 30%;" class="w3-border" placeholder="참고항목">

	</div>
	  <br>
<!-- 	  <div class="w3-half" style="padding-top: 10px;"> -->
<!-- 		<input id="addr2" class="w3-input w3-border" placeholder="" type="text" /> -->
<!-- 		<input id="addr3" class="w3-input w3-border" placeholder="" type="text" /> -->
<!-- 		</div> -->
	  <div style="margin-top: 30px;">
	<button type="button" onclick="check()" style="margin-top: 30px;" class="w3-button w3-black w3-margin-bottom"><i class="fa fa-paper-plane w3-margin-right"></i>신청</button>
</div>
  </form:form>
  </div>
  

  
</body>





<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">




function check() {
	$("#pbaddress").val($("#sample6_address").val() + $("#sample6_extraAddress").val() + $("#sample6_detailAddress").val());
	$("#form").submit();
}

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

</script>


</html>