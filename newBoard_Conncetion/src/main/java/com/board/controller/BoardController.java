package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
    private BoardDAO dao;
    
    @Override
    public void init() throws ServletException {
        dao = new BoardDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        
        String viewPage = null;
        
        try {
            switch (command) {
                case "/list.do":
                    viewPage = list(request);
                    break;
                case "/write.do":
                    viewPage = write(request);
                    break;
                case "/writeAction.do":
                    writeAction(request);
                    response.sendRedirect("list.do");
                    return;
                case "/view.do":
                    viewPage = view(request);
                    break;
                case "/modify.do":
                    viewPage = modify(request);
                    break;
                case "/modifyAction.do":
                    modifyAction(request);
                    response.sendRedirect("list.do");
                    return;
                case "/delete.do":
                    deleteAction(request);
                    response.sendRedirect("list.do");
                    return;
            }
            
            if (viewPage != null) {
                request.getRequestDispatcher(viewPage).forward(request, response);
            }
            
        } catch (Exception e) {
            throw new ServletException("Controller 오류", e);
        }
    }
    
    private String list(HttpServletRequest request) throws Exception {
        int page = 1;
        int size = 10;
        
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            page = Integer.parseInt(pageStr);
        }
        
        int totalCount = dao.getTotalCount();
        int totalPages = (totalCount + size - 1) / size;
        int start = (page - 1) * size;
        
        request.setAttribute("boardList", dao.getList(start, size));
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        
        return "/WEB-INF/views/board/list.jsp";
    }
    
    private String write(HttpServletRequest request) {
        return "/WEB-INF/views/board/write.jsp";
    }
    
    private void writeAction(HttpServletRequest request) throws Exception {
        BoardDTO board = new BoardDTO();
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));
        
        dao.insertBoard(board);
    }
    
    private String view(HttpServletRequest request) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.increaseViewCount(id);
        request.setAttribute("board", dao.getBoard(id));
        
        return "/WEB-INF/views/board/view.jsp";
    }
    
    private String modify(HttpServletRequest request) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("board", dao.getBoard(id));
        
        return "/WEB-INF/views/board/modify.jsp";
    }
    
    private void modifyAction(HttpServletRequest request) throws Exception {
        BoardDTO board = new BoardDTO();
        board.setId(Integer.parseInt(request.getParameter("id")));
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        
        dao.updateBoard(board);
    }
    
    private void deleteAction(HttpServletRequest request) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteBoard(id);
    }
} 