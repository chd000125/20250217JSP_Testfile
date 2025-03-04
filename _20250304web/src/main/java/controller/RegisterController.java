package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Member;
import dao.MemberDAO;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register") // 요청명
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String age = request.getParameter("age");
		
		Member member = new Member(username, Integer.parseInt(age)); // 형변환 필요(dto에서 int로 지정했기 때문)
		MemberDAO dao = new MemberDAO();
		dao.insert(member);
		
		request.setAttribute("member", member);
		//view로 포워딩
		String viewPath = "result.jsp";
		RequestDispatcher dispathcher = request.getRequestDispatcher(viewPath);
		dispathcher.forward(request, response);

		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
