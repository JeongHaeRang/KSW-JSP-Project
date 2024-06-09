/**
 * 
 */

$(document).on('click','#cart',function() {
	if($('#flag').val() == 'fail') {
		alert("장바구니에 물건이 담겨져 있지 않습니다.\n우선 장바구니에 물건을 담아주세요.");
	}
})

