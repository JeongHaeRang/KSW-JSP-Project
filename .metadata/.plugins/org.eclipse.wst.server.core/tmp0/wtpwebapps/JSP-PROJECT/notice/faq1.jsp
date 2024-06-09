<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ_1</title>

<style>
/* FAQ */
.faq {
	border-bottom: 0px solid #ddd;
	margin: 1em 0;
}

.faq .faqHeader {
	position: relative;
	zoom: 1
}

.faq .faqHeader .showAll {
	position: absolute;
	bottom: 0;
	right: 0;
	border: 0;
	padding: 0;
	overflow: visible;
	background: none;
	cursor: pointer
}

.faq .faqBody {
	margin: 0;
	padding: 0
}

.faq .faqBody .article {
	list-style: none
}

.faq .q {
	margin:
}

.faq .q a {
	display: block;
	text-align: left;
	background: url("faq1_icon_q.png") no-repeat 0 0;
	padding: 0 0 0 35px;
	font-size: 18px;
	color: #5e5e5e;
	font-weight: bold;
	line-height: 27px;
	cursor: pointer;
	margin: 10px 0;
	!
	important
}

.faq .q a:hover, .faq .q a:active, .faq .q a:focus {
	
}

.faq .a {
	background: #f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;
	padding: 10px 75px 10px 75px;
	font-size: 16px;
	color: #444444;
	line-height: 22px;
	border-top: 1px solid #bdbdbd;
	margin: 5px 0 0 0;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js">	
</script>
</head>
<body>
	<div class="faq">
		<div class="faqHeader">
			<!--button type="button" class="showAll">답변 모두 여닫기</button-->
		</div>
		<ul class="faqBody">


			<li class="article" id="a1">
				<p class="q">
					<a href="#a1">회원 가입과 탈퇴는 어떻게 하나요?</a>
				</p>
				<p class="a">
					회원가입 : 회원가입 (회원가입 주소 기입하기) 
					<br> <br> 
					회원탈퇴 : 마이페이지 > 회원탈퇴 > 확인
				</p>
			</li>


			<li class="article" id="a2">
				<p class="q">
					<a href="#a2">ID/비밀번호를 잊어버렸습니다.</a>
				</p>
				<p class="a">
					아이디(ID)는 회원으로 가입한 분의 이름과 생년월일로 확인이 가능합니다. 
					<br> <br> 
					비밀번호는 회원으로 가입한 분의 ID, 이름, 생년월일로 확인이 가능하며, 등록한 메일 또는 휴대폰으로 임시 비밀번호를
					알려드립니다.
				</p>
			</li>

			<li class="article" id="a3">
				<p class="q">
					<a href="#a3">휴대폰 인증이 안 되는 경우가 있나요?</a>
				</p>
				<p class="a">타인 및 법인 명의, 일시 정지된 휴대폰 등의 경우 휴대폰 인증이 불가합니다. <br>
				휴대폰 인증이 불가한 경우 <br>
				ㅇ본인명의 인증이 불가한 기기(휴대폰): 선불 휴대폰 <br>
				ㅇ본인인증이 불가능한 상태 <br>
				- 분실 또는 일시 정지(이용자의 요청 또는 미납 상태) 상태 <br>
				- 법인 명의로 개통 <br>
				- 이동 통신사에 미등록된 휴대폰(해지 또는 미개통)
				</p>
			</li>
		</ul>
	</div>

	<script>
		jQuery(function($) {
			// Frequently Asked Question
			var article = $('.faq>.faqBody>.article');
			article.addClass('hide');
			article.find('.a').hide();
			article.eq(0).removeClass('hide');
			article.eq(0).find('.a').show();
			$('.faq>.faqBody>.article>.q>a').click(function() {
				var myArticle = $(this).parents('.article:first');
				if (myArticle.hasClass('hide')) {
					article.addClass('hide').removeClass('show');
					article.find('.a').slideUp(100);
					myArticle.removeClass('hide').addClass('show');
					myArticle.find('.a').slideDown(100);
				} else {
					myArticle.removeClass('show').addClass('hide');
					myArticle.find('.a').slideUp(100);
				}
				return false;
			});
			$('.faq>.faqHeader>.showAll').click(function() {
				var hidden = $('.faq>.faqBody>.article.hide').length;
				if (hidden > 0) {
					article.removeClass('hide').addClass('show');
					article.find('.a').slideDown(100);
				} else {
					article.removeClass('show').addClass('hide');
					article.find('.a').slideUp(100);
				}
			});
		});
	</script>
</body>
</html>