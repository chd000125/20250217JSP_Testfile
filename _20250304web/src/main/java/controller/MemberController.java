package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.Member;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI(); //클라이언트가 요청한 전체 URI를 가져온다.
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        System.out.println(command);
        
        String view = null;
		MemberDAO dao = new MemberDAO();
        try {
            switch (command) {
                case "/index.do":
//                    request.setAttribute("list", dao.getList());
                    view = "/index.jsp";
                    break;
                    
                case "/register.do":
                	String username = request.getParameter("username");
            		String age = request.getParameter("age");
            		
            		Member member = new Member(username, Integer.parseInt(age)); // 형변환 필요(dto에서 int로 지정했기 때문)

            		dao.insert(member);
            		
            		request.setAttribute("member", member);
            		//view로 포워딩
            		String viewPath = "result.jsp";
                	break;
                	
                case "/list.do":
                	request.setAttribute("list", dao.getList());
                	view = "/list.jsp";
                	
                default:
                    response.sendRedirect("index.do");
                    return;
            }
            
            if (view != null) {
                request.getRequestDispatcher(view).forward(request, response);
            } else {
                response.sendRedirect("index.do");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error/500.jsp");
        }
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
