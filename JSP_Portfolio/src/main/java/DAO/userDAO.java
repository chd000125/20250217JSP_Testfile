package DAO;

import DTO.userDTO;
import java.sql.*;

public class userDAO {
    private Connection conn;

    // 데이터베이스 연결 생성자
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/portfolio", "root", "password");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    // 회원가입 (C)
    public void register(userDTO user) throws SQLException {
    	String sql = "INSERT INTO userInfo (userId, nickname, userPw, userEm) values (?, ?, ?, ?)";
		try(Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getNickname());
			pstmt.setString(3, user.getUserPw());
			pstmt.setString(4, user.getUserEm());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
    }
    
 // 로그인 기능 (아이디와 비밀번호 확인)
    public userDTO login(String userId, String userPw) {
        String sql = "SELECT * FROM userInfo WHERE userId=? AND userPw=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) { // 사용자 정보가 존재할 경우
                return new userDTO(
                    rs.getString("userId"),
                    rs.getString("nickname"),
                    rs.getString("userPw"),
                    rs.getString("userEm"),
                    rs.getString("loc")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 로그인 실패 시 null 반환
    }
}

