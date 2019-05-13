package memo2;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memo2.dao.MemoDAO2;
import memo2.dto.MemoDTO2;

@WebServlet("/memo_servlet2/*")
public class MemoController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		MemoDAO2 dao = new MemoDAO2();
		
		if(uri.indexOf("list.do") != -1) {
			String searchkey = request.getParameter("searchkey");
			String search = request.getParameter("search");
			
			List<MemoDTO2> list = dao.getList(searchkey, search);
			
			request.setAttribute("list", list);
			
			String page = "/memo2/memo2_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		else if(uri.indexOf("insert.do") != -1) {
			String writer = request.getParameter("writer");
			String memo = request.getParameter("memo");
			MemoDTO2 dto = new MemoDTO2();
			
			dto.setWriter(writer);
			dto.setMemo(memo);
			
			dao.insertMemo(dto);
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
