//수량 조정 (+/-)
$(".plusBtn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});

$(".minusBtn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);
	}
});

$(document).ready(function(){
	setTotal();
});

/*총 합계 function*/
function setTotal(){
	var totalPrice=0;
	
	$(".cart_info_td").each(function(index, element){
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
	});
	
	/* 가격 pattern/ Javscript Number 객체의 toLocaleString() */
	$(".totalPrice_span").text(totalPrice.toLocaleString());
}
