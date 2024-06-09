/**
 * 
 */
$(document).ready(function() {
	$('.insertBtn').click(function() {
		var rating = $('#rating').val();
		var reply = $('#reviewContent').val();
		var isbn = $('#isbn').val();
		var ordernum = $('#ordernum').val();
		if (reply.length < 1) {
			alert("리뷰 내용를 입력해 주세요");
			$('#reviewContent').focus();
			return false;
		}
		// form 태그 생성
		var form = $('<form></form>');
		// form 속성을 설정합니다.
	form.attr('method', 'post');
	form.attr('action',  '/reply/insertReply.bo');
		// 필드 생성 및 값 설정
		form.append('<input type="hidden" name="rating" value="' + rating + '">');
		form.append('<input type="hidden" name="reply" value="' + reply + '">');
		form.append('<input type="hidden" name="isbn" value="' + isbn + '">');
		form.append('<input type="hidden" name="ordernum" value="' + ordernum + '">');
		// form을 body에 추가하고 submit 합니다.
		$('body').append(form);
		form.submit();
		if (form.submit()) {
			console.log('서브밋 실행함')
		}
	});
})