package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import crypt.BCrypt;
import crypt.SHA256;

public class MemberDAO {
	
	public List<MemberDTO> memberList(){
		List<MemberDTO> items = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM member ORDER BY name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setUserid(rs.getString("userid"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJoin_date(rs.getDate("join_date"));
				
				items.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberList Error...");
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
		
		return items;
	}
	
	public int memberAdd(String userid, String passwd, String name, String email, 
			String hp, String zipcode, String address1, String address2) {
		int result=0;
		
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
			
			result = pstmt.executeUpdate();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
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
		
		return -1;
		
	}
	
	public void insert(MemberDTO dto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO member(userid, passwd, name, email, hp, zipcode, address1, address2) ");
			sql.append(" VALUES(?,?,?,?,?,?,?,?)");
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(String.valueOf(sql));
			
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
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
		
	}
	
	
	public MemberDTO memberDetail(String userid) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM member WHERE userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				
				dto.setUserid(userid);
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
			System.out.println("memberDitail Error...");
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
		
		return dto;
	}

	
	public void update(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder(); 
			sql.append("UPDATE member SET ");
			sql.append(" passwd=?, name=?, email=?,hp=?,zipcode=?,address1=?,address2=? ");
			sql.append(" WHERE userid=?");
			
			pstmt = conn.prepareStatement(String.valueOf(sql));
			
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getZipcode());
			pstmt.setString(6, dto.getAddress1());
			pstmt.setString(7, dto.getAddress2());
			pstmt.setString(8, dto.getUserid());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberUpdate Error...");
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
		
	}

	public void delete(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			
			String sql = "DELETE FROM member WHERE userid=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("memberUpdate Error...");
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
	}

	public String loginCheck(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result="";
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM member WHERE userid=? AND passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = "어서와라! " + rs.getString("name") + "!!";
			} else {
				result = "로그인 실패! 확인하고 다시 로그인해라~";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("loginCheck Error...");
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
	}

	public void insertCrypt(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO member(userid, passwd, name) ");
			sql.append(" VALUES(?,PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?),?)");
			
			conn = DB.getConn();
			pstmt = conn.prepareStatement(String.valueOf(sql));
			
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
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
		
	}

	public String loginCheckOracle(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result="";
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM member WHERE userid=? AND passwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			
			System.out.println(dto.getUserid());
			System.out.println(dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = "어서와라! " + rs.getString("name") + "!!";
			} else {
				result = "로그인 실패! 확인하고 다시 로그인해라~";
				System.out.println(rs.getString("name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("loginCheck Error...");
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
	}

	public void insertSha256(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO member(userid, passwd, name) ");
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
	}

	public String loginCheckSha256(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result="";
		try {
			conn = DB.getConn();
			String sql = "SELECT * FROM member WHERE userid=? AND passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			SHA256 sha = SHA256.getInstance();
			String shaPass = sha.getSha256(dto.getPasswd().getBytes());
			pstmt.setString(2, shaPass);
			
			System.out.println(dto.getUserid());
			System.out.println(dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = "어서와라! " + rs.getString("name") + "!!";
			} else {
				result = "로그인 실패! 확인하고 다시 로그인해라~";
				System.out.println(rs.getString("name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("loginCheck Error...");
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

	}

	public void insertBcrypt(MemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into member ");
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
	}

	public String loginCheckBcrypt(MemberDTO dto) {
		String result="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql = 
					"select * from member where userid=? ";
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
