<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="beanPack.*, java.util.*" %>
<jsp:useBean id="boardMgr" class="beanPack.BoardMgrPool"/>

<%
	response.setCharacterEncoding("UTF-8");
	
	//로그인 상태 확인
	String userId = (String)session.getAttribute("id");
	String userNick = (String)session.getAttribute("nickname");
	boolean loginCheck = false;
	if(userId!=null) loginCheck = true;
	
	int set_cat;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

<header>
	<%@ include file="/design/header.jsp" %>
</header>

<div class="section-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
          <h1 class="text-center">Board</h1>
          <p>
        	<%-- 옵션 선택 --%>
			<button class="btn btn-primary" onclick="location.href='board_catList.jsp?cat=<%=boardMgr.CAT_PR %>'">홍보글 보기</button>&nbsp;&nbsp;
			<button class="btn btn-primary" onclick="location.href='board_catList.jsp?cat=<%=boardMgr.CAT_REVIEW %>'">후기글 보기</button>&nbsp;&nbsp;
			<button class="btn btn-primary" onclick="location.href='board_catList.jsp?cat=<%=boardMgr.CAT_CHAT %>'">잡담글 보기</button>&nbsp;&nbsp;
		  
		  	<% if(loginCheck){ %>
			  <button class="btn btn-info" onclick="location.href='board_newPosting.jsp'">글작성</button>
			<% } %>
		  </p>
		  
          <div class="section-container-spacer">
          	<table class="table table-boardered">
          	  <thead>
				<tr>
				  <td>게시물 번호</td>	
				  <td>작성자</td>	
		  		  <td>글 제목</td>	
				  <td>글 종류</td>	
				  <td>작성일</td>	
				  <td>조회수</td>	
				</tr>
			<%
				//게시글 가져오기			
				Vector<BoardBean> blist = new Vector<BoardBean>();
				if(request.getParameter("cat") == null)
					set_cat = boardMgr.CAT_ALL;
				else set_cat = Integer.parseInt(request.getParameter("cat"));
				if(set_cat == boardMgr.CAT_SEARCH){
					String searchKey = request.getParameter("searchKey");
					blist = boardMgr.getSearchRegister(searchKey);
				}else{
					blist = boardMgr.getBoardRegister(set_cat);
				}
				int listLen = blist.size();
				
				for(int i=listLen-1; i>=0; i--){
					BoardBean bb = blist.get(i);			
			%>
				<tr>
				  <td><%=bb.getPostNum() %></td>		
			  	  <td><%=bb.getWriter() %></td>
				  <td>
					<a href="board_checkPosting.jsp?selectPostNum=<%=bb.getPostNum()%>">
					<%=bb.getTitle() %>
					</a>
				  </td>	
			<% 
				//글 종류 int를 String 정보로 변환하는 과정
				int category = bb.getCategory();
				String printC = null;
				if(category == boardMgr.CAT_PR)
					printC = "홍보글";
				else if(category == boardMgr.CAT_REVIEW)
					printC = "후기글";
				else printC = "잡담글";
			%>
			  	  <td><%=printC %></td>	
				  <td><%=bb.getPostDate() %></td>	
				  <td><%=bb.getHits() %></td>	
				</tr>
			<%} %>
       	
          	</table>
          	<br>
			
          <div align="right">
		  <form action="board_catList.jsp" method="post">
			<input type="text" name="searchKey" placeholder="검색어를 입력하세요">
			<input type="submit" class="btn btn-primary btn-sm" name="검색">
		  </form>
		  </div>
			<p>total postings : <%=listLen %></p>
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