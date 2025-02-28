package DAO;

import DTO.boardDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class boardDAO {
    private Connection conn; // 데이터베이스 연결 객체

    // 데이터베이스 연결 생성자
    public boardDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버 로드
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/used_market", "root", "password");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 게시글 목록 조회 (전체 게시글)
    public List<boardDTO> getAllBoards() {
        List<boardDTO> boardList = new ArrayList<>();
        String sql = "SELECT * FROM Board ORDER BY created_at DESC";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                boardList.add(new boardDTO(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("price"),
                    rs.getInt("seller_id")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return boardList;
    }

    // 게시글 상세 조회 (ID로 조회)
    public boardDTO getBoardById(int id) {
        String sql = "SELECT * FROM Board WHERE id=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new boardDTO(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("price"),
                    rs.getInt("seller_id")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 게시글을 찾을 수 없으면 null 반환
    }

    // 게시글 작성 (Insert)
    public boolean createBoard(boardDTO board) {
        String sql = "INSERT INTO Board (title, content, price, seller_id) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getPrice());
            pstmt.setInt(4, board.getSellerId());
            
            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 게시글 수정 (Update)
    public boolean updateBoard(boardDTO board) {
        String sql = "UPDATE Board SET title=?, content=?, price=? WHERE id=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getPrice());
            pstmt.setInt(4, board.getId());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 게시글 삭제 (Delete)
    public boolean deleteBoard(int id) {
        String sql = "DELETE FROM Board WHERE id=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
