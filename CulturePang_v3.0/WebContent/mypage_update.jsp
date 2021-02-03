<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="beanPack.*, java.util.*" %>
<jsp:useBean id="uMgr" class="beanPack.UserMgrPool"/>
<%
	response.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	if(id==null){%>
		<script>
		alert("MY PAGE 서비스는 회원만 이용가능합니다. 로그인해주세요.");
		location.href="login.jsp";
		</script>
	<%}
	UserBean myBean = uMgr.getMember(id);
%>
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
          <h2 class="text-center">Modify Information</h2>
          <p>회원 정보를 수정합니다.</p>
        </div>  
      </div>
    </div>
    
    <div class="container">
      <div align="center">
		<div class="card-container">
		<div class="card card-shadow col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 reveal">
		<div class="row">
			<form action="mypage_updateProc.jsp" method="post">
			<b>*</b>는 수정이 불가합니다.
			<br>
			<table style="width:60%; height: 260px">
				<tr>
					<td style="width:30%">아이디<b>*</b> </td>
					<td><input type="text" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<td>이름<b>*</b></td>
					<td><input type="text" name="name" value="<%=myBean.getName() %>" readonly></td>
				</tr>
				<tr>
					<td>별명 </td>
					<td><input type="text" name="nickname" value="<%=myBean.getNickname()%>"></td>
				</tr>
				<tr>
					<td>가입날짜  </td>
					<td><%=myBean.getJoinDate() %></td>
				</tr>
				<tr>
					<td>생년월일 </td>
					<td><input type="text" name="birth" value="<%=myBean.getBirth() %>"></td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<%
					String printE = myBean.getEmailAdd();
					if(printE==null) printE = "이메일 계정을 등록해주세요.";
					%>
					<td><input type="email" name="emailAdd" value="<%=printE%>">
					</td>
				</tr>
				<tr>
					<td>핸드폰 번호 </td>
					<%
					String printP = myBean.getPhoneNum();
					if(printP==null) printP = "핸드폰 번호를 등록해주세요.";
					%>
					<td><input type="text" name="phoneNum" value="<%=printP%>">
					</td>
				</tr>
			</table>
			<br>

			<input type="submit" class="btn btn-primary btn-sm" style="width:30%" value="수정">
			&nbsp;
			<input type="button" class="btn btn-info btn-sm" style="width:30%" onclick="alert('회원정보수정을 중단하시겠습니까?'); location.href='mypage.jsp'" value="취소">
            </form>
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