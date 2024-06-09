$(document).ready(function() {
	// daum 주소 api 호출 함수
	window.sample4_execDaumPostcode = function() {
		new daum.Postcode({
			oncomplete: function(data) {
				var roadAddr = data.roadAddress; // 도로명 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				$('#sample4_postcode').val(data.zonecode);
				$('#sample4_roadAddress').val(roadAddr);
			}
		}).open();
	};

	// 패스워드 확인 체크
	$('#confirmPassword').on('keyup', function() {
		var password = $("#password").val();
		var confirmPassword = $(this).val();

		if (password !== confirmPassword) {
			$("#passwordMessage").text("비밀번호가 일치하지 않습니다.").css('color', 'red');
		} else {
			$("#passwordMessage").text("비밀번호가 일치합니다.").css('color', 'green');
		}
	});

	// 폼 제출 처리
	$('#signup').on('click', function(e) {
		e.preventDefault(); // 기본 폼 제출 동작 방지
		// 아이디 유효성 검사
		var userid = $('#userid').val();
		var password = $('#password').val();
		var email = $('#useremail1').val();
		var pass = $('#passwordMessage').text();
		var username = $('#username').val();
		// 생일 입력 검사
		var birthDate = new Date($('#userbirth').val());
		var today = new Date();
		today.setHours(0, 0, 0, 0); // 오늘 날짜의 시간을 00:00:00.000으로 설정
		// 휴대폰 번호 입력 검사
		var phoneRegex = /^\d{10,11}$/; // 10~11자리 숫자만 유효
		var phoneNumber = $('#userphone').val().replace(/-/g, ''); // 하이픈(-) 제거 후 검사
		var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

		if (userid.length < 4 || userid.length > 16) {
			alert("아이디는 4자 이상, 16자 이하로 입력해주세요.");
			$('#userid').focus();
			return false;
		}

		if ($('#idcheck').text() !== "사용 가능한 아이디입니다.") {
			alert("아이디 중복체크를 완료해주세요.");
			$('#userid').focus();
			return false;
		}

		if (email.length < 1) {
			alert("이메일을 입력해 주세요.");
			$('#useremail1').focus();
			return false;
		}

		if (!reg.test(password)) {
			alert("비밀번호는 8자리 이상이어야 하며, 영문/숫자가 하나라도 포함되어야 합니다.");
			$('#password').focus();
			return false;
		}

		if (password.includes(' ')) {
			alert("비밀번호에 공백 없이 입력해주세요.");
			$('#password').focus();
			return false;
		}

		if (pass === "") {
			alert("비밀번호 확인란을 입력해 주세요.");
			$('#confirmPassword').focus();
			return false;
		}

		if (pass !== "비밀번호가 일치합니다.") {
			alert("비밀번호가 서로 일치하지 않습니다.");
			$('#confirmPassword').focus();
			return false;
		}

		if (username.length < 1) {
			alert("이름을 입력해 주세요.");
			$('#username').focus();
			return false;
		}

		if (birthDate >= today) {
			alert("생일은 오늘 날짜나 미래 날짜가 될 수 없습니다.");
			$('#userbirth').focus();
			return false;
		}

		if (!phoneRegex.test(phoneNumber)) {
			alert("유효한 휴대폰 번호를 입력해주세요. (하이픈 없이 10~11자리 숫자)");
			$('#userphone').focus();
			return false;
		}

		// 주소 입력 검사
		if (!$('#sample4_roadAddress').val() || !$('#sample4_postcode').val() || !$('#sample4_detailAddress').val()) {
			alert("주소를 모두 입력해주세요.");
			return false;
		}

		// 모든 검사를 통과하면 폼 제출을 계속 진행
		$('#signForm').submit();
	});

	// 아이디 중복 확인
	window.CheckId = function(userid) {
		if (!userid) {
			alert("아이디를 입력해주세요");
			return;
		}

		$.ajax({
			type: 'POST',
			url: 'idcheck.jsp',
			data: { userid: userid },
			success: function(result) {
				if ($.trim(result) === "ok") {
					$("#idcheck").text("사용 가능한 아이디입니다.").css('color', 'green');
				} else {
					$("#idcheck").text("중복된 아이디입니다.").css('color', 'red');
				}
			},
			error: function() {
				alert("아이디 체크 중 문제가 발생했습니다.");
			}
		});
	};
});
