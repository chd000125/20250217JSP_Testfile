package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.MemberDTO;

public class MemberDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    // DB 연결 정보
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3309/jspdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
    private static final String USER = "root";  // MySQL 사용자 이름
    private static final String PASS = "1234";  // MySQL 비밀번호
    
    // DB 연결 메소드
    public void connect() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASS);
            if(conn != null) {
                System.out.println("DB 연결 성공!");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로드 실패: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 연결 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
    public Connection connect(int x) {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASS);
            if(conn != null) {
                System.out.println("DB 연결 성공!");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로드 실패: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 연결 실패: " + e.getMessage());
            e.printStackTrace();
        }
		return conn;
    }
    
    // DB 연결 해제 메소드
    public void disconnect() {
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // 회원 등록 메소드 (Create)
    public boolean insertMember(MemberDTO member) {
        boolean success = false;
        try {
            connect();
            // 중복 ID 체크를 위한 새로운 연결 생성
            if(isExistingId(member.getId())) {
                System.out.println("중복된 ID 존재: " + member.getId());
                return false;
            }
            
            String sql = "INSERT INTO member (id, password, name, email, reg_date) VALUES (?, ?, ?, ?, NOW())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());
            
            int result = pstmt.executeUpdate();
            if(result > 0) {
                success = true;
                System.out.println("회원 등록 성공: " + member.getId());
            }
            
        } catch (SQLException e) {
            System.out.println("회원 등록 실패: " + e.getMessage());
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return success;
    }
    
    // ID 중복 체크를 위한 별도 메소드
    private boolean isExistingId(String id) {
        boolean exists = false;
        Connection checkConn = null;
        PreparedStatement checkPstmt = null;
        ResultSet checkRs = null;
        
        try {
            Class.forName(DRIVER);
            checkConn = DriverManager.getConnection(URL, USER, PASS);
            String sql = "SELECT COUNT(*) FROM member WHERE id = ?";
            checkPstmt = checkConn.prepareStatement(sql);
            checkPstmt.setString(1, id);
            checkRs = checkPstmt.executeQuery();
            
            if(checkRs.next()) {
                exists = checkRs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(checkRs != null) checkRs.close();
                if(checkPstmt != null) checkPstmt.close();
                if(checkConn != null) checkConn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return exists;
    }
    
    // 회원 조회 메소드 (Read)
    public MemberDTO getMember(String id) {
        MemberDTO member = null;
        Connection checkConn = null;
        PreparedStatement checkPstmt = null;
        ResultSet checkRs = null;
        
        try {
            Class.forName(DRIVER);
            checkConn = DriverManager.getConnection(URL, USER, PASS);
            String sql = "SELECT * FROM member WHERE id = ?";
            checkPstmt = checkConn.prepareStatement(sql);
            checkPstmt.setString(1, id);
            checkRs = checkPstmt.executeQuery();
            
            if(checkRs.next()) {
                member = new MemberDTO();
                member.setId(checkRs.getString("id"));
                member.setPassword(checkRs.getString("password"));
                member.setName(checkRs.getString("name"));
                member.setEmail(checkRs.getString("email"));
                member.setRegDate(checkRs.getString("reg_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(checkRs != null) checkRs.close();
                if(checkPstmt != null) checkPstmt.close();
                if(checkConn != null) checkConn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return member;
    }
    
    // 전체 회원 목록 조회 메소드
    public List<MemberDTO> getAllMembers() {
        List<MemberDTO> memberList = new ArrayList<>();
        try {
            connect();
            String sql = "SELECT * FROM member";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setRegDate(rs.getString("reg_date"));
                memberList.add(member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return memberList;
    }
    
    // 회원 수정 메소드 (Update)
    public boolean updateMember(MemberDTO member) {
        boolean success = false;
        try {
            connect();
            // 기존 회원 확인
            MemberDTO existingMember = getMember(member.getId());
            if(existingMember == null) {
                return false;
            }
            
            String sql = "UPDATE member SET password=?, name=?, email=? WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getPassword());
            pstmt.setString(2, member.getName());
            pstmt.setString(3, member.getEmail());
            pstmt.setString(4, member.getId());
            
            int result = pstmt.executeUpdate();
            if(result > 0) success = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return success;
    }
    
    // 회원 삭제 메소드 (Delete)
    public boolean deleteMember(String id) {
        boolean success = false;
        try {
            connect();
            // 기존 회원 확인
            if(getMember(id) == null) {
                return false;
            }
            
            String sql = "DELETE FROM member WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            
            int result = pstmt.executeUpdate();
            if(result > 0) success = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return success;
    }
    
    // 회원 검색 메소드 추가 (Read with Search)
    public List<MemberDTO> searchMembers(String keyword) {
        List<MemberDTO> memberList = new ArrayList<>();
        try {
            connect();
            String sql = "SELECT * FROM member WHERE id LIKE ? OR name LIKE ? OR email LIKE ?";
            pstmt = conn.prepareStatement(sql);
            String searchKeyword = "%" + keyword + "%";
            pstmt.setString(1, searchKeyword);
            pstmt.setString(2, searchKeyword);
            pstmt.setString(3, searchKeyword);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setRegDate(rs.getString("reg_date"));
                memberList.add(member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            disconnect();
        }
        return memberList;
    }
} 