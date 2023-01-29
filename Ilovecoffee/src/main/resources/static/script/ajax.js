function idCheck( ) {
	var userid = document.getElementById("userid").value;
	var xmlHttpReq = new XMLHttpRequest( );
	
	xmlHttpReq.onload = function( ){ 
		var result = JSON.parse(this.responseText); 
		var res = (result.rowCnt == 1) ? "&nbsp;중복된 아이디" : "&nbsp;사용가능한 아이디"; 
		document.getElementById("resMemberChk").innerHTML = res;
		
		if(result.rowCnt != 1){
			document.getElementById("idCheckResult").value="true";
		}else {
			document.getElementById("idCheckResult").value="false";
		}
 	}
	 xmlHttpReq.open("GET","/idCheck?userid="+userid);
	 xmlHttpReq.send( ); 
}

$("#userid").change(function(){
	document.getElementById("resMemberChk").innerHTML = "";
	document.getElementById("idCheckResult").value="false";
})