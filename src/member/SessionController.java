package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/session_servlet/*")
public class SessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println(uri);
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String context = request.getContextPath();
		
		if(uri.indexOf("login.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			MemberDTO dto = new MemberDTO();
			
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			
			String result = dao.loginCheck(dto);
			System.out.println(result);
			String page = "/ch07/session_login.jsp";
			
			if(!result.equals("로그인 실패! 확인하고 다시 로그인해라~")) {//로그인 성공
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page = "/ch07/main.jsp";
				response.sendRedirect(context+page+"?message=login");
			} else { 	//로그인 실패
				response.sendRedirect(context+page+"?message=error&message2=error2");
			}
			
		} else if(uri.indexOf("logout.do") != -1) {	//로그아웃
			session.invalidate();
			String page = context+"/ch07/session_login.jsp?message=logout&message2=LogOut";
			response.sendRedirect(page);
		}
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
