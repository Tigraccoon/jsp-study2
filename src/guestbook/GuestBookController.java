package guestbook;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.dao.GuestBookDAO;
import guestbook.dto.GuestBookDTO;

@WebServlet("/guestbook_servlet/*")
public class GuestBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		GuestBookDAO dao = new GuestBookDAO();
		String url="";
		String context = request.getContextPath();
		
		if(uri.indexOf("list.do") != -1) {
			String searchkey = request.getParameter("searchkey");
			String search = request.getParameter("search");
			
			if(searchkey==null) searchkey="name";
			if(search==null) search="";
			
			
			List<GuestBookDTO> list = dao.getList(searchkey, search);
			
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			
			request.setAttribute("searchkey", searchkey);
			request.setAttribute("search", search);
			
			url = "/guestbook/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		
		else if(uri.indexOf("insert.do") != -1) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			GuestBookDTO dto = new GuestBookDTO();
			
			dto.setName(name);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			
			dao.gbInsert(dto);
			
			url="/guestbook_servlet/list.do";
			
			response.sendRedirect(context+url);
		}
		
		else if(uri.indexOf("passwd_check.do") != -1){
			int idx=Integer.parseInt(request.getParameter("idx"));
			String passwd=request.getParameter("passwd");
			
			boolean result = dao.passwdCheck(idx, passwd);
			
			if(result) {
				url="/guestbook/edit.jsp";
				GuestBookDTO dto = dao.getDetail(idx);
				request.setAttribute("dto", dto);
			} else {
				url="/guestbook/index.jsp";
				
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
		
		else if(uri.indexOf("update.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			GuestBookDTO dto = new GuestBookDTO();
			
			dto.setIdx(idx);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPasswd(passwd);
			dto.setContent(content);
			
			dao.gbUpdate(dto);
			
			url = "/guestbook_servlet/list.do";
			response.sendRedirect(context+url);
		}
		
		else if(uri.indexOf("delete.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			
			dao.gbDelete(idx);
			
			url = "/guestbook_servlet/list.do";
			response.sendRedirect(context+url);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
