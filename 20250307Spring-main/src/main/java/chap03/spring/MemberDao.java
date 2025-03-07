package chap03.spring;

import java.util.Collection;

import org.springframework.jdbc.core.JdbcTemplate;


public class MemberDao {
	
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public Member selectByEmail(String email) {
		return null;
	}
	
	public void insert(Member member) {
		String sql = "INSERT INTO member(email, password, name, regdate) VALUES  (?, ?, ?, now())";
		member.getEmail(); member.getPassword(); member.getName(); member.getRegisterDateTime();
		
	}
	
	public void update(Member member) {}
	
	public Collection<Member> selectAll(){
		return null;
	}
	
}
