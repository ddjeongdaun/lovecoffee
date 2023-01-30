//아이디 정규식
function validate_userid(id){
	 var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	 return pattern.test(id);
	 /* a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 
	 시작하거나 끝나야 한다는 의미
	 닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미 */
 }

//아이디 중복검사
function idCheck(){
	var userid=$('.id_input').val();
	
	if(!validate_userid(userid) || userid.length<3 || userid == null || userid == ""){
		alert("아이디는 문자나 숫자, 2글자 이상만 가능합니다.");
		$("#userid").focus();
		return;
	}
	
	var res="";
	
	$.ajax({
			type : "get",
			url : "/idCheck",
			data : {userid : userid},
			success : function(data){
				if(data==1){
					document.getElementById("resMemberChk").innerHTML = "중복된 아이디입니다";
					document.getElementById("idCheckResult").value="false";
				}else{
					document.getElementById("resMemberChk").innerHTML = "사용가능한 아이디입니다";
					document.getElementById("idCheckResult").value="true";
				}
			},
			error:function(){
				alert("에러입니다");
			}
	});
}

$("#userid").change(function(){
	document.getElementById("resMemberChk").innerHTML = "";
	document.getElementById("idCheckResult").value="false";
})

$(document).ready(function(){
});