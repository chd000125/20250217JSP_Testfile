package com.example.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.example.entity.Member;


public class MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<Member> memberRowMapper = (rs, rowNum) ->{
		Member member = new Member(
				rs.getString(0),
				rs.getString(1),
				rs.getString(2),
				rs.getTimestamp(4).toLocalDateTime());
		return null;
	};
	
	
	public MemberDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public MemberDao() {}
	
	

	public Member selectByEmail(String email) {
	    String sql = "SELECT email FROM MEMBER WHERE id = ?";
	    List<Member> result = jdbcTemplate.query(sql, memberRowMapper, email);

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
