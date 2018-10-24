package board;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.Board;
import board.BoardDao;

@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		System.out.println(command);
		switch (command) {
		case "save":
			save(request,response);
			break;

		case "search":
			search(request, response);
			break;
			
		case "view":
			view(request, response);
			break;
			
		case "updateView":
			updateView(request, response);
			break;
		
		case "update":
			update(request, response);
			break;
			
		case "delete":
			delete(request, response);
			break;
			
		default:
			break;
		} // end switch
		
	} // end doPost()

	private void updateView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao bDao = new BoardDao();
		Board b = new Board();
		String nextPage = null;
		try {
			nextPage = "./Board/BoardUpdate.jsp";
			b = bDao.search(num);
			request.setAttribute("resultUpdate", b);
		} catch (Exception e) {
			nextPage = "./Board/Error.jsp";
			request.setAttribute("msg", e.getMessage());
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String nextPage=null;
		BoardDao bDao = new BoardDao();
		Board b = new Board();
		try {
			b = bDao.search(num);
			bDao.updateRate(num);
			request.setAttribute("view", b);
			nextPage = "./Board/BoardView.jsp";
		} catch (Exception e) {
			request.setAttribute("msg", "�Խ��� �ҷ����� ����");
			nextPage = "./Board/Error.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String write = request.getParameter("writer");
		String title = request.getParameter("title");
		String cont = request.getParameter("content");
		Board b = new Board();
		b.setWrite(write);
		b.setTitle(title);
		b.setCont(cont);
		
		System.out.println(b);
		BoardDao bDao = new BoardDao();
		String nextPage = null;
		try {
			bDao.save(b);
			nextPage = "./Board/Result.jsp";
			request.setAttribute("msg", "저장 하였습니다");
		} catch (SQLException e) {
			nextPage = "./Board/Error.jsp";
			request.setAttribute("msg", e.getMessage());
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
		
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Board> bArr;
		BoardDao bDao = new BoardDao();
		String nextPage = null;
		try {
			bArr = bDao.search();
			nextPage = "./Board/BoardList.jsp";
			request.setAttribute("bArr", bArr);
		} catch (Exception e) {
			nextPage = "./Board/Error.jsp";
			request.setAttribute("msg", e.getMessage());
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String cont = request.getParameter("content");
		Board b = new Board();
		b.setNum(num);
		b.setTitle(title);
		b.setCont(cont);
		
		System.out.println(b);
		BoardDao bDao = new BoardDao();
		String nextPage = null;
		try {
			bDao.update(b);
			nextPage = "./Board/Result.jsp";
			request.setAttribute("msg", "수정되었습니다.");
		} catch (Exception e) {
			nextPage = "./Board/Error.jsp";
			request.setAttribute("msg", e.getMessage());
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
		
	}
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		BoardDao bDao = new BoardDao();
		String nextPage = null;
		try {
			bDao.delete(num);
			nextPage = "./Board/Result.jsp";
			request.setAttribute("msg", "삭제되었습니다.");
		} catch (Exception e) {
			nextPage = "./Board/Error.jsp";
			request.setAttribute("msg", e.getMessage());
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}
