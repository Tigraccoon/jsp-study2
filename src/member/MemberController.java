package member;

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
import javax.servlet.http.HttpSession;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		
		if(uri.indexOf("list.do") != -1) {	//리스트 출력
			System.out.println("\nlist.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do\n"));
			
			Map<String, Object> map = new HashMap<>();
			List<MemberDTO> list = dao.memberList();
			
			map.put("list", list);
			map.put("count", list.size());	//리스트 길이값(회원수)
			
			session.setAttribute("map", map);

			String page = "/ch06/member_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("add.do") != -1) {
			System.out.println("\nadd.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("add.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			dao.memberAdd(userid, passwd, name, email, hp, zipcode, address1, address2);
			
			String page = "/ch06/member.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
