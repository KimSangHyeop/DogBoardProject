package customer;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/custo.do")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		System.out.println(command);
		switch (command) {
		case "save":
			save(request, response);
			break;
		case "list":
			list(request, response);
			break;
		case "search":
			search(request, response);
			break;
		case "searchId":
			searchId(request, response);
			break;
		case "searchPass":
			searchPass(request, response);
			break;
		case "view":
			view(request, response);
			break;
		case "delete":
			delete(request, response);
			break;
		case "login":
			login(request, response);
			break;
		case "update":
			update(request, response);
			break;
		case "logout":
			HttpSession s = request.getSession(false);
			s.invalidate(); 
			request.getRequestDispatcher("index.jsp").forward(request, response);
			break;
		default:
			break;
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer c = new Customer();
		
		c.setName(request.getParameter("name"));
		c.setAge(request.getParameter("age"));
		c.setUserid(request.getParameter("userid"));
		c.setPassword(request.getParameter("password"));
		c.setTelNum(request.getParameter("telNum"));
		c.setGender(request.getParameter("gender"));
		c.setAddr(request.getParameter("addr"));
		c.setDetailAddr(request.getParameter("detailAddr"));
		c.setContent(request.getParameter("content"));
		
		CustomerDao dao = new CustomerDao();
		String next = null;
		try {
			if(c.getContent().isEmpty()) {
				next = "./Customer/CustomerUpdate.jsp";
				request.setAttribute("Info", c);
			}
			else if(c.getPassword().isEmpty()) {
				next = "./Customer/CustomerUpdate.jsp";
				request.setAttribute("Info", c);
			}
			else if(c.getTelNum().isEmpty()) {
				next = "./Customer/CustomerUpdate.jsp";
				request.setAttribute("Info", c);
			}
			else if(c.getDetailAddr().isEmpty()) {
				next = "./Customer/CustomerUpdate.jsp";
				request.setAttribute("Info", c);
			}
			else {
				dao.update(c);
				next = "./Customer/Result.jsp";
				request.setAttribute("msg", "회원정보를 수정하였습니다.");
			}
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			next = "./Customer/Error.jsp";
		}
		request.getRequestDispatcher(next).forward(request, response);
		
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDao dao = new CustomerDao();
		String userid = request.getParameter("userid");
		String pass = request.getParameter("password");
	
		String nextPage = null;
		try {
			String pass2 = dao.search(userid);
			
			System.out.println(pass2);
			if (pass2.isEmpty()) {
				request.setAttribute("msg", "아이디가 없습니다.");
				nextPage = "/Customer/failCheck.jsp";
			} else if (pass2.equals(pass)) {
				Customer c = dao.search(userid, pass);
				request.setAttribute("Info", c);
				nextPage = "/Customer/CustomerUpdate.jsp";
			} else {
				request.setAttribute("msg", "비밀번호가 다릅니다. 다시 입력해주세요.");
				nextPage = "/Customer/failCheck.jsp";
			}
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			nextPage = "/Customer/Error.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
	
	private void searchId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String telNum = request.getParameter("telNum");
		
		Customer c = new Customer();
		c.setName(name);
		c.setAge(age);
		c.setTelNum(telNum);
		String next = null;

		CustomerDao dao = new CustomerDao();
		try {
			String userid = dao.searchId(c);
			System.out.println(userid);
			if(userid==null){
				request.setAttribute("msg", "입력한 유저의 정보가 없습니다.");
				next = "./Customer/failSearchId.jsp";
			}
			else {
				request.setAttribute("msg", "회원님의 아이디는 "+userid+" 입니다.");
				next = "./Customer/Result.jsp";
			}
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			next = "./Customer/Error.jsp";
		}
		request.getRequestDispatcher(next).forward(request, response);	
	}

	private void searchPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userId");
		String name = request.getParameter("name");
		String telNum = request.getParameter("telNum");
		
		Customer c = new Customer();
		c.setName(name);
		c.setUserid(userid);
		c.setTelNum(telNum);
		CustomerDao dao = new CustomerDao();
		String next = null;
		
		try {
			String password = dao.searchPass(c);
			System.out.println(password);
			if(password==null){
				request.setAttribute("msg", "입력한 유저의 정보가 없습니다.");
				next = "./Customer/failSearchPass.jsp";
			}
			else {
				request.setAttribute("msg", "회원님의 비밀번호는 "+password+" 입니다.");
				next = "./Customer/Result.jsp";
			}
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			next = "./Customer/Error.jsp";
		}
		request.getRequestDispatcher(next).forward(request, response);	
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDao dao = new CustomerDao();
		String userid = request.getParameter("userid");
		String pass = request.getParameter("password");
		String next = "index.jsp"; 
		try {
			String pass2 = dao.search(userid);
			if (pass2.isEmpty()) {
				request.setAttribute("msg", "아이디가 없습니다. 다시 입력해주세요.");
				next = "/Customer/failLogin.jsp";
			} else if (pass2.equals(pass)) {
				//request.setAttribute("msg", "로그인");
				HttpSession s = request.getSession();
				s.setAttribute("userid", userid);
			} else {
				request.setAttribute("msg", "비밀번호가 다릅니다. 다시 입력해주세요.");
				next = "/Customer/failLogin.jsp";
			}
		} catch (SQLException e) {
			request.setAttribute("msg", e.getMessage());
			next = "./Error.jsp";
		}
		request.getRequestDispatcher(next).forward(request, response);
	}

	protected void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer c = new Customer();
		c.setName(request.getParameter("name"));
		c.setAge(request.getParameter("age"));
		c.setUserid(request.getParameter("userid"));
		c.setPassword(request.getParameter("password"));
		c.setTelNum(request.getParameter("telNum"));
		c.setGender(request.getParameter("gender"));
		c.setAddr(request.getParameter("addr"));
		c.setDetailAddr(request.getParameter("detailAddr"));
		c.setContent(request.getParameter("content"));
		
		CustomerDao dao = new CustomerDao();
		String next = null;
		try {
			dao.save(c);
			next = "./Customer/Result.jsp";
			request.setAttribute("msg", "회원가입 성공하였습니다.");
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			next = "./Customer/Error.jsp";
		}
		request.getRequestDispatcher(next).forward(request, response);

	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Customer> result;
		CustomerDao dao = new CustomerDao();
		String nextPage = "CustomerList.jsp";
		try {
			result = dao.search();
			request.setAttribute("resultList", result);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			nextPage = "Error.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request, response);

	}

	protected void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer c = new Customer();
		c.setName(request.getParameter("name"));
		c.setAge(request.getParameter("age"));
		c.setUserid(request.getParameter("userid"));
		c.setPassword(request.getParameter("password"));
		c.setTelNum(request.getParameter("telNum"));
		c.setGender(request.getParameter("gender"));
		c.setAddr(request.getParameter("addr"));
		c.setDetailAddr(request.getParameter("detailAddr"));
		c.setContent(request.getParameter("content"));
		
		CustomerDao dao = new CustomerDao();

		String nextPage = "/Customer/CustomerUpdate.jsp";
		try {
			Customer result = dao.search(c.getUserid(), c.getPassword());
			request.setAttribute("resultView", result);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			nextPage = "/Customer/Error.jsp";
		}
		request.getRequestDispatcher(nextPage).forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userid = request.getParameter("userid");
		String nextPage = "/Customer/Result.jsp";
		CustomerDao dao = new CustomerDao();
		try {
			dao.delete(userid);
			request.setAttribute("msg", "회원이 탈퇴되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원탈퇴 실패하였습니다.");
		}
		HttpSession s = request.getSession(false);
		s.invalidate(); 
		request.getRequestDispatcher(nextPage).forward(request, response);
	}
}
