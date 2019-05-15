package guestbook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import guestbook.dto.GuestBookDTO;
import sqlmap.MybatisManager;

public class GuestBookDAO {
	public List<GuestBookDTO> getList(String searchkey, String search){
		SqlSession session = MybatisManager.getInstance().openSession();
		List<GuestBookDTO> list = null;

		if(searchkey.equals("name_content")) {//이름+내용
			list=session.selectList("gbListAll", "%"+search+"%");
		}else {
			//mybatis의 method는 2개 이상의 parameter를 전달할 수 없음
			//따라서 dto객체나 HashMap등으로 값을 묶어서 보내야함.
			Map<String,String> map=new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("gbList", map);
		}
		
		
		//줄바꿈, 특수문자 처리기능 추가
		for(GuestBookDTO dto : list) {
			String content = dto.getContent();
			content = content.replace("<", "&lt;");
			content = content.replace(">", "&gt;");
			content = content.replace("\n", "<br>");
			content = content.replace("  ", "&nbsp;&nbsp;");
			
			//키워드 색상처리
			if(!searchkey.equals("name")) {	//이름으로만 검색시 제외
				content = content.replace(search, "<b style='color:blue;'>" + search + "</b>");
			}
			
			dto.setContent(content);
		}
		
		if(session!=null)session.close();
		
		return list;
	}

	public void gbInsert(GuestBookDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		session.insert("gbInsert", dto);
		session.commit();
		
		if(session!=null)session.close();
	}

	public boolean passwdCheck(int idx, String passwd) {
		boolean result = false;
		SqlSession session = MybatisManager.getInstance().openSession();
		
		GuestBookDTO dto = new GuestBookDTO();
		
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		
		int count = session.selectOne("passwdCheck", dto);
		
		if(count==1) result=true;
		
		if(session!=null)session.close();

		
		return result;
	}
	
	public GuestBookDTO getDetail(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		GuestBookDTO dto = new GuestBookDTO();
		
		dto = session.selectOne("gbDetail", idx);
		if(session!=null)session.close();
		return dto;
		
	}

	public void gbUpdate(GuestBookDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		session.update("gbUpdate", dto);
		session.commit();
		if(session!=null)session.close();
	}

	public void gbDelete(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		session.delete("gbDelete", idx);
		session.commit();
		if(session!=null)session.close();
	}
	
	
}
