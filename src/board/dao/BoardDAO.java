package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardDTO;
import sqlmap.MybatisManager;

public class BoardDAO {
	
	public List<BoardDTO> list(){
		SqlSession session = null; 
		List<BoardDTO> list = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("board.list");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		
		
		return list;
	}
	
}
