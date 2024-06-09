/**
 * 
 */

window.onload = function() {
	const discount = $('#discord').val();
	const discount1 = discount.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	const infoWrap_txtInner = document.getElementById('infoWrap_txtInner');
	const detail = document.getElementById("txtContentText").value;
	infoWrap_txtInner.innerText = detail;
	$('#bk_dis').text(discount1+"원");
};



$(document).on('click','#cart',function() {
	if($('#userid').val() == "") {
		alert('먼저 로그인을 해 주세요.');
		return false;
	}
	// 새 form 엘리먼트를 생성합니다.
	var form = $('<form></form>');

	// form 속성을 설정합니다.
	form.attr('method', 'post');
	form.attr('action',  '/myPage/insertCart.bo');
	
	// 필드를 생성하고 값을 설정합니다.
	var image = $('#bookCover').attr('src');
	var title = $('#bookTitle').text();
	var discount = $('#bk_dis').text();
	var isbn = $('#isbn').val();
	
	form.append('<input type="hidden" name="isbn" value="' + isbn + '">');
	form.append('<input type="hidden" name="title" value="' + title + '">');
	form.append('<input type="hidden" name="image" value="' + image + '">');
	form.append('<input type="hidden" name="discount" value="' + discount + '">');
	
	// form을 body에 추가하고 submit 합니다.
	$('body').append(form);
	form.submit();
})

$(document).ready(function() {
    $('#buy').on('click', function() {
        if($('#userid').val() == "") {
            alert('먼저 로그인을 해 주세요.');
            return false;
        }
        // 새 form 엘리먼트를 생성합니다.
        var form = $('<form></form>');

        // form 속성을 설정합니다.
        form.attr('method', 'post');
        form.attr('action',  '/myPage/insertOrderList.bo');
        
        // 필드를 생성하고 값을 설정합니다.
        var title = $('#bookTitle').text();
        var discount = $('#bk_dis').text();
        var isbn = $('#isbn').val();
        
        form.append('<input type="hidden" name="isbn" value="' + isbn + '">');
        form.append('<input type="hidden" name="title" value="' + title + '">');
        form.append('<input type="hidden" name="discount" value="' + discount + '">');
        
        // form을 body에 추가하고 submit 합니다.
        $('body').append(form);
        form.submit();
    });
});


