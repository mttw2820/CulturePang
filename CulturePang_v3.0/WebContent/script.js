//JS 파일 모음

//member.jsp에서 회원가입 필수 입력 정보 입력 확인
function inputCheck(){
	if(document.regFrm.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return;
	}
	
	if(document.regFrm.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.pwd.focus();
		return;
	}
	
	if(document.regFrm.repwd.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repwd.focus();
		return;
	}
	
	if(document.regFrm.pwd.value != document.regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	
	if(document.regFrm.name.value==""){
		alert("이름을 입력해 주세요.");
		document.regFrm.name.focus();
		return;
	}
	
	if(document.regFrm.nickname.value==""){
		alert("닉네임을 입력해 주세요.");
		document.regFrm.nickname.focus();
		return;
	}
	
	if(document.regFrm.emailAdd.value==""){
		alert("이메일을 입력해 주세요.");
		document.regFrm.email.focus();
		return;
	}
	
    var str=document.regFrm.emailAdd.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.regFrm.emailAdd.focus();
		  return;
    }
    
	document.regFrm.submit();
}

function win_close(){
	alert("WIN CLOSE 호출됨");
	self.close();
}

function idCheck(id) {
	//idCheck.jsp로 넘어가는데, 그 때 id를 가지고 넘어감(form 처럼)
	//id 중복 확인
	url = "member_idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300,height=150");
}

//login.jsp에서 로그인 정보 입력 확인
function loginCheck() {
	//아이디 입력 확인
	if (document.loginFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.loginFrm.id.focus();
		return;
	}
	//비밀번호 입력 확인
	if (document.loginFrm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.loginFrm.pwd.focus();
		return;
	}
	//아이디와 비밀번호 모두 확인 시 로그인 진행
	document.loginFrm.action = "loginProc.jsp";
	document.loginFrm.submit();
}

function memberForm(){
	document.loginFrm.target = "content";
	document.loginFrm.action = "member.jsp";
	document.loginFrm.submit();
}

//mypage_updateProc.jsp 에서 비밀번호 입력 확인
function pwdCheck(){
	if(document.pwdFrm.pwd_check.value == ""){
		alert("기존 비밀번호를 입력해주세요.");
		document.pwdFrm.pwd_check.focus();
		return;
	}
	var newP = document.pwdFrm.new_pwd.value;
	var newPcheck = documnet.pwdFrm.new_pwd_check;
	if(newP == ""){
		alert("새로운 비밀번호를 입력해주세요.");
		document.pwdFrm.new_pwd.focus();
		return;
	}
	if(newP.equals(newPcheck)){
		alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		document.pwdFrm.new_pwd_check.focus();
		return;
	}
}