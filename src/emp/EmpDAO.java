package emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import config.DB;

public class EmpDAO {
	
	public void insert_batch() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DB.getConn();
			conn.setAutoCommit(false);	//auto commit 해제
			
			String sql = "INSERT INTO emp2(empno, ename, deptno) VALUES(?,?,?)";
			pstmt = conn.prepareStatement(sql);

			long before = System.currentTimeMillis();	//실행 전 시간값 저장
			

			for(int i=1; i<=100000; i++) {
				pstmt.setInt(1, i);
				pstmt.setString(2, "kim "+String.valueOf(i));
				pstmt.setInt(3, i);
				pstmt.addBatch();
				//pstmt.close();
			}
			//pstmt.executeUpdate();
			pstmt.executeBatch();	//일괄 작업처리
			
			long atfer = System.currentTimeMillis();	//실행 후 시간값 저장
			conn.commit();	//수동 commit
			
			conn.setAutoCommit(true);	//커밋을 오토로 설정
			
			System.out.println("실행시간 : " + (atfer-before));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if(conn != null) {
					conn.rollback();	//롤백
				}
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
}
