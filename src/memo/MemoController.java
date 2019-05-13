package memo;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo.dao.MemoDAO;
import memo.dto.MemoDTO;


@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		//사용자가 요청한 주소
		String uri=request.getRequestURI();
		MemoDAO dao=new MemoDAO();
		if(uri.indexOf("list.do") != -1) {
			String searchkey = request.getParameter("searchkey");
			String search = request.getParameter("search");
			
			List<MemoDTO> list=dao.listMemo(searchkey, search);//메모 목록 리턴
			//request 영역에 저장
			request.setAttribute("list", list);
			//포워딩(주소는 그대로, 화면은 이동)
			String page="/memo/memo_list.jsp";
			RequestDispatcher rd=
					request.getRequestDispatcher(page);
			rd.forward(request, response);
		}	
		
		//list
		
		else if(uri.indexOf("insert.do") != -1) {
			String writer = request.getParameter("writer");
			String memo = request.getParameter("memo");
			
			MemoDTO dto=new MemoDTO();
			
			dto.setWriter(writer);
			dto.setMemo(memo);
			
			dao.insertMemo(dto);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
