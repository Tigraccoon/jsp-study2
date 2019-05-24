package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import sqlmap.MybatisManager;

public class BoardDAO {
	
	public List<BoardDTO> list(int start, int end){
		SqlSession session = null; 
		List<BoardDTO> list = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			
			list = session.selectList("board.list", map);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("list Error...");
		} finally {
			if(session!=null)session.close();
		}
		
		
		return list;
	}

	public void insert(BoardDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			session.insert("board.insert", dto);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert Error...");
		} finally {
			if(session!=null)session.close();
		}
		
		
	}

	public String getFileName(int num) {
		String result = "";
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("board.getFileName", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getFileName Error...");
		} finally {
			if(session!=null)session.close();
		}
		
		return result;
	}

	public void plusDown(int num) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			session.update("board.plusDown", num);
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("plusDown Error...");
		} finally {
			if(session!=null)session.close();
		}
		
	}

	public BoardDTO view(int num) {
		SqlSession session = null;
		BoardDTO dto = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			dto = session.selectOne("board.view", num);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("plusDown Error...");
		} finally {
			if(session!=null)session.close();
		}
		
		return dto;
	}
	
	//조회수 증가
	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session = null;
		
		try {
			long read_time = 0;
			
			if(count_session.getAttribute("read_time_"+num) != null) {
				read_time = (long)count_session.getAttribute("read_time_"+num);
			}
			
			long current_time = System.currentTimeMillis();
			
			session = MybatisManager.getInstance().openSession();
			
			if(current_time-read_time > 5 * 1000) {	//현재시간 - 읽은시간이 5초보다 크면?
				//시간값을 하루로 정하려면 24 * 60 * 60 * 1000 (24시간 * 60분 * 60초 * 1000ms)
				
				session.update("board.plusReadCount", num);
				
				session.commit();
				//최근 열람 시간 업데이트
				count_session.setAttribute("read_time_"+num, current_time);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("plusReadCount Error...");
		} finally {
			if(session!=null)session.close();
		}
	}

	public List<BoardCommentDTO> commentList(int num) {
		SqlSession session = null;
		List<BoardCommentDTO> list = null;

		try {
			session = MybatisManager.getInstance().openSession();
			
			list = session.selectList("board.commentList", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentList Error...");
		} finally {
			if(session!=null)session.close();
		}
		
		return list;
	}

	public void commentAdd(BoardCommentDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			session.insert("board.commentAdd", dto);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("commentAdd Error...");
		} finally {
			if(session!=null)session.close();
		}
	}

	public int boardCount() {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		int count = session.selectOne("board.boardCount");
		
		session.close();
		
		return count;
	}

	public void updateStep(int ref, int re_step) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			BoardDTO dto = new BoardDTO();
			
			dto.setRef(ref);
			dto.setRe_step(re_step);
			
			session.update("board.updateStep", dto);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateStep Error...");
		} finally {
			if(session!=null)session.close();
		}
	}

	public void reply(BoardDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			session.insert("board.reply", dto);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("reply Error...");
		} finally {
			if(session!=null)session.close();
		}
	}

	public String passwdCheck(int num, String passwd) {
		SqlSession session = null;
		String result = null;
		try {
			session = MybatisManager.getInstance().openSession();
			Map<String, Object> map = new HashMap<>();
			
			map.put("num", num);
			map.put("passwd", passwd);
			
			result = session.selectOne("board.pass_check", map);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("passwdCheck Error...");
		} finally {
			if(session!=null)session.close();
		}
		
		return result;
	}

	public void update(BoardDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			session.update("board.update", dto);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update Error...");
		} finally {
			if(session!=null)session.close();
		}
	}

	public void delete(int num) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			session.update("board.delete", num);
			
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete Error...");
		} finally {
			if(session!=null)session.close();
		}
	}
	
	public BoardDTO viewReplace(int num) {
		SqlSession session = null;
		BoardDTO dto = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			
			dto = session.selectOne("board.view", num);
			//줄바꿈 처리
			String content = dto.getContent();
			content = content.replace("\n", "<br>");
			dto.setContent(content);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("plusDown Error...");
		} finally {
			if(session!=null)session.close();
		}
		
		return dto;
	}
	
}
