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

// 패스워드 확인 체크(일치하지 않으면 빨간색으로 밑에 비밀번호가 일치하지 않습니다)
function checkPassword() {
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	if (password !== confirmPassword) {
		document.getElementById("passwordMessage").innerText = "비밀번호가 일치하지 않습니다.";
	} else {
		document.getElementById("passwordMessage").innerText = "";
	}
}
// 패스워드 확인 체크
function checkPassword() {
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var passwordMessage = document.getElementById("passwordMessage");

	if (password !== confirmPassword) {
		passwordMessage.innerText = "비밀번호가 일치하지 않습니다.";
		passwordMessage.style.color = "red"; // 빨간색 글씨로 뜨게
		passwordMessage.className = "password-check"
	} else {
		passwordMessage.innerText = "비밀번호가 일치합니다."; // 일치하면 메시지 지우기
		passwordMessage.style.color = "green";
		passwordMessage.className = "password-check"
	}
}

function joinsubmit() {
	document.getElementById('sample4_roadAddress').disabled = false;
	document.getElementById('sample4_postcode').disabled = false;
	signupForm.submit();
}
$(function() {
	$('#login').click(function(e) {
		login(e); // 기본적으로 첫 페이지 로드
	});
});
// 회원가입 유효성 검사 작성
/**
 *  회원가입 validation check
 */
function joinsubmit(){
	let SignForm = document.SignForm;
	let userid  = SignForm.userid;
	let userpw = SignForm.userpw;
	let username = SignForm.username;
	let userphone = SignForm.userphone;
	let useraddr = SignForm.useraddr;
	let useremail = SignForm.useremail;
	
	// 아이디 빈값체크 	-> alert 아이디를 입력하세요!
	if( userid.value == "" ){
		alert("아이디를 입력하세요.");
		userid.focus();
		return false;
	}
	
	// 아이디 글자 수 제한	-> alert 아이디는 5자리 이상, 16자리 미만으로 작성
	if( userid.value.length <= 4 || userid.value.length >= 16 ){
		alert("아이디는 5자리 이상, 16자리 미만으로 작성해 주세요.");
		userid.focus();
		return false;
	}
	
	// 비밀번호 빈값체크	-> alert 비밀번호를 입력하세요!
	if( userpw.value == "" ){
		alert("비밀번호를 입력하세요.");
		userpw.focus();
		return false;
	}
	
	// 비밀번호 자리체크 	-> alert 비밀번호는 8자리 이상으로 입력하세요
	if( userpw.value.length < 8 ){
		alert("비밀번호는 8자리 이상으로 입력하세요.");
		userpw.focus();
		return false;
	}
	
	
	// 이름 빈값체크		-> alert 이름을 입력하세요!
	if( username.value == "" ){
		alert("이름을 입력하세요.");
		username.focus();
		return false;
	}
	
	// 휴대폰번호 빈값체크	-> alert 휴대폰번호를 입력하세요!
	if( userphone.value == "" ){
		alert("휴대폰번호를 입력하세요.");
		userphone.focus();
		return false;
	}
	
	// 주소 빈값체크	-> alert 휴대폰번호를 입력하세요!
	if( useraddr.value == "" ){
		alert("주소를 입력하세요.");
		userphone.focus();
		return false;
	}
	
	// 이메일 빈값체크	-> alert 이메일을 입력하세요!
	if( useremail.value == "" ){
		alert("이메일을 입력하세요.");
		userphone.focus();
		return false;
	}
	
	/*sessionStorage.setItem("userid",userid.value);
	sessionStorage.setItem("userpw",userpw.value);
    // 기존 코드 유지...
    e.preventDefault();
    var password = document.getElementById('userpw').value;
    var hashedPassword = CryptoJS.SHA256(password).toString();
    // hashedPassword를 hidden 필드에 설정
    document.getElementById('hashedPassword').value = hashedPassword;
    // 원본 비밀번호 필드를 비움*/
    
    // Form 제출
    joinsubmit.submit();
    
//    document.getElementById('userpw').valu ;
}
// 아이디는 영어 또는 숫자만 가능
function onlyNumberAndEnglish(str) {
  return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
}
// 비밀번호는 8글자 이상,영문,숫자,!특수문자 사용!	
function strongPassword (str) {
  return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
}


function emailSelect(){
	
}



	
// 아이디 중복 확인
function CheckId(userid) {
	
	if (userid == "") {
		alert("아이디를 입력해주세요");
		return false;
	} else {
		$.ajax({
			type: 'post',
			url: 'idcheck.jsp',
			data: { userid: userid },
			async: true,
			success: function(result) {
				var idcheckMessage = document.getElementById("idcheck");
				if (result.trim() == "ok") {
					idcheckMessage.innerText = "사용 가능한 아이디입니다.";
					idcheckMessage.style.color = "green"; // 초록색으로 표시
				} else {
					idcheckMessage.innerText = "중복된 아이디입니다.";
					idcheckMessage.style.color = "red"; // 빨간색으로 표시
				}
			},
			error: function(result, status, error) {		// 실패시 콜백함수
				console.log(error);
			}
		});
	
	}
}