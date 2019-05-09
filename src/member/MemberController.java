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
		String context = request.getContextPath();
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

			//String page = "/ch06/member_list.jsp";
			String page = "/ch08/member_list2.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("add.do") != -1) {
			System.out.println("\nadd.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("add.do\n"));
			int result=0;
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			result = dao.memberAdd(userid, passwd, name, email, hp, zipcode, address1, address2);
			if(result == -1) {
				System.out.println("데이터 저장 에러..");
			}else {
				String page = "/ch06/member.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		} else if(uri.indexOf("join.do") != -1) {
			System.out.println("\njoin.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("join.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setZipcode(zipcode);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			
			dao.insert(dto);
			
		} else if(uri.indexOf("view.do") != -1) {
			System.out.println("\nview.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("view.do\n"));
			
			String userid = request.getParameter("userid");
			//System.out.println("클릭한 아이디 : " + userid);
			
			MemberDTO dto = dao.memberDetail(userid);
			request.setAttribute("dto", dto);
			
			String page = "/ch06/member_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		} else if(uri.indexOf("update.do") != -1) {
			System.out.println("\nupdate.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("update.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String hp = request.getParameter("hp");
			String zipcode = request.getParameter("zipcode");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setZipcode(zipcode);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			
			dao.update(dto);
			
			response.sendRedirect(context+"/ch06/member.jsp");
			
		} else if(uri.indexOf("delete.do") != -1) {
			System.out.println("\ndelete.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("delete.do\n"));
			
			String userid = request.getParameter("userid");
			
			dao.delete(userid);
			
			response.sendRedirect(context+"/ch06/member.jsp");
			
		} else if(uri.indexOf("login.do") != -1) {
			System.out.println("\nlogin.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("login.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			System.out.println("아이디 : " + userid + " 비밀번호 : " + passwd);
			
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			
			String result = dao.loginCheck(dto);
			
			request.setAttribute("result", result);
			String page = "/ch06/login_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			
			rd.forward(request, response);
		
		} else if(uri.indexOf("join_oracle_secret.do") != -1) {
			System.out.println("\njoin_oracle_secret.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("join_oracle_secret.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			
			dao.insertCrypt(dto);
		
		} else if(uri.indexOf("login_oracle_secret.do") != -1) {
			
			System.out.println("\nlogin_oracle_secret.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("login_oracle_secret.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			System.out.println("아이디 : " + userid + " 비밀번호 : " + passwd);
			
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			
			String result = dao.loginCheckOracle(dto);
			
			request.setAttribute("result", result);
			String page = "/ch06/login_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			
			rd.forward(request, response);
			
		} else if(uri.indexOf("join_sha.do") != -1) {
			
			System.out.println("\njoin_sha.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("join_sha.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			
			dao.insertSha256(dto);
			
		} else if(uri.indexOf("login_sha.do") != -1) {
			System.out.println("\nlogin_sha.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("login_sha.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			System.out.println("아이디 : " + userid + " 비밀번호 : " + passwd);
			
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			
			String result = dao.loginCheckSha256(dto);
			
			request.setAttribute("result", result);
			String page = "/ch06/login_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			
			rd.forward(request, response);
			
		} else if (uri.indexOf("join_bcrypt.do") != -1) {
			System.out.println("\njoin_bcrypt.do 호출!");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("join_bcrypt.do\n"));
			
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			System.out.println(userid);
			MemberDTO dto = new MemberDTO();
			
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			
			dao.insertBcrypt(dto);
			
			
		} else if(uri.indexOf("login_bcrypt.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			System.out.println("아이디:"+userid);
			System.out.println("패스워드:"+passwd);
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheckBcrypt(dto);
			System.out.println(result);
			request.setAttribute("result", result);
			String page="/ch06/login_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
