<%@ page import="DTO.Book" %>
<%@ page import="DAO.BookDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>책 수정</title>
</head>
<body>
    <h1>책 수정</h1>

    <%
        // URL 파라미터로 전달된 책 ID를 받아옴
        int bookId = Integer.parseInt(request.getParameter("id"));
        
        // BookDAO 객체를 생성하고, 해당 ID의 책 정보를 가져옴
        BookDAO dao = new BookDAO();
        Book book = dao.getBookById(bookId);  // 책 정보 가져오기

        // 책 정보가 없으면 오류 메시지 출력
        if (book == null) {
            out.println("<p>책 정보를 찾을 수 없습니다.</p>");
        } else {
    %>

    <!-- 수정 폼 생성 -->
    <form action="updateBookProcess.jsp" method="post">
        <!-- 책의 ID는 수정할 필요가 없으므로 hidden input으로 전송 -->
        <input type="hidden" name="id" value="<%= book.getId() %>">
        
        <p>제목: <input type="text" name="title" value="<%= book.getTitle() %>"></p>
        <p>저자: <input type="text" name="author" value="<%= book.getAuthor() %>"></p>
        <p>출판사: <input type="text" name="publisher" value="<%= book.getPublisher() %>"></p>
        <p>연도: <input type="number" name="year" value="<%= book.getYear() %>"></p>
        <p>장르: <input type="text" name="genre" value="<%= book.getGenre() %>"></p>
        
        <p><input type="submit" value="수정하기"></p>
    </form>

    <% 
        }
    %>

    <!-- 목록으로 돌아가는 링크 -->
    <p><a href="index.jsp">목록으로 돌아가기</a></p>
</body>
</html>
