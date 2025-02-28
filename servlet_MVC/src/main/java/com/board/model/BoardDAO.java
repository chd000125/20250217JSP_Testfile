package com.board.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.board.util.DBConnection;

public class BoardDAO {
    
    // 게시글 목록 조회
    public List<BoardDTO> getList() {
        List<BoardDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM board ORDER BY id DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setWriter(rs.getString("writer"));
                dto.setRegdate(rs.getTimestamp("regdate"));
                dto.setViewcount(rs.getInt("viewcount"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // 게시글 작성
    public void insert(BoardDTO dto) {
        String sql = "INSERT INTO board (title, content, writer) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getWriter());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // 게시글 상세 조회
    public BoardDTO getBoard(int id) {
        BoardDTO dto = null;
        String sql = "SELECT * FROM board WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    dto = new BoardDTO();
                    dto.setId(rs.getInt("id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setWriter(rs.getString("writer"));
                    dto.setRegdate(rs.getTimestamp("regdate"));
                    dto.setViewcount(rs.getInt("viewcount"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    // 게시글 수정
    public void update(BoardDTO dto) {
        String sql = "UPDATE board SET title=?, content=? WHERE id=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getId());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // 게시글 삭제
    public void delete(int id) {
        String sql = "DELETE FROM board WHERE id=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
} 