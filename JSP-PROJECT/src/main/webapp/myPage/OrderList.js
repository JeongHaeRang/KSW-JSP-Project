/**
 * 
 */
$(document).ready(function() {
	$('.btn').click(function() {
		var $tr = $(this).closest('tr');
		var flag = $tr.find('input[name="flag"]').val();
		var isbn = $tr.find('input[name="isbn"]').val();
		var ordernum = $tr.find('input[name="ordernum"').val();
		var form = $('<form></form>');
		if(flag !== "리뷰작성"){
			// form 속성을 설정합니다.
			form.attr('method', 'post');
			form.attr('action', '/book/writeReply.bo');
			// 필드 생성 및 값 설정
			form.append('<input type="hidden" name="isbn" value="' + isbn + '">');
			form.append('<input type="hidden" name="ordernum" value="' + ordernum + '">');
			// form을 body에 추가하고 submit 합니다.
			$('body').append(form);
			form.submit();
		} else {
			alert("이미 리뷰가 작성되었습니다.")
		}
	})
});

