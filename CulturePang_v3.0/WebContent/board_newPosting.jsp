<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
	String userNick = (String)session.getAttribute("nickname");
	if(userNick == null){	%>
		<script>
		alert("게시글을 작성은 회원만 사용할 수 있는 서비스입니다.");
		location.href="board_list.jsp";
		</script>
<%
	}
%>
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
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
          <h2 class="text-left">New Posting</h2>
          	<form action="board_newPostingProc.jsp" method="post">
          	  <div class="section-container-spacer">
          		<table class="table table-boardered">
          		  <tr>
					<td>작성 시간</td>
					<% //작성 시간 저장하기
					Date now = new Date();
					SimpleDateFormat postingT = new SimpleDateFormat("yyyyMMdd");
					String printDate = postingT.format(now);
					%>
					<td><input type="text" name="postDate" value="<%=printDate%>" readonly></td>
				  </tr>
				  <tr>
					<td>글 종류</td>
					<td>
						<select name="category">
						<option value="1">홍보글</option>
						<option value="2">후기글</option>
						<option value="3">잡담글</option>
						</select>
					</td>
				  </tr>
				  <tr>
					<td>글 제목</td>
					<td><input type="text" name="title"></td>
				  </tr>
			 	  <tr>
					<td>작성자</td>
					<td><input type="text" name="writer" value="<%=userNick%>" readonly></td>
				  </tr>
				<tbody>
				  <tr>
					<td colspan="2">
					<textarea name="contents" style="height:300pt" rows="100" cols="100"></textarea>
					</td>
				  </tr>
				</tbody>          	
          		</table>
          	
         	  </div>
         	  <input type="submit" style="width:20%" class="btn btn-primary" value="저장">
			  <input type="reset" style="width:20%" class="btn btn-info" value="취소">
			</form>
       </div>
    </div>
  </div>
</div>   
	
	
<footer class="footer-container white-text-container">
	<%@ include file="/design/footer.jsp" %>
</footer>

</body>
</html>