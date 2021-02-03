package beanPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import java.sql.*;

import beanPack.UserBean;

public class UserMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public UserMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }

	public static int LOGIN_SUCCESS = 0;
	public static int ID_WRONG = 1;
	public static int PW_WRONG = 2;
	
	public static int PWD_CHECK_ERROR = 1;
	public static int PWD_UPDATE_ERROR = 2;
	public static int PWD_UPDATE_SUCCESS = 3;

	//login
    public int loginRegister(String typed_id, String typed_pwd) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   String pwd = null;
	   int loginCon = -1;
       try {
    	  conn = pool.getConnection();
          String strQuery = "select pwd from user_table where id=?";
          pstmt = conn.prepareStatement(strQuery);
          pstmt.setString(1, typed_id);
          rs = pstmt.executeQuery();
          
          if(!rs.next())
        	  loginCon = ID_WRONG;
          else {
        	  pwd = rs.getString("pwd");
        	  if(!pwd.equals(typed_pwd)) loginCon = PW_WRONG;
        	  else loginCon = LOGIN_SUCCESS;
          }
		  
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
	      pool.freeConnection(conn);
       }
       return loginCon;
    }
    
    //id 중복확인
    public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from user_table where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}   
    
    // 회원가입
 	public boolean insertMember(UserBean bean) {
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		String sql = null;
 		boolean flag = false;
 		
 		try {
 			con = pool.getConnection();
 			sql = "insert into user_table (id,pwd,name,birth,nickname,email,phoneNum,joinDate) values (?,?,?,?,?,?,?,?)";
 			pstmt = con.prepareStatement(sql);
 			pstmt.setString(1, bean.getId());
 			pstmt.setString(2, bean.getPwd());
 			pstmt.setString(3, bean.getName());
 			pstmt.setString(4, bean.getBirth());
 			pstmt.setString(5, bean.getNickname());
 			pstmt.setString(6, bean.getEmailAdd());
 			pstmt.setString(7, bean.getPhoneNum());
 			pstmt.setString(8, bean.getJoinDate());
 			
 			if (pstmt.executeUpdate() == 1)
 				flag = true;
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con, pstmt);
 		}
 		return flag;
 	}
 	
 	// 회원정보가져오기
 	public UserBean getMember(String id) {
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		UserBean bean = new UserBean();
 		
 		try {
 			con = pool.getConnection();
 			//id를 가지고 사용자의 정보 가져오기
 			String sql = "select * from user_table where id = ?";
 			pstmt = con.prepareStatement(sql);
 			pstmt.setString(1, id);
 			rs = pstmt.executeQuery();
 			
 			if (rs.next()) {
 				bean.setId(rs.getString("id"));
 				bean.setNickname(rs.getString("nickname"));
 				bean.setPwd(rs.getString("pwd"));
 				bean.setName(rs.getString("name"));
 				bean.setBirth(rs.getString("birth"));
 				bean.setEmailAdd(rs.getString("email"));
 				bean.setPhoneNum(rs.getString("phoneNum"));
 				bean.setJoinDate(rs.getString("joinDate"));
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con);
 		}
 		return bean;
 	}

 	// 회원정보수정
 	public boolean updateMember(UserBean bean) {
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		boolean flag = false;
 		try {
 			con = pool.getConnection();
 			// pwd=?, name=?,, birth=? email=?,
 			String sql = "update user_table set name=?, nickname=?, birth=?,"
 					+ "email=?, phoneNum=? where id = ?";
 			pstmt = con.prepareStatement(sql);
 			pstmt.setString(1, bean.getName());
 			pstmt.setString(2, bean.getNickname());
 			pstmt.setString(3, bean.getBirth());
 			pstmt.setString(4, bean.getEmailAdd());
 			pstmt.setString(5, bean.getPhoneNum());
 			pstmt.setString(6, bean.getId());
 			
 			int count = pstmt.executeUpdate();
 			System.out.println(count);
 			if (count > 0)
 				flag = true;
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con, pstmt);
 		}
 		return flag;
 	}
 	
 	//비밀번호 수정하기
 	public int updatePwd(String id, String pwd_check, String new_pwd) {
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		int flag = -1;
 		try {
 			con = pool.getConnection();
 			//기존 비밀번호 확인
 			String sql1 = "select pwd from user_table where id=?";
 			pstmt = con.prepareStatement(sql1);
 			pstmt.setString(1, id);
 			rs = pstmt.executeQuery();
 			if(!rs.next()) flag = PWD_CHECK_ERROR;
 			String now = rs.getString("pwd");
 			if(now.equals(pwd_check)) {	
 				String sql2 = "update user_table set pwd=? where id=?";
 				pstmt = con.prepareStatement(sql2);
 				pstmt.setString(1, new_pwd);
 				pstmt.setString(2, id);
 				if(pstmt.executeUpdate()==1)
 					flag = PWD_UPDATE_SUCCESS;
 				else flag = PWD_UPDATE_ERROR;	
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con, pstmt);
 		}
 		return flag;
 	}
 	
 	//닉네임 가져오기
 	public String getNick(String idKey) {
 		Connection conn = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		String nickname = null;
 		
 		try {
 			conn = pool.getConnection();
 			String sql = "select * from user_table where id=?";
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, idKey);
 			rs = pstmt.executeQuery();
 			if(rs.next()) {
 				nickname = rs.getString("nickname");
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(conn, pstmt);
 		}
 		return nickname;
 	}
 }	
 	