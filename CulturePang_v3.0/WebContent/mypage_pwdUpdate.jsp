<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
	<%@ include file="/design/header.jsp" %>
</header>

  <div class="section-container">
    <div class="container text-center">
      <div class="row section-container-spacer">
        <div class="col-xs-12 col-md-12">
          <h2 class="text-center">Change Password</h2>
          <p>비밀번호를 수정합니다.</p>
        </div>  
      </div>
    </div>
    
    <div class="container">
      <div align="center">
		<div class="card-container">
		<div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
		<div class="row">
			<form name="pwdFrm" action="mypage_pwdUpdateProc.jsp" method="post">
			  <table style="width:700px; height: 120px">
				<tr>
				  <td style="width:30%">비밀번호 확인</td>
				  <td><input type="password" name="pwd_check" size="30" placeholder="기존비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
				  <td>새로운 비밀번호 입력</td>
				  <td><input type="password" name="new_pwd" size="30"></td>
				</tr>
				<tr>
				  <td>새로운 비밀번호 확인</td>
				  <td><input type="password" name="new_pwd_check" size="30"></td>
				</tr>
			  </table>
			  <br>
			  <input type="submit" value="확인" style="width:30%; height:30pt" class="btn btn-info btn-sm" onclick="pwdCheck()">
			  &nbsp;
			  <input type="reset" value="취소" style="width:30%; height:30pt" class="btn btn-primary btn-sm">
			</form>
      	</div>
		</div>
	  </div>
    </div>
  </div>
  
	

<footer class="footer-container white-text-container">
	<%@ include file="/design/footer.jsp" %>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function (event) {
    navActivePage();
    scrollRevelation('.reveal');
  });
</script>

<script type="text/javascript" src="./main.0cf8b554.js"></script>
	
</body>
</html>