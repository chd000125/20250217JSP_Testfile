package chap03.spring;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;


public class MemberDao {
	
	private JdbcTemplate jdbcTemplate;
	private String string;
	
	public MemberDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public Member selectByEmail(String email) {
	    String sql = "SELECT * FROM MEMBER WHERE email = ?";
	    List<Member> result = jdbcTemplate.query(sql, 
	        (rs, rowNum) -> new Member(
	            rs.getString(1),  // email
	            rs.getString(2),  // name
	            rs.getString(3),  // 다른 필드 (예: 주소 등)
	            rs.getTimestamp(4).toLocalDateTime()  // 날짜 필드
	        ), 
	        email); // 이메일을 ?에 바인딩

	    return null;	
	}
	
	public void insert(Member member) {
		String sql = "INSERT INTO member(email, password, name, regdate) VALUES  (?, ?, ?, now())";
		member.getEmail(); member.getPassword(); member.getName(); member.getRegisterDateTime();
		
	}
	
	public void update(Member member) {
		String sql = "UPDATE MEMBER SET email = ?, password = ?, name = ?, regdate = now()";
		
		
	}
	
	public List<Member> selectAll(){
		String sql = "select * from MEMBER";
		List<Member> result = jdbcTemplate.query(sql,(rs, rowNum)->{
			Member member = new Member(rs.getString(1),rs.getString(2),rs.getString(3),
					rs.getTimestamp(4).toLocalDateTime());
				return member;
	});
		return result;
	}
//	List<Member> result = jdbcTemplate.query(sql, new RowMapper<Member>() {
//
//		@Override
//		public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
//			Member member = new Member(rs.getString(1),rs.getString(2),rs.getString(3),
//					rs.getTimestamp(4).toLocalDateTime());
	
}
