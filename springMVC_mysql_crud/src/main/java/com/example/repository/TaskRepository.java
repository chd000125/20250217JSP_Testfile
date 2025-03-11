package com.example.repository;

import com.example.model.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class TaskRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<Task> taskRowMapper = (ResultSet rs, int rowNum) -> {
        Task task = new Task();
        task.setId(rs.getLong("id"));
        task.setTitle(rs.getString("title"));
        task.setDescription(rs.getString("description"));
        task.setStatus(rs.getString("status"));
        task.setDueDate(rs.getString("due_date"));
        return task;
    };

    public List<Task> findAll() {
        return jdbcTemplate.query("SELECT * FROM tasks ORDER BY id DESC", taskRowMapper);
    }

    public Task findById(Long id) {
        return jdbcTemplate.queryForObject(
            "SELECT * FROM tasks WHERE id = ?",
            new Object[]{id},
            taskRowMapper
        );
    }

    public void save(Task task) {
        if (task.getId() == null) {
            jdbcTemplate.update(
                "INSERT INTO tasks (title, description, status, due_date) VALUES (?, ?, ?, ?)",
                task.getTitle(), task.getDescription(), task.getStatus(), task.getDueDate()
            );
        } else {
            jdbcTemplate.update(
                "UPDATE tasks SET title = ?, description = ?, status = ?, due_date = ? WHERE id = ?",
                task.getTitle(), task.getDescription(), task.getStatus(), task.getDueDate(), task.getId()
            );
        }
    }

    public void deleteById(Long id) {
        jdbcTemplate.update("DELETE FROM tasks WHERE id = ?", id);
    }
} 