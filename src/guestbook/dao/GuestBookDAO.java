package guestbook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import guestbook.dto.GuestBookDTO;
import sqlmap.MybatisManager;

public class GuestBookDAO {
	public List<GuestBookDTO> getList(){
		SqlSession session = MybatisManager.getInstance().openSession();
		//slselectList("네임스페이스.아이디",변수1개) 가 원칙이나 네임스페이스는 생략 가능
		List<GuestBookDTO> list = session.selectList("gblist");
		
		if(session!=null)session.close();
		
		return list;
	}
	
	
}
