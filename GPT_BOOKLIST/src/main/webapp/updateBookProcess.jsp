<%@ page import="DTO.Book" %>
<%@ page import="DAO.BookDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>책 수정 처리</title>
</head>
<body>
    <h1>책 수정 처리</h1>

    <%
        // 수정된 책 정보를 받아오기
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        int year = Integer.parseInt(request.getParameter("year"));
        String genre = request.getParameter("genre");

        // 수정된 책 정보로 Book 객체 생성
        Book updatedBook = new Book(id, title, author, publisher, year, genre);

        // DAO 객체 생성
        BookDAO dao = new BookDAO();

        // updateBook 메소드 호출 시 전달할 객체 수정
        boolean result = dao.updateBook(updatedBook); // Book 객체를 메소드에 전달

        if (result == true) {
            out.println("<p>책 정보가 수정되었습니다!</p>");
            out.println("<p><a href='index.jsp'>목록으로 돌아가기</a></p>");
        } else {
            out.println("<p>수정 실패. 다시 시도해 주세요.</p>");
            out.println("<p><a href='editBook.jsp?id=" + id + "'>수정하기</a></p>");
        }
    %>
</body>
</html>
