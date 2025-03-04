package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.Member;
import util.DBConnection;

public class MemberDAO {
	
	//멤버 등록
	public void insert(Member member) {
        String sql = "INSERT INTO Member (username, age) VALUES (?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, member.getUsername());
            pstmt.setInt(2, member.getAge());
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	public List<Member> getList() {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM member ORDER BY id username";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
            	Member dto = new Member(rs.getString("username"),rs.getInt("age"));
                dto.getUsername();
                dto.getAge();
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
