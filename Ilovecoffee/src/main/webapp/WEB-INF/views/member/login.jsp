<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/main_top.jsp" %>
<head>
<style type="text/css">
form {
  background: #FFFBF2;
  display: flex;
  flex-direction: column;
  padding: 0 50px;
  height: 100%;
  justify-content: center;
  align-items: center;
}
form input {
  background: #eee;
  padding: 16px;
  margin: 8px 0;
  width: 85%;
  border: 0;
  outline: none;
  border-radius: 20px;
  box-shadow: inset 7px 2px 10px #babebc, inset -5px -5px 12px #fff;
}
button {
  border-radius: 20px;
  border: none;
  outline: none;
  font-size: 12px;
  font-weight: bold;
  padding: 15px 45px;
  margin: 14px;
  letter-spacing: 1px;
  text-transform: uppercase;
  cursor: pointer;
  transition: transform 80ms ease-in;
}

.form_btn {
  box-shadow: -5px -5px 10px #fff, 5px 5px 8px #babebc;
}
.form_btn:active {
  box-shadow: inset 1px 1px 2px #babebc, inset -1px -1px 2px #fff;
}

.overlay_btn {
   background-color: dark brown;
   color: #746262;
   box-shadow: -5px -5px 10px #795548, 5px 5px 8px #795548;
}

.wrapper {
  width: 100%;
  height: 300px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #FFFBF2;
  overflow: hidden;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
   $("#signup").on("click", function(){
      var userid = $("#userid").val();
      var pwd = $("#pwd").val();      
      
      if (userid == null || userid == "") {
         alert("아이디를 입력해주세요.");
         $("#userid").focus();
         return;
      }else if (pwd == null || pwd == "") {
         alert("비밀번호를 입력해주세요.");
         $("#pwd").focus();
         return;
      }else{
    	  $("#frm").submit();
      }
   }) 
})
</script>
</head>
<!-- 실제작업 공간 시작 -->
   <!-- 메인헤더 -->
      <div class="container-fluid page-header mb-5 position-relative overlay-bottom">
          <div class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5" style="min-height: 400px">
              <h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">Login</h1>
              <div class="d-inline-flex mb-lg-5">
                  <p class="m-0 text-white"><a class="text-white" href="">Home</a></p>
                  <p class="m-0 text-white px-2">/</p>
                  <p class="m-0 text-white">Login</p>
              </div>
          </div>
      </div>
   <!-- 메인헤더 끝-->
  <div class="wrapper">
      <form action="/member/login" method="post" id="frm">
         <span>Use your account</span>
         <input type="text" id="userid" name="userid" placeholder="id">
         <input type="password" id="pwd" name="pwd" placeholder="pw">
         <input type="button" id="signup" class="overlay_btn" value="Sign up" style="width: 300px;">
         <span>아직 회원이 아니신가요?
            <a href="/member/join" style="font-size: 95%;">가입하기</a>
         </span>
      </form>
   </div>
<!-- 실제작업 공간 끝 -->
<!-- footer -->
<%@ include file="../inc/main_bottom.jsp" %>
<!-- footer 끝 -->