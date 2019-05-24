package board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BoardDAO;
import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import common.Constants;
import page.Pager;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		String path = request.getContextPath();
		String page = "";
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();
		
		if(url.indexOf("list.do") != -1) {
			System.out.println("\nlist.do\n");
			int count = dao.boardCount();
			int curPage = 1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start= pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<BoardDTO> list = dao.list(start, end);
			
			request.setAttribute("list", list);
			request.setAttribute("page", pager);

			page = "/board/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
		
		else if(url.indexOf("insert.do") != -1) {
			System.out.println("\ninsert.do\n");
			
			//파일 업로드를 위한 처리
			File uploadDir = new File(Constants.UPLOAD_PATH); 
			if(!uploadDir.exists()) {	//해당 디렉토리가 존재하지 않으면?
				uploadDir.mkdir();	//디렉토리 생성
			}
			
			MultipartRequest mr = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD 
														, "UTF-8", new DefaultFileRenamePolicy());
			
			String writer = mr.getParameter("writer");
			String subject = mr.getParameter("subject");
			String content = mr.getParameter("content");
			String passwd = mr.getParameter("passwd");
			String ip = request.getRemoteAddr();	//ip주소
			String filename = " ";	//공백 1개
			int filesize = 0;
			
			try {
				@SuppressWarnings("rawtypes")
				Enumeration files = mr.getFileNames();
				while(files.hasMoreElements()) {
					//첨부파일의 이름
					String file1 = (String)files.nextElement();
					filename = mr.getFilesystemName(file1);
					File f1 = mr.getFile(file1);
					if(f1 != null) {
						filesize = (int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto = new BoardDTO();
			
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//파일 첨부를 하지 않고 글을 썼을 경우?
			//trim() : 좌우 공백 제거
			if(filename == null || filename.trim().equals("")) {
				filename="-";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			dao.insert(dto);
			page = "/board_servlet/list.do";
			response.sendRedirect(path + page);
			
		}
		
		else if(url.indexOf("download.do") != -1) {
			System.out.println("\ndownload.do\n");

			int num = Integer.parseInt(request.getParameter("num"));
			String filename = dao.getFileName(num);
			
			System.out.println(filename);
			
			path=Constants.UPLOAD_PATH+filename;
			
			byte b[]=new byte[4096]; //바이트배열 생성
			//서버에 저장된 파일을 읽기 위한 스트림 생성
			
			FileInputStream fis=new FileInputStream(path);
			
			//mimeType(파일의 종류 - img, mp3, txt...등)
			String mimeType=getServletContext().getMimeType(path);
			
			if(mimeType==null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
			
			//http header로 파일 정보를 보내는데 filename이 한글, 특수문자가 들어갈 수 없기 때문에 서유럽언어인 8859_1로 인코딩을 해야함.
			//new String(바이트배열, 변환할 인코딩)
			filename = new String(filename.getBytes("utf-8"), "8859_1");
			
			//http header
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			//http body
			//OutputStream생성(서버에서 클라이언트에 쓰기)
			ServletOutputStream out=response.getOutputStream();
			
			int numRead;
			
			while(true) {
				numRead = fis.read(b,0,b.length);//데이터 읽음
				
				if(numRead == -1) break;//더 이상 내용이 없으면
				
				out.write(b,0,numRead);//데이터 쓰기
			}
			
			//파일 처리 관련 리소스 정리
			out.flush();
			out.close();
			fis.close();
			
			dao.plusDown(num);
			
		}
		
		else if(url.indexOf("view.do") != -1) {
			System.out.println("\nview.do\n");

			int num = Integer.parseInt(request.getParameter("num"));
			
			//조회수 증가
			dao.plusReadCount(num, session);
			
			BoardDTO dto = dao.viewReplace(num);
			
			request.setAttribute("dto", dto);
			
			page = "/board/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		else if(url.indexOf("commentList") != -1) {
			System.out.println("\ncommentList.do\n");
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			List<BoardCommentDTO> list = dao.commentList(num);
			
			request.setAttribute("list", list);
			
			page = "/board/comment_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		else if(url.indexOf("comment_add.do") != -1) {
			System.out.println("\ncomment_add.do\n");

			int board_num = Integer.parseInt(request.getParameter("board_num"));
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			BoardCommentDTO dto = new BoardCommentDTO();
			
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setContent(content);
			
			dao.commentAdd(dto);
			//백그라운드로 실행하기 때문에 페이지 이동은 필요 없음..
		}
		
		else if(url.indexOf("reply.do") != -1) {
			System.out.println("\nreply.do\n");
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			BoardDTO dto = dao.view(num);
			
			dto.setContent("\n===게시물의 내용===\n" + dto.getContent());
			
			request.setAttribute("dto", dto);
			
			page = "/board/reply.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
		
		else if(url.indexOf("insertReply.do") != -1) {
			System.out.println("\ninsertreply.do\n");
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			BoardDTO dto = dao.view(num);
			
			int ref = dto.getRef();					//답변의 그룹 번호
			int re_step = dto.getRe_step() + 1;		//출력 순번 + 1
			int re_level = dto.getRe_level() + 1;	//출력 레벨 + 1
			
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String passwd = request.getParameter("passwd");
			String ip = request.getRemoteAddr();	//ip주소

			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			dto.setRef(ref);
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			
			//답글 순서 조정
			dao.updateStep(ref,re_step);
			//답글 쓰기
			dao.reply(dto);
			
			page = "/board_servlet/list.do";
			response.sendRedirect(path + page);
			
		}
		
		else if(url.indexOf("pass_check.do") != -1) {
			System.out.println("\npass_check.do\n");
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			String passwd = request.getParameter("passwd");
			
			String result = dao.passwdCheck(num,passwd);
			
			if(result != null) {	//비밀번호가 맞으면?
				page = "/board/edit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			} else {
				page = path + "/board_servlet/view.do?num=" + num + "&message=error";
			}
			
		}
	
		else if(url.indexOf("update.do") != -1) {
			System.out.println("\nupdate.do\n");
			
			File uploadDir = new File(Constants.UPLOAD_PATH); 
			if(!uploadDir.exists()) {	//해당 디렉토리가 존재하지 않으면?
				uploadDir.mkdir();	//디렉토리 생성
			}
			
			MultipartRequest mr = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD 
														, "UTF-8", new DefaultFileRenamePolicy());
			
			int num = Integer.parseInt(mr.getParameter("num"));
			String writer = mr.getParameter("writer");
			String subject = mr.getParameter("subject");
			String content = mr.getParameter("content");
			String passwd = mr.getParameter("passwd");
			String ip = request.getRemoteAddr();	//ip주소
			String filename = " ";	//공백 1개
			int filesize = 0;
			
			try {
				@SuppressWarnings("rawtypes")
				Enumeration files = mr.getFileNames();
				while(files.hasMoreElements()) {
					//첨부파일의 이름
					String file1 = (String)files.nextElement();
					filename = mr.getFilesystemName(file1);
					File f1 = mr.getFile(file1);
					if(f1 != null) {
						filesize = (int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto = new BoardDTO();
			
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//파일 첨부를 하지 않고 글을 썼을 경우?
			//trim() : 좌우 공백 제거
			if(filename == null || filename.trim().equals("")) {
				BoardDTO dto2 = dao.view(num);
				String fName = dto2.getFilename();
				int fSize = dto2.getFilesize();
				int fDown = dto2.getDown();
				
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			} else {
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			String fileDel = mr.getParameter("fileDel");
			//체크박스에 value를 안 쓰면 기본값인 on이 넘어옴
			if(fileDel != null && fileDel.equals("on")) {
				String fileName = dao.getFileName(num);
				File f = new File(Constants.UPLOAD_PATH+fileName);
				f.delete();	//파일 삭제
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			
			dao.update(dto);
			page = "/board_servlet/list.do";
			response.sendRedirect(path + page);
		}
		
		else if(url.indexOf("delete.do") != -1) {
			System.out.println("\ndelete.do\n");
			
			MultipartRequest mr = new MultipartRequest(request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD 
					, "UTF-8", new DefaultFileRenamePolicy());
			int num = Integer.parseInt(mr.getParameter("num"));

			dao.delete(num);
			
			page = "/board_servlet/list.do";
			response.sendRedirect(path + page);
		}
	
	}//doget

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
