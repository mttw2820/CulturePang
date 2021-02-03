package beanPack;

import java.sql.*;
import java.util.*;

public class BoardMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public BoardMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
 
	public static final int CAT_ALL = 0;
	public static final int CAT_PR = 1;
	public static final int CAT_REVIEW = 2;
	public static final int CAT_CHAT = 3;
	public static final int CAT_SEARCH = 5;
	
	//게시글을 가져오는 메소드
    public Vector<BoardBean> getBoardRegister(int category) {
    	Connection conn = null;
    	Statement stmt = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	//게시글을 담아서 반환할 벡터
    	Vector<BoardBean> blist = new Vector<BoardBean>();
    	
    	try {
    		conn = pool.getConnection();
    		//게시글 전부 가져오는 경우
    		String strQuery = " ";
    		if(category == CAT_ALL) {
    			strQuery = "select * from board_table";
    			stmt = conn.createStatement();
        		rs = stmt.executeQuery(strQuery);
    		}
    		else {
    			strQuery = "select * from board_table where category=?";
    			pstmt = conn.prepareStatement(strQuery);
    			pstmt.setInt(1, category);
    			rs = pstmt.executeQuery();
    		}
    		
    		while(rs.next()) {
    			//mySql에서 게시글에 대한 정보 받아오기
    			BoardBean temp = new BoardBean();
    			temp.setPostNum(rs.getInt("postNum"));
    			temp.setCategory(rs.getInt("category"));
    			temp.setTitle(rs.getString("title"));
    			temp.setWriter(rs.getString("writer"));
    			temp.setPostDate(rs.getString("postDate"));
    			temp.setHits(rs.getInt("hits"));
    			
    			//벡터에 저장
    			blist.addElement(temp);
    		}
    		
    	} catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(conn);
    	}
    	return blist;
    }
    
    public Vector<BoardBean> getSearchRegister(String searchKey){
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	//검색 결과를 담아서 반환할 벡터
    	Vector<BoardBean> slist = new Vector<BoardBean>();
    	
    	try {
    		conn = pool.getConnection();
    		String strQuery = "select * from board_table where title LIKE ? OR contents LIKE ? OR writer LIKE ?";
    		pstmt = conn.prepareStatement(strQuery);
    		pstmt.setString(1, "%" + searchKey + "%");
    		pstmt.setString(2, "%" + searchKey + "%");
    		pstmt.setString(3, "%" + searchKey + "%");
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			//mySql에서 검색 결과 받아오기
    			BoardBean temp = new BoardBean();
    			temp.setPostNum(rs.getInt("postNum"));
    			temp.setWriter(rs.getString("writer"));
    			temp.setTitle(rs.getString("title"));
    			temp.setCategory(rs.getInt("category"));
    			temp.setPostDate(rs.getString("postDate"));
    			temp.setHits(rs.getInt("hits"));
    			//벡터에 저장
    			slist.addElement(temp);
    		}
    		
    	} catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(conn);
    	}
    	
    	return slist;
    }
    
    
    //새로운 게시글 DB에 저장
    public boolean setNewPosting(BoardBean bb) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	boolean result = false;
    	
    	try {
    		conn = pool.getConnection();
    		String strQuery = "insert into board_table (category, title, writer, contents, postDate, hits)"
    				+ "values (?, ?, ?, ?, ?, ?)";
    		pstmt = conn.prepareStatement(strQuery);
    		pstmt.setInt(1, bb.getCategory());
    		pstmt.setString(2, bb.getTitle());
    		pstmt.setString(3, bb.getWriter());
    		pstmt.setString(4, bb.getContents());
    		pstmt.setString(5, bb.getPostDate());
    		pstmt.setInt(6, 0);
    		
    		if(pstmt.executeUpdate() == 1)
    			result = true;
    		
    	} catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(conn);
    	}
    	return result;
    }
    
    public BoardBean getSelectedPosting(int selectedPostNum) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	BoardBean postingB = new BoardBean();
    	
    	try {
    		conn = pool.getConnection();
    		String strQuery = "select * from board_table where postNum=?";
    		pstmt = conn.prepareStatement(strQuery);
    		pstmt.setInt(1, selectedPostNum);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			postingB.setCategory(rs.getInt("category"));
    			postingB.setTitle(rs.getString("title"));
    			postingB.setWriter(rs.getString("writer"));
    			postingB.setContents(rs.getString("contents"));
    			postingB.setPostDate(rs.getString("postDate"));
    			postingB.setHits(rs.getInt("hits"));
    		}
    			
    		
    	} catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(conn);
    	}
    	return postingB;
    }
    
    //게시물 조회수 기록
    public void increaseHit(int selectedPostNum, int new_hits) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try {
    		conn = pool.getConnection();
    		String strQuery = "update board_table set hits=? where postNum = ?";
    		pstmt = conn.prepareStatement(strQuery);
    		pstmt.setInt(1, new_hits);
    		pstmt.setInt(2, selectedPostNum);

    		pstmt.executeUpdate();
    		
    	} catch (Exception ex) {
    		System.out.println("Exception" + ex);
    	} finally {
    		pool.freeConnection(conn);
    	}
    	return;
    }
    
 }