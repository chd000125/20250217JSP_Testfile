package edu.du.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import edu.du.entity.Member;

public class MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final RowMapper<Member> memberRowMapper = (rs, rowNum) -> {
			Member member = new Member(rs.getString("email"), rs.getString("password"), rs.getString("name"),
					rs.getTimestamp("regdate").toLocalDateTime());
			return member;
		};
	

	public Member selectByEmail(String email) {
		 String sql = "SELECT * FROM MEMBER WHERE email = ?";
	     return jdbcTemplate.queryForObject(sql, memberRowMapper, email);
	}

	public void insert(Member member) {
		String sql = "insert into MEMBER(email, password, name, regdate) values (?,?,?, now())";
		jdbcTemplate.update(sql, member.getEmail(), member.getPassword(), member.getName());

	}

	public void update(Member member) {
		String sql = "UPDATE MEMBER SET name = ?, email = ?, password = ?, regdate=now() WHERE id = ?";
        jdbcTemplate.update(sql, member.getName(), member.getEmail(), member.getPassword(), member.getId());
	}

	public List<Member> selectAll() {
		String sql = "select * from MEMBER";
		List<Member> results = jdbcTemplate.query(sql, memberRowMapper);
		
//		List<Member> results = jdbcTemplate.query(sql, new RowMapper<Member>() {
//
//			@Override
//			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
//				Member member = new Member(rs.getString("email"), rs.getString("password"), rs.getString("name"),
//						rs.getTimestamp("regdate").toLocalDateTime());
//				return member;
//			}
//			
//		});
		return results;
	}
}






