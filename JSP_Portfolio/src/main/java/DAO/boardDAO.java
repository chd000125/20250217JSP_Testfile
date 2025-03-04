package DAO;

import DTO.boardDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class boardDAO {
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3309/portfolio";
        String user = "root";
        String password = "1234";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(url, user, password);
    }

    // 게시글 저장 (C)
    public void saveBoard(boardDTO board) {
        String sql = "INSERT INTO board (title, content, price, seller_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getPrice());
            pstmt.setString(4, board.getSellerId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 전체 게시글 조회 (R)
    public List<boardDTO> getAllBoards() {
        List<boardDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM board ORDER BY created_at DESC";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                boardDTO board = new boardDTO(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("content"),
                    rs.getInt("price"),
                    rs.getString("seller_id"),
                    rs.getTimestamp("created_at")
                );
                list.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
