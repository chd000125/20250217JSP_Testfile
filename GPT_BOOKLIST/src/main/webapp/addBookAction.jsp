<%@ page import="DTO.Book, DAO.BookDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String publisher = request.getParameter("publisher");
    int year = Integer.parseInt(request.getParameter("year"));
    String genre = request.getParameter("genre");

    Book book = new Book(0, title, author, publisher, year, genre);
    BookDAO dao = new BookDAO();
    dao.addBook(book);

    response.sendRedirect("index.jsp");
%>
