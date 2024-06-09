/**
 * 
 */
function errFunc(e) {
	alert("실패: " + e.status);
}
$(document).ready(function() {
	if ($('#flag').val() == "false") {
		alert('이미 장바구니에 담겨져 있습니다.\n장바구니를 확인해 주세요.')
	};

	$('.creditbtn').click(function() {
		// 체크된 모든 체크박스를 찾아 그 부모인 tr 요소의 정보를 가져옵니다.
		$('input.itemCheckbox:checked').each(function() {
			var $tr = $(this).closest('tr'); // 체크박스가 위치한 tr 요소
			var cartNum = $tr.find('input[name="cartNum"').val(); // 카트 번호
			var title = $tr.find('input[name="title"]').val(); // 제목
			var discount = $tr.find('input[name="disc"]').val(); // 할인 가격
			var quantity = $tr.find('.count-text').val(); // 수량
			var isbn = $tr.find('input[name="isbn"]').val();
			console.log(isbn);
			$.ajax({
				url: "/myPage/insertOrderList.bo",
				type: "post",
				data: {
					isbn: isbn,
					cartNum: cartNum,
					title: title,
					discount: discount,
					quantity: quantity
				},success: function(data) {
					location.href="/myPage/OrderList.bo";
				},
				 error: errFunc
			});

		});
	});
	// 페이지 로드 시 총액 계산
	updateTotalPrice();
	// 체크박스 변경 시 총액 재계산
	$(document).on('change', 'input[type="checkbox"]', function() {
		updateTotalPrice();
	});
	// 수량 버튼 클릭 시에도 총액 재계산 - 기존 count-btn 클릭 이벤트 내에 추가
	$('.count-btn').click(function() {
		var btn = $(this);
		var tr = btn.closest('tr');
		var countText = tr.find('.count-text');
		var text = parseInt(countText.val(), 10);
		var cartNum = tr.find('input[name="cartNum"').val();
		if (btn.val() == '128465') {
			trash(cartNum);
		} else if (btn.val() == '8592') {
			if (text == 1) {
				return false;
			}
			text -= 1;
			countText.val(text);
		} else if (btn.val() == '8594') {
			text += 1;
			countText.val(text);
		}
		updateTotalPrice(); // 이 부분을 기존의 수량 변경 코드 뒤에 추가
	});

});
function updateTotalPrice() {
	var total = 0;
	$('.cartResult').each(function() {
		var $this = $(this);
		var isChecked = $this.find('input[type="checkbox"]').is(':checked');
		if (isChecked) {
			var price = parseInt($this.find('input[name="disc"]').val(), 10);
			var quantity = parseInt($this.find('.count-text').val(), 10);
			total += price * quantity;
		}
	});
	$('#totalPrice').text(total);
}

function trash(cartNum) {
	var form = $('<form></form>');

	// form 속성을 설정합니다.
	form.attr('method', 'post');
	form.attr('action', '/delete/CartBook.bo');
	// 필드를 생성하고 값을 설정합니다.
	form.append('<input type="hidden" name="cartNum" value="' + cartNum + '">');

	// form을 body에 추가하고 submit 합니다.
	$('body').append(form);
	form.submit();
}
