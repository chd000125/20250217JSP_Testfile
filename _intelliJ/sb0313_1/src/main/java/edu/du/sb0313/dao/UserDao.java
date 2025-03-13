package edu.du.sb0313.dao;

import edu.du.sb0313.dto.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

import java.util.List;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
//    private final JdbcTemplate jdbcTemplate;
//    @Autowired
//    public UserDao(JdbcTemplate jdbcTemplate) {
//        this.jdbcTemplate = jdbcTemplate;
//    }

    //사용자 수
    public int count() {
        return jdbcTemplate.queryForObject("select count(*) from users", Integer.class);
    }

    // 사용자 추가
    public int addUser(Users user) {
        String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, user.getUsername(), user.getEmail(), user.getPassword());
    }

    // 사용자 조회 (ID로 조회)
    public Users getUserById(Long id) {
        String sql = "SELECT id, username, email, password, created_at, updated_at FROM users WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, userRowMapper());
    }

    // 모든 사용자 조회
    public List<Users> getAllUsers() {
        String sql = "SELECT id, username, email, password, created_at, updated_at FROM users";
        return jdbcTemplate.query(sql, userRowMapper());
    }

    // 사용자 삭제
    public int deleteUser(Long id) {
        String sql = "DELETE FROM users WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    // 사용자 정보 수정
    public int updateUser(Users user) {
        String sql = "UPDATE users SET username = ?, email = ?, password = ? WHERE id = ?";
        return jdbcTemplate.update(sql, user.getUsername(), user.getEmail(), user.getPassword(), user.getId());
    }

    // RowMapper를 사용하여 결과를 Users 객체로 변환
    private RowMapper<Users> userRowMapper() {
        return (rs, rowNum) -> {
            Users user = new Users();
            user.setId(rs.getLong("id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
            user.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
            return user;
        };
    }
}
