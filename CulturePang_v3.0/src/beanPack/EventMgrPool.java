package beanPack;
import java.io.*;
import java.sql.*;
import java.util.*;

public class EventMgrPool {

private DBConnectionMgr pool = null;
	
	public EventMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
	// 경기도, 강원도, 충청도, 경상도, 전라도, 제주도, 서울특별시
			public static final int ALL = 0;
			public static final int GYEONGGI = 1;
			public static final int GANGWON = 2;
			public static final int CHOONGCHUNG = 3;
			public static final int GYUNGSANG = 4;
			public static final int JUNRA = 5;
			public static final int JEJU = 6;
			public static final int SEOUL = 7;
			public static final int A = 11; //지역축제
			public static final int B = 12; //공연전시
			public static final int C = 13; //체육행사
	
	//문화 행사 정보 가져오기
	public Vector<EventBean> getEventMember(int index) {
 		Connection con = null;
 		Statement stmt = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		
 		Vector<EventBean> eb = new Vector<EventBean>();
 		
 		try {
 			con = pool.getConnection();
 			String strQuery = " ";
 			
 			if(index == ALL) {
    			strQuery = "select * from event_table";
    			stmt = con.createStatement();
        		rs = stmt.executeQuery(strQuery);
    		}
 			else if(index < 8){
    			strQuery = "select * from event_table where region=?";
    			pstmt = con.prepareStatement(strQuery);
    			pstmt.setInt(1, index);
    			rs = pstmt.executeQuery();
    		}
 			else {
 				strQuery = "select * from event_table where eventCategory=?";
 				pstmt = con.prepareStatement(strQuery);
    			pstmt.setInt(1, index);
    			rs = pstmt.executeQuery();
 			}
    		
 			while (rs.next()) {
 				EventBean temp = new EventBean();
 				temp.setEventNum(rs.getInt("eventNum"));
 				temp.setEventName(rs.getString("eventName"));
 				temp.setRegion(rs.getInt("region"));
 				temp.setEventCategory(rs.getString("eventCategory"));
 				temp.setEventContent(rs.getString("eventContent"));
 				temp.setPeriod(rs.getString("period"));
 				eb.addElement(temp);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con);
 		}
 		return eb;
 	}
	
	
	
	//eventNum에 해당하는 contents전체 가져오기
	public EventBean getContents(int eventNum) { 
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		EventBean ebean = new EventBean();
 		
 		try {
 			con = pool.getConnection();
 			String sql = "select * from event_table where eventNum = ?";
 			pstmt = con.prepareStatement(sql);
 			pstmt.setInt(1, eventNum);
 			rs = pstmt.executeQuery();
 			
 			if (rs.next()) {
 				ebean.setEventNum(rs.getInt("eventNum"));
 				ebean.setEventName(rs.getString("eventName"));
 				ebean.setRegion(rs.getInt("region"));
 				ebean.setEventCategory(rs.getString("eventCategory"));
 				ebean.setEventContent(rs.getString("eventContent"));
 				ebean.setPeriod(rs.getString("period"));
 			}
 			
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con);
 		}
 		return ebean;
 	}
		
}
