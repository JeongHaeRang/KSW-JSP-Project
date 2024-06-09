/**
 * 
 */
// daum 주소 api 호출 함수
function sample4_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
				}
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				document.getElementById('sample4_postcode').value = data.zonecode;
				document.getElementById("sample4_roadAddress").value = roadAddr;
			}
		}).open();
}
// 패스워드 확인 체크
function checkPassword() {
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var passwordMessage = document.getElementById("passwordMessage");

	if (password !== confirmPassword) {
		passwordMessage.innerText = "비밀번호가 일치하지 않습니다.";
		passwordMessage.style.color = "red"; // 빨간색 글씨로 표시
		passwordMessage.className = "password-check"
		return false;
	} else {
		passwordMessage.innerText = "비밀번호가 일치합니다."; // 일치하면 메시지 지우기
		passwordMessage.style.color = "green";
		passwordMessage.className = "password-check"
		return true;
	}
}
function sendit() {
	let frm = document.infoChangeForm;
	let password = frm.confirmPassword;
	let address = frm.add1;
	let reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	if (!reg.test(password.value)) {
		alert("비밀번호는 8자리 이상이어야 하며, 영문/숫자가 하나라도 포함되어야 합니다.");
		password.focus();
		return false; // 유효성 검사 실패 시 false 반환
	} else if (frm.password.value.search(/\s/) != -1) {
		alert("비밀번호에 공백 없이 입력해주세요.");
		frm.password.focus();
		return false; // 유효성 검사 실패 시 false 반환
	} else if (address.value.length == 0) {
		alert("주소를 입력해 주세요.");
		address.focus();
		return false;
	}
}
$(document).ready(function() {
    $('#infoChangeForm').submit(function(event) {
        var password = $('#password').val();
        var address = $('#sample4_roadAddress').val();
        var postcode = $('#sample4_postcode').val();
        var detailAddress = $('#sample4_detailAddress').val();
        const reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

        // 비밀번호 유효성 검사
        if (!reg.test(password)) {
            alert("비밀번호는 8자리 이상이어야 하며, 영문/숫자가 하나라도 포함되어야 합니다.");
            $('#password').focus();
            event.preventDefault();
            return false;
        }

        // 주소 입력 검사
        if (!address || !postcode || !detailAddress) {
            alert("주소를 모두 입력해주세요.");
            if (!address) {
                $('#sample4_roadAddress').focus();
            } else if (!postcode) {
                $('#sample4_postcode').focus();
            } else if (!detailAddress) {
                $('#sample4_detailAddress').focus();
            }
            event.preventDefault();
            return false;
        }

        // 여기에 추가 유효성 검사 로직을 넣을 수 있습니다.
    });
});
