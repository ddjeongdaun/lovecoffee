<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/main_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src=""></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	//전화번호 정규식, 아이디 정규식
	function validate_phone(hp){
		 var pattern=new RegExp(/^[0-9]*$/g);
		 return pattern.test(hp);//정규식과 일치하면 true
		 /* 0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
		 닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복 */
	 }
	 
	 function validate_userid(id){
		 var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		 return pattern.test(id);
		 /* a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 
		 시작하거나 끝나야 한다는 의미
		 닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미 */
	 }
	
   $("#signup").on("click", function(){
      var pwd = $("#pwd").val();
      var pwd2 = $("#pwd2").val();
      
      var email1 = $("#email1").val();
      var email2 = $("#email2").val();
      $("#email").val(email1+"@"+email2);
      
      var hp1 = $("#hp1").val();
      var hp2 = $("#hp2").val();
      var hp3 = $("#hp3").val();
      $("#hp").val(hp1+"-"+hp2+"-"+hp3);
      
      var zipcode = $("#sample6_postcode").val();
      var address = $("#sample6_address").val();
      var addressDetail = $("#sample6_addressDetail").val();
      
      $("#zipcode").val(zipcode);
      $("#address").val(address);
      $("#addressDetail").val(addressDetail);
      
      
      if (pwd == null || pwd == "") {
          alert("비밀번호를 입력해주세요.");
          $("#pwd").focus();
          return;
      }else if(pwd.length<=2){
    	  alert("비밀번호는 2글자 이상 이어야합니다.");
    	  $("#pwd").focus();
          return;
      }else if (hp2 == null || hp2 == "") {
          alert("전화번호를 입력해주세요.");
          $("#hp2").focus();
          return;
      }else if (hp3 == null || hp3 == "") {
          alert("전화번호를 입력해주세요.");
          $("#hp3").focus();
          return;
      }else if(!validate_phone(hp2) && !validate_phone(hp3)){
    	  alert("전화번호는 숫자만 가능합니다.");
          $("#hp2").focus();
          return;
      }else if (email1 == null || email1 == "") {
         alert("이메일을 입력해주세요.");
         $("#email1").focus();
         return;
      }else if (email2 == null || email2 == "") {
          alert("이메일을 입력해주세요.");
          $("#email2").focus();
          return;
      }else{
    	  $("#frm").submit();
      }
   })
   
	// 선택된 Email 도메인 자동입력  
  	$("#emailDomain").change(function(){
  		var emailDomain = $(this).val();
  		
  		$("input#email2").val(emailDomain);
  		if (emailDomain == "") {
  			$("input#email2").focus();
  		} else {
  			$("input#email1").focus();
  		}
  	})

});

</script>
</head>
<!-- 실제작업 공간 시작 -->
	<!-- 메인헤더 -->
		<div class="container-fluid page-header mb-5 position-relative overlay-bottom">
		    <div class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5">
		        <h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">myPage</h1>
		        <div class="d-inline-flex mb-lg-5">
		            <p class="m-0 text-white"><a class="text-white" href="">Home</a></p>
		            <p class="m-0 text-white px-2">/</p>
		            <p class="m-0 text-white">myPage</p>
		        </div>
		    </div>
		</div>
	<!-- 메인헤더 끝-->
	<div class="wrapper">
		<form id="frm" action="/member/updateMember" method="post">
			<div>
			<label>이름</label>
			<input type="text" id="name" name="name" placeholder="name" 
					value="${vo.name }" readonly="readonly">
			</div>
			
			<div>
			<label>아이디</label>
			<input type="text" id="userid" name="userid" placeholder="id" 
					value="${vo.userid }" readonly="readonly">
			</div>

			<div>
			<label>비밀번호</label>
			<input type="password" id="pwd" name="pwd" placeholder="pw">
			</div>
			
			<div style="height:72px;">
			<label>비밀번호 확인</label>
			<input type="password" id="pwd2" name="pwd2" placeholder="비밀번호 확인">
			</div>
			
			<input type="hidden" id="hp" name="hp">
			<div>
			<label>휴대폰 번호</label>
			<select id="hp1" name="hp1">
				<option
				<c:if test="${hp1 eq '010' }">
				selected
				</c:if>
				>010</option>
				<option
				<c:if test="${hp1 eq '011' }">
				selected
				</c:if>
				>011</option>
			</select>&nbsp;&nbsp;&nbsp;-
			<input type="text" id="hp2" name="hp2" value="${hp2 }">-
			<input type="text" id="hp3" name="hp3" value="${hp3 }">
			</div>
			
			<div>
			<label>이메일</label>
			<input type="text" id="email1" name="email1" maxlength="20" value="${email1 }">
			<span>@</span>
			<input type="text" id="email2" name="email2" maxlength="20" value=
				<c:if test="${!empty email3 }">
				${email3 }
				</c:if>
				<c:if test="${empty email3 }">
				${email2 }
				</c:if>
			>
			&nbsp;
			<select id="emailDomain">
				<option
				<c:if test="${!empty email3}">
				selected="selected" value="${email3 }"
				</c:if>
				>직접입력</option>
				<option value="naver.com"
					<c:if test="${email2 eq 'naver.com'}">
				selected="selected"
				</c:if>
				>naver.com</option>
				<option value="daum.net"
				<c:if test="${email2 eq 'daum.net'}">
				selected="selected"
				</c:if>
				>daum.net</option>
			</select>
			<input type="hidden" name="email" id="email">
			</div>
			<input type="hidden" name="zipcode" id="zipcode">
			<input type="hidden" name="address" id="address">
			<input type="hidden" name="addressDetail" id="addressDetail">
			<div>
				<label>주소</label>
				<input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호"
					value="${vo.zipcode }">
				<input type="button" id="finZipcode" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			</div>
			<div>
				<label>&nbsp;</label>
				<input type="text" name="sample6_address" id="sample6_address" placeholder="주소"
					value="${vo.address }"><br>
			</div>
			<div>
				<label>&nbsp;</label>
				<input type="text" name="sample6_detailAddress" id="sample6_detailAddress" 
					value="${vo.addressDetail }" placeholder="상세주소">
			</div>
			<div>
				<label>&nbsp;</label>
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
			</div>
			
			<br><br>
			<div>
			<input type="button" class="overlay_btn" id="signup" name="signup" value="회원정보수정">
			</div>
			<br>
		</form>
	</div>

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
<!-- 실제작업 공간 끝 -->
<!-- footer -->
<%@ include file="../inc/main_bottom.jsp" %>
<!-- footer 끝 -->