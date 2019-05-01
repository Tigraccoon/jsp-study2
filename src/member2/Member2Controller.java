package member2;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member2_Servlet/*")
public class Member2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String context = request.getContextPath();
		String uri = request.getRequestURI();
		Member2DAO dao = new Member2DAO();
		System.out.println("Controller is online~");
		if(uri.indexOf("list.do") != -1) {	//리스트
			System.out.println("list.do");
			Map<String,Object> map = new HashMap<>();
			List<Member2DTO> list = dao.getList();
			int count = list.size();
			
			map.put("list", list);
			map.put("count", count);
			
			request.setAttribute("map", map);
			
			RequestDispatcher rd = request.getRequestDispatcher("/member2/member2_list.jsp");
			rd.forward(request, response);
		} 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
