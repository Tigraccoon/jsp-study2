package crypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.DB;

public class CryptDAO {

	public void insertOracleCrypt(CryptDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into member_oacle (userid,passwd,name) "
					+ "values (?,PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?), ?)"; 
					
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(String.valueOf(sql));
			
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertOracleCrypt Error...");
		} finally {
			try {
				if(pstmt!=null) pstmt.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}	//join oracle

	public void insertSha256Crypt(CryptDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO member_sha256(userid, passwd, name) ");
			sql.append(" VALUES(?,?,?)");
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(String.valueOf(sql));
			
			pstmt.setString(1, dto.getUserid());
			
			SHA256 sha = SHA256.getInstance();
			String shaPass = sha.getString(dto.getPasswd().getBytes());
			
			pstmt.setString(2, shaPass);
			pstmt.setString(3, dto.getName());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertSha256Crypt Error...");
		} finally {
			try {
				if(pstmt!=null) pstmt.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}	//join sha

	public void insertBcryptCrypt(CryptDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member_bcrypt ");
			sql.append("(userid,passwd,name) values ");
			sql.append("(?,?,?)");
			pstmt=conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getUserid());
			String passwd = BCrypt.hashpw(dto.getPasswd(), BCrypt.gensalt());
			
			pstmt.setString(2, passwd);
			pstmt.setString(3, dto.getName());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertBcryptCrypt Error...");
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}	//join Bcrypt

	public String loginOracleCrypt(CryptDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result="";
		
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM member_oacle WHERE userid=? AND passwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			
			System.out.println(dto.getUserid());
			System.out.println(dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = "어서오세요! " + rs.getString("name") + "!!";
			} else {
				result = "로그인 실패!";
				System.out.println(rs.getString("name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("loginOracleCrypt Error...");
		} finally {
			try {
				if(rs!=null) rs.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	
	}	//login oracle

	public String loginSha256Crypt(CryptDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result="";
		
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM member_sha256 WHERE userid=? AND passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			
			SHA256 sha = SHA256.getInstance();
			String shaPass = sha.getString(dto.getPasswd().getBytes());
			
			pstmt.setString(2, shaPass);
			
			System.out.println(dto.getUserid());
			System.out.println(dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = "어서오세요! " + rs.getString("name") + "!!";
			} else {
				result = "로그인 실패!";
				System.out.println(rs.getString("name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("loginSha256Crypt Error...");
		} finally {
			try {
				if(rs!=null) rs.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;

	
	}	//login sha

	public String loginBcryptCrypt(CryptDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		
		try {
			conn = DB.getConn();
			String sql = "select * from member_bcrypt where userid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String passwd = rs.getString("passwd");
				//checkpw(평문, 암호문)
				if(BCrypt.checkpw(dto.getPasswd(), passwd)) {
					result=rs.getString("name")+"님 환영합니다.";
				} else {
					result="로그인 실패";
				}
			} else {
				result="로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("loginBcryptCrypt Error...");
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
		
	}
	
	

}
