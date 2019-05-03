package crypt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/crypt_servlet/*")
public class CryptController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		CryptDAO dao = new CryptDAO();
		
		if(uri.indexOf("join") != -1) {
			if(uri.indexOf("join_oracle.do") != -1) {
				System.out.println(request.getRequestURI());
				System.out.println(uri.indexOf("join_oracle.do\n"));
				
				String userid = request.getParameter("userid");
				String passwd = request.getParameter("passwd");
				String name = request.getParameter("name");
				
				CryptDTO dto = new CryptDTO();
				
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				dto.setName(name);
				
				dao.insertOracleCrypt(dto);
			
			} else if(uri.indexOf("join_sha.do") != -1) {
				
				System.out.println(request.getRequestURI());
				System.out.println(uri.indexOf("join_sha.do\n"));
				
				String userid = request.getParameter("userid");
				String passwd = request.getParameter("passwd");
				String name = request.getParameter("name");
				
				CryptDTO dto = new CryptDTO();
				
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				dto.setName(name);
				
				dao.insertSha256Crypt(dto);
				
			} else if (uri.indexOf("join_bcrypt.do") != -1) {
				System.out.println(request.getRequestURI());
				System.out.println(uri.indexOf("join_bcrypt.do\n"));
				
				String userid = request.getParameter("userid");
				String passwd = request.getParameter("passwd");
				String name = request.getParameter("name");
				System.out.println(userid);
				CryptDTO dto = new CryptDTO();
				
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				dto.setName(name);
				
				dao.insertBcryptCrypt(dto);
				
			} 	
			
			//join	
			
		} else if (uri.indexOf("login") != -1) {
			
			String result="";
			
			if(uri.indexOf("login_oracle.do") != -1) {
				
				System.out.println(request.getRequestURI());
				System.out.println(uri.indexOf("login_oracle.do\n"));
				
				String userid = request.getParameter("userid");
				String passwd = request.getParameter("passwd");
				
				System.out.println("아이디 : " + userid + " 비밀번호 : " + passwd);
				
				CryptDTO dto = new CryptDTO();
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				
				result = dao.loginOracleCrypt(dto);
				
				request.setAttribute("result", result);
				
			} else if(uri.indexOf("login_sha.do") != -1) {
				System.out.println(request.getRequestURI());
				System.out.println(uri.indexOf("login_sha.do\n"));
				
				String userid = request.getParameter("userid");
				String passwd = request.getParameter("passwd");
				
				System.out.println("아이디 : " + userid + " 비밀번호 : " + passwd);
				
				CryptDTO dto = new CryptDTO();
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				
				result = dao.loginSha256Crypt(dto);
				
				request.setAttribute("result", result);
				
			} else if(uri.indexOf("login_bcrypt.do") != -1) {
				System.out.println(request.getRequestURI());
				System.out.println(uri.indexOf("login_bcrypt.do\n"));
				
				String userid=request.getParameter("userid");
				String passwd=request.getParameter("passwd");
				
				System.out.println("아이디:"+userid);
				System.out.println("패스워드:"+passwd);
				
				CryptDTO dto=new CryptDTO();
				
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				
				result=dao.loginBcryptCrypt(dto);
				
				System.out.println(result);
				request.setAttribute("result", result);
			}
			
			String page = "/ch06/h_login_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			
			rd.forward(request, response);
			
		}	
			
		//login
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
