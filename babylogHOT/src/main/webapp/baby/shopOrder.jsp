<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제하기</title>

<!-- style -->
<link rel="stylesheet" href="${cpath}/css/reset.css">
<link rel="stylesheet" href="${cpath}/css/common.css">
<link rel="stylesheet" href="${cpath}/css/shopOrder.css">


<!-- 슬릭 -->
<link rel="stylesheet" type="text/css" href="${cpath}/css/slick.css" />
<link rel="stylesheet" type="text/css" href="${cpath}/css/slick-theme.css" />

<!-- 웹아이콘 -->
<script src="https://kit.fontawesome.com/e76461f593.js" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
    
    <main>
       <div id="login">
        <div class="container">
            <div class="login_wrap">
                <!-- Heading -->
                <div class="item logo">
                  <div class="logo">
                    <a href="${cpath}/main.do">
                      <img src="icon/logo_1.png" alt="">
                    </a>
                  </div>
                
                </div>
                
                <!-- Form -->
                <form  action="" method="post">
                  <!-- 주문자성함 -->
                  <div class="input__block">
                     <label class="name" for="id">주문자 성함</label>
                     <input type="text" placeholder="성함을 입력해주세요" id="id"/>
                  </div>
                  <!-- 전화번호 -->
                  <div class="input__block">
                    <label class="name" for="tel">전화번호</label>
                     <input type="tel" placeholder="010" id="tel"/>
                  </div>
                  <!-- 배송지 입력 -->
                  <div class="input__block">
                    <label class="name" for="re_pwd">배송지 입력</label>
                    <input type="text" placeholder="배송지를 입력하세요"  id="re_pwd"/>
                  </div>
                  <!-- 주소검색 -->
                  <div class="input__block">
                    <label class="name" for="name">우편번호 검색</label>
                    <input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색">
                  </div>
                  
                  <!-- 우편번호 -->
                  <div class="input__block">
                    <label class="name" for="name">우편번호</label>
                    <input type="text" placeholder="우편번호"  id="sample6_postcode"/>
                  </div>
                  <!-- 주소 -->
                  <div class="input__block">
                    <label class="name" for="nickname">주소</label>
                    <input type="text" placeholder="주소"  id="sample6_address" />
                  </div>
                  <!-- 상세주소 -->
                  <div class="input__block">
                    <label class="name" for="nickname">상세주소</label>
                    <input type="text" placeholder="상세주소"  id="sample6_extraAddress" />
                  </div>
                  <!-- 뭔지 모를 -->
                   <div class="input__block">
                    <label class="name" for="nickname">추가주소</label>
                    <input type="text" placeholder="추가주소"  id="sample6_detailAddress" />
                  </div>

                  <!-- 결제방법 -->

                    <button type = "button" class="order__btn" id = "check_module" onclick="paypay()">
                      결제 하기
                    </button>

                </form>


              </div>
            
        </div>
        <!-- container -->
        </div>
        <!-- //login -->
        <script>
        	window.addEventListener('load', () => {
      		const forms = document.getElementsByClassName('validation-form');
      
      		Array.prototype.filter.call(forms, (form) => {
        		form.addEventListener('submit', function (event) {
          			if (form.checkValidity() === false) {
            			event.preventDefault();
            			event.stopPropagation();
          			}
          			form.classList.add('was-validated');
        			}, false);
      			});
    		}, false);
		</script>
    </main>
  
<jsp:include page="footer.jsp" flush="true"/>

<!-- script -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${cpath}/js/slick.min.js"></script>
<!-- 생년월일  -->
<script src="${cpath}/js/birth.js"></script>

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
</script>
 
  <script>
	function paypay(){
		console.log("ck")
        var IMP = window.IMP; // 생략가능
        IMP.init('imp73015381'); 
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'kakaopay.TC0ONETIME', 
            pay_method: 'card',
            merchant_uid: 'ORD20180131-0000011' + new Date().getTime(),     
            name: '일기 제작',
            amount: '42,000', 
            buyer_email: 'iamport@siot.do',
            buyer_name: '선경주',
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
        		Swal.fire({
  				  title: "결제 완료 ! ",
  				  icon: 'success',
  				  showCancelButton: false,
  				  confirmButtonColor: '#3085d6',
  				  cancelButtonColor: '#d33',
  				  confirmButtonText: '결제확인',
  				  cancelButtonText: '취소'
  				}).then((result) => {
  				  if (result.value) {
  					  location.href="${cpath}/shopOrderFinish.do";
  				  }
  				})
               
            } else {
        		Swal.fire({
  				  title: "결제 실패 ! ",
  				  icon: 'error',
  				  showCancelButton: false,
  				  confirmButtonColor: '#3085d6',
  				  cancelButtonColor: '#d33',
  				  confirmButtonText: '돌아가기',
  				  cancelButtonText: '취소'
  				}).then((result) => {
  				  if (result.value) {
  					  location.href="${cpath}/shopOrder.do";
  				  }
  				})
            }
          
	});
        };

</script>


</body>
</html>