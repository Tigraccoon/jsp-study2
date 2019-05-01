package member2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.DB;

public class Member2DAO {
	public List<Member2DTO> getList(){
		List<Member2DTO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM member ORDER BY userid";
			conn = DB.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member2DTO dto = new Member2DTO();
				
				dto.setUserid(rs.getString("userid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJoin_date(rs.getDate("join_date"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getList Error...");
			
		}  finally {
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
		
		return list;
	}

	public void insert(String userid, String passwd, String name, String email, String hp, String zipcode,
			String address1, String address2) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO member(userid, passwd, name, email, hp, zipcode, address1, address2) VALUES(?,?,?,?,?,?,?,?)";
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, passwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, hp);
			pstmt.setString(6, zipcode);
			pstmt.setString(7, address1);
			pstmt.setString(8, address2);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert Error...");
			
		}  finally {
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
		
	}

	public Member2DTO view(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member2DTO dto = new Member2DTO();
		
		try {
			String sql = "SELECT * from member WHERE userid=?";
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				dto.setUserid(rs.getString("userid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJoin_date(rs.getDate("join_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert Error...");
			
		}  finally {
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
		
		return dto;
	}

	public void update(String userid, String passwd, String name, String email, String hp, String zipcode,
			String address1, String address2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE member SET passwd=?,name=?,email=?,hp=?,zipcode=?,address1=?,address2=? WHERE userid=?";
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, passwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, hp);
			pstmt.setString(5, zipcode);
			pstmt.setString(6, address1);
			pstmt.setString(7, address2);
			pstmt.setString(8, userid);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update Error...");
			
		}  finally {
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
	}

	public void delete(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM member WHERE userid=?";
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete Error...");
			
		}  finally {
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
	}

	
	
	
}
