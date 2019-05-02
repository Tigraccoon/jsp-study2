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
		} else if(uri.indexOf("insert.do") != -1) {	//추가
			System.out.println("insert.do");
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			//dto.setUserid(request.getParameter("userid"));
			//dto.setPasswd(request.getParameter("passwd"));
			//dto.setName(request.getParameter("name"));
			//dto.setEmail(request.getParameter("email"));
			//dto.setHp(request.getParameter("hp"));
			//dto.setZipcode(request.getParameter("zipcode"));
			//dto.setAddress1(request.getParameter("address1"));
			//dto.setAddress2(request.getParameter("address2"));  
			
			dao.insert(userid, passwd, name, email, hp, zipcode, address1, address2);
			
			RequestDispatcher rd = request.getRequestDispatcher("/member2/member2.jsp");
			rd.forward(request, response);
			
		} else if(uri.indexOf("view.do") != -1) { //상세정보 뷰
			System.out.println("view.do");
			String userid = request.getParameter("userid");
			
			Member2DTO dto = dao.view(userid);
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher("/member2/member2_view.jsp");
			rd.forward(request, response);
			
		} else if(uri.indexOf("update.do") != -1){
			System.out.println("update.do");

			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			dao.update(userid,passwd,name,email,hp,zipcode,address1,address2);
			
			RequestDispatcher rd = request.getRequestDispatcher("/member2/member2.jsp");
			rd.forward(request, response);
			 
		} else if(uri.indexOf("delete.do") != -1){
			System.out.println("delete.do");

			String userid = request.getParameter("userid");
			dao.delete(userid);
			
			RequestDispatcher rd = request.getRequestDispatcher("/member2/member2.jsp");
			rd.forward(request, response);
			
		} else if(uri.indexOf("login.do") != -1) {	//로그인
			System.out.println("login.do");

			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			String result = dao.login(userid, passwd);
			
			request.setAttribute("result", result);
			
			RequestDispatcher rd = request.getRequestDispatcher("/member2/login_result.jsp");
			rd.forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
