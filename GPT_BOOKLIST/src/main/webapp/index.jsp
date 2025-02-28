<%@ page import="java.util.*, DTO.Book, DAO.BookDAO"  %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>도서 관리 시스템</title>
</head>
<body>
    <h1>도서 목록</h1>
    <a href="addBook.jsp">도서 추가</a>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>저자</th>
            <th>출판사</th>
            <th>연도</th>
            <th>장르</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <%
            BookDAO dao = new BookDAO();
            List<Book> books = dao.getAllBooks();
            for (Book book : books) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPublisher() %></td>
            <td><%= book.getYear() %></td>
            <td><%= book.getGenre() %></td>
            <td><a href="editBook.jsp?id=<%= book.getId() %>">수정</a></td>
            <td><a href="deleteBook.jsp?id=<%= book.getId() %>">삭제</a></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
