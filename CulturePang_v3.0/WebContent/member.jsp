<%@ page contentType="text/html; charset=UTF-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>회원가입</title>
<script type="text/javascript" src="script.js"></script>

</head>

<body onLoad="regFrm.id.focus()">

<header>
	<%@ include file="/design/header.jsp" %>
</header>

<div class="section-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">	
	
		<h1 class="text-center"> SIGN IN </h1>
		
		<div align="center">
		<div class="card-container">
		<div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
		<div class="row">
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table style="height: 45%; width: 120%">
				<tr>
					<td width="30%">아이디</td>
					<td width="80%">
						<input name="id"> &nbsp;
						<input type="button" value="ID중복확인" class="btn btn-primary btn-sm" onClick="idCheck(this.form.id.value)">
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td><input type="password" name="repwd"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" placeholder="yyyymmdd"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="emailAdd" placeholder="google@gmail.com"></td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td><input type="text" name="phoneNum" placeholder="01012345678"></td>
				</tr>
			</table>
			<br>
			<input type="reset" value="다시쓰기" class="btn btn-info" style="width: 45%"> &nbsp;
			<input type="button" value="회원가입" onClick="inputCheck()" class="btn btn-primary" style="width: 45%">
			
		</form>
		
		</div>
		</div>
	</div>
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