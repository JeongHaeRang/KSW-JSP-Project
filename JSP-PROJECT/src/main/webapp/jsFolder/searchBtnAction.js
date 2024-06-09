/**
 * 
 */
$(function() {
	$('#searchBtn').click(function() {
		// 새 form 엘리먼트를 생성합니다.
		var form = $('<form></form>');

		// form 속성을 설정합니다.
		form.attr('method', 'post');
		form.attr('action', '/search/SearchView.bo');
	});
});