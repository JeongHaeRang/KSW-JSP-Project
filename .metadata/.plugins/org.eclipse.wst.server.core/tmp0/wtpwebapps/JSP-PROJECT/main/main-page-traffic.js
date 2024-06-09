/**
 * 
 */
// 실패 시 경고창을 띄워줍니다.
setTimeout(ready, 1000);
function errFunc(e) {
	alert("실패: " + e.status);
}
function susFuncJson1(d) {
	var str = "";
	var str1 = "";
	str += "<h2>실시간 사람들이 많이 찾아 보는 책</h2>"
	str += "<div id='traffic'>"
	str += "<!-- 사람들의 책 상세페이지를 들어간 횟수에 따른 추천 목록 -->"
	$('#trafficIsNotNull').html(str1);
	$.each(d, function(index, item) {
		// item.discount의 돈 단위로 서식 바꾸기
		console.log("index : " + index);
		// 화폐 정규식 표현
		str += "<ul>";
		str += "	<input type='hidden' name='isbn' value=" + item.isbn + ">";
		str += '	<input type="hidden" name="title" value="' + item.title + '">';
		str += '	<input type="hidden" name="image" value="' + item.image + '">';
		str += '	<input type="hidden" name="author" value="' + item.author + '">';
		str += '	<input type="hidden" name="discount" value="' + item.discount + '">';
		str += '	<input type="hidden" name="publisher" value="' + item.publisher + '">';
		str += '	<input type="hidden" name="description" value="' + item.description + '">';
		str += '	<input type="hidden" name="pubdate" value="' + item.pubdate + '">';
		str += "    <img name='image' id='image' alt='" + item.title + "' src='" + item.image + "'width='304' height='228' >";
		str += "    <li name='title' id='title'>" + item.title + "</li>";
		str += "</ul>";
	});
	str += "</div>" 
	console.log(str);
	
	$('#trafficIsNotNull').html(str);
}
function susFuncJson2(d) {

}
function ready() {
	$.ajax({
		url: "/traffic/traffic.traffic",
		type: "post",
		dataType: "json",
		success: function(data) {
			susFuncJson1(data);
		},
		error: errFunc
	});
	/*$.ajax({
		url:"/traffic/order-traffic.traffic",
		type:"post",
		dataType: "json",
		success: function(data) {
			susFuncJson2(data);
		},
		error: errFunc
	});*/
	return false;
};

// ul 태그 안의 내용을 form 태그를 만들어 보냄
$(document).on('click', 'ul', function() {
	var ulElement = $(this); // 클릭된 ul 요소를 가져옵니다.
	// ul 요소 안에 있는 정보들을 가져옵니다.
	var isbn = ulElement.find('input[name="isbn"]').val();
	var description = ulElement.find('input[name="description"]').val();
	var imageSrc = ulElement.find('input[name="image"').val();
	var title = ulElement.find('input[name="title"]').val();
	var author = ulElement.find('input[name="author"]').val();
	var publisher = ulElement.find('input[name="publisher"]').val();
	var discount = ulElement.find('input[name="discount"]').val();
	if (discount == ' 0원') {
		alert("해당 책은 판매하지 않습니다. 다른 책을 골라 주세요");
		return false;
	}
	var pubdate = ulElement.find('input[name="pubdate"]').val();
	// 새 form 엘리먼트를 생성합니다.
	var form = $('<form></form>');

	// form 속성을 설정합니다.
	form.attr('method', 'post');
	form.attr('action', '/search/bookDetails.bo');

	// 필드를 생성하고 값을 설정합니다.
	form.append('<input type="hidden" name="isbn" value="' + isbn + '">');
	form.append('<input type="hidden" name="description" value="' + description + '">');
	form.append('<input type="hidden" name="imageSrc" value="' + imageSrc + '">');
	form.append('<input type="hidden" name="title" value="' + title + '">');
	form.append('<input type="hidden" name="author" value="' + author + '">');
	form.append('<input type="hidden" name="publisher" value="' + publisher + '">');
	form.append('<input type="hidden" name="discount" value="' + discount + '">');
	form.append('<input type="hidden" name="pubdate" value="' + pubdate + '">');

	// form을 body에 추가하고 submit 합니다.
	$('body').append(form);
	form.submit();

});
