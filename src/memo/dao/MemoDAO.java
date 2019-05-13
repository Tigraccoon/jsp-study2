package memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {
	//여기서는 ArrayList를 쓰면 에러가 난다.(mybatis 시스템상 타입을
	//고정시켜 놨다.
	public List<MemoDTO> listMemo(String searchkey, String search){
		//mybatis 실행 객체 생성
		//MybatisManager.getInstance() => SqlSessionFactory
		//openSession()은 SqlSession객체를 가리킨다.
		//SqlSession은 기존에 했던 Connection, PreparedStatement,
		//ResultSet 모두를 가지고 있다.
		//여기서 SqlSession하나를 쓰는건 context.xml에서 maxTotal="50"
		//설정중 1개의 리소스를 이미 써버리는 것이다.
		SqlSession session=MybatisManager.getInstance().openSession();
		//memo.xml에 저장될 sql문장을 실행
		//namespace.id ex)여기서는 네임스페이스는 memo이다.
		List<MemoDTO> list=null;
		try {
			if(searchkey.equals("writer_memo")) {	//이름+메모로 검색
				list = session.selectList("memo.listAll", search);
			} else {
				Map<String, String> map = new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", search);
				//MyBatis의 단점인 입력 변수 1개를 극복하기 위해 멥을 사용
				list = session.selectList("memo.list", map);
				//memo.xml에서 ${변수명}은 따옴표 미포함, #{변수명}이 따옴표 포함
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();//mybatis 객체 닫기
		}
		return list;
		
	}

	public void insertMemo(MemoDTO dto) {
		
		SqlSession session = MybatisManager.getInstance().openSession();
		
		session.insert("memo.insert", dto);	//레코드 추가, insert메소드는 파라미터가 1개만 허용
		//mybatis는 수동커밋이 기본
		session.commit();
		session.close();
	}

}
