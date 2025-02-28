<%@ page import="DAO.BookDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    BookDAO dao = new BookDAO();
    dao.deleteBook(id);
    response.sendRedirect("index.jsp");
%>
