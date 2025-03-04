package com.board.dao;

import java.sql.*;
import java.util.*;
import com.board.dto.BoardDTO;

public class BoardDAO {
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3309/board",
            "root", "1234"
        );
    }
    
    public List<BoardDTO> getList(int start, int size) throws Exception {
        List<BoardDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM board ORDER BY id DESC LIMIT ?, ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, start);
            pstmt.setInt(2, size);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BoardDTO board = new BoardDTO();
                    board.setId(rs.getInt("id"));
                    board.setTitle(rs.getString("title"));
                    board.setWriter(rs.getString("writer"));
                    board.setRegdate(rs.getTimestamp("regdate"));
                    board.setViewcount(rs.getInt("viewcount"));
                    list.add(board);
                }
            }
        }
        return list;
    }
    
    public int getTotalCount() throws Exception {
        String sql = "SELECT COUNT(*) FROM board";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            return rs.next() ? rs.getInt(1) : 0;
        }
    }
    
    // 게시글 상세 조회
    public BoardDTO getBoard(int id) throws Exception {
        String sql = "SELECT * FROM board WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    BoardDTO board = new BoardDTO();
                    board.setId(rs.getInt("id"));
                    board.setTitle(rs.getString("title"));
                    board.setContent(rs.getString("content"));
                    board.setWriter(rs.getString("writer"));
                    board.setRegdate(rs.getTimestamp("regdate"));
                    board.setViewcount(rs.getInt("viewcount"));
                    return board;
                }
            }
        }
        return null;
    }
    
    // 조회수 증가
    public void increaseViewCount(int id) throws Exception {
        String sql = "UPDATE board SET viewcount = viewcount + 1 WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
    
    // 게시글 등록
    public void insertBoard(BoardDTO board) throws Exception {
        String sql = "INSERT INTO board (title, content, writer) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getWriter());
            pstmt.executeUpdate();
        }
    }
    
    // 게시글 수정
    public void updateBoard(BoardDTO board) throws Exception {
        String sql = "UPDATE board SET title=?, content=? WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getId());
            pstmt.executeUpdate();
        }
    }
    
    // 게시글 삭제
    public void deleteBoard(int id) throws Exception {
        String sql = "DELETE FROM board WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
} 