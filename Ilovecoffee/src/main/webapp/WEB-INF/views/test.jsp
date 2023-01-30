<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>AJAX DB 연동</title>
<link rel="stylesheet" href="/style/style.css">
<style>
* {
box-sizing: border-box;
}
table {
width: 550px;
}
th, td {
font-size: 14px;
padding: 10px;
border: 1px solid #888;
}
th:first-child {
width: 200px;
}
th:nth-child(2) {
width: 160px;
}
</style>
</head>
<body>
<div id="wrap">
<h1>AJAX DB 연동</h1>
<button type="button" onclick="location.reload()">새로고침</button>
<hr>
<table>
<tbody>
<tr>
<th>
<button type="button" onclick="fnMemberList()">1. 회원목록 요청</button>
</th>
<th>
<button type="button" onclick="idCheck()">2. 입력ID 체크</button>
</th>
<th>
<button type="button" onclick="fnMemberIns()">3. 회원등록</button>
</th>
</tr>
<tr>
<td id="resMemberList"></td>
<td id="resMemberChk">
체크아이디 <input type="text" id="userid" size="9">
</td>
<td id="resMemberIns">
아이디 <input type="text" id="ins_uid" size="9"> <br><br>
이 름 <input type="text" id="ins_uname" size="10">
</td>
</tr>
</tbody>
</table>
</div>
<a class="quantity_modify_btn" data-productNo="${cart.productNo }">변경</a>
<!-- div#wrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="/script/script.js">
/*ajax 장바구니 수량 조절*/
$(".quantity_modify_btn").onclick(function(){
	var productNo = $(this).data("productNo");
	var quantity = $(this).parent("td").find("input").val();
	
	$(".update_productNo").val(productNo);
	$(".update_quantity").val(quantity);
	$(".quantity_updateForm").submit();
});
</script>
</body>
</html>