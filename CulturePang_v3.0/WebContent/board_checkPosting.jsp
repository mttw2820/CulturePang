<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="beanPack.*, java.util.*" %>
<jsp:useBean id="postMgr" class="beanPack.BoardMgrPool"/>
<%
	response.setCharacterEncoding("UTF-8");
	
	//클릭된 게시물 번호 받기
	String selected = request.getParameter("selectPostNum");
	int postNum = Integer.parseInt(selected);
	
	//해당 게시물 정보 DB에서 가져오기
	BoardBean postingB = postMgr.getSelectedPosting(postNum); 
	//글 조회수 증가
	int new_hits = postingB.getHits() + 1;
	postMgr.increaseHit(postNum, new_hits);
	
	//글 종류 문자열로 바꾸기
	int category = postingB.getCategory();
	String printC = null;
	if(category == postMgr.CAT_PR)
		printC = "홍보글";
	else if(category == postMgr.CAT_REVIEW)
		printC = "후기글";
	else printC = "잡담글";
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
          <h2 class="text-left">posting</h2>
          
          <div class="section-container-spacer">
          	<table class="table table-boardered">
          	  <tr>
				<td>작성시간</td>
				<td><%=postingB.getPostDate() %></td>
		  	  </tr>
			  <tr>
				<td>글 종류</td>
				<td><%=printC %></td>
			  </tr>
			  <tr>
				<td>글 제목</td>
				<td><%=postingB.getTitle() %></td>
			  </tr>
			  <tr>
				<td>작성자</td>
				<td><%=postingB.getWriter()%></td>
			  </tr>
			  <tr>
				<td colspan="2">
				<%=postingB.getContents()%>
				</td>
			  </tr>
          	
          	</table>
          </div>
		  
       </div>
    </div>
  </div>
</div>          

<footer class="footer-container white-text-container">
	<%@ include file="/design/footer.jsp" %>
</footer>

</body>
</html>