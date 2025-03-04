package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.board.model.*;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
    private BoardDAO dao = new BoardDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        
        String view = null;
        
        try {
            switch (command) {
                case "/list.do":
                    request.setAttribute("list", dao.getList());
                    view = "/board/list.jsp";
                    break;
                    
                case "/write.do":
                    if ("GET".equals(request.getMethod())) {
                        view = "/board/write.jsp";
                    } else {
                        BoardDTO dto = new BoardDTO();
                        dto.setTitle(request.getParameter("title"));
                        dto.setContent(request.getParameter("content"));
                        dto.setWriter(request.getParameter("writer"));
                        dao.insert(dto);
                        response.sendRedirect("list.do");
                        return;
                    }
                    break;
                    
                case "/view.do":
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("board", dao.getBoard(id));
                    view = "/board/view.jsp";
                    break;
                    
                case "/edit.do":
                    if ("GET".equals(request.getMethod())) {
                        request.setAttribute("board", 
                            dao.getBoard(Integer.parseInt(request.getParameter("id"))));
                        view = "/board/edit.jsp";
                    } else {
                        BoardDTO dto = new BoardDTO();
                        dto.setId(Integer.parseInt(request.getParameter("id")));
                        dto.setTitle(request.getParameter("title"));
                        dto.setContent(request.getParameter("content"));
                        dao.update(dto);
                        response.sendRedirect("view.do?id=" + dto.getId());
                        return;
                    }
                    break;
                    
                case "/delete.do":
                    dao.delete(Integer.parseInt(request.getParameter("id")));
                    response.sendRedirect("list.do");
                    return;
                    
                default:
                    response.sendRedirect("list.do");
                    return;
            }
            
            if (view != null) {
                request.getRequestDispatcher(view).forward(request, response);
            } else {
                response.sendRedirect("list.do");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error/500.jsp");
        }
    }
} 