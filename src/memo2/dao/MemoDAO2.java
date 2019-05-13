package memo2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo2.dto.MemoDTO2;
import sqlmap.MybatisManager;

public class MemoDAO2 {

	public List<MemoDTO2> getList(String searchkey, String search) {
		List<MemoDTO2> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			if(searchkey.equals("writer_memo")) {
				list = session.selectList("memo2.allList", search);
				
			} else {
				Map<String, String> map = new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", search);
				
				list = session.selectList("memo2.someList", map);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		
		return list;
	}

	public void insertMemo(MemoDTO2 dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		session.insert("memo2.insert", dto);
		session.commit();
		if(session!=null)session.close();
	}
	
}
