package com.example.sb_mybatis.mapper;

import com.example.sb_mybatis.model.Board;
import org.apache.ibatis.annotations.*;
import java.util.List;

@Mapper
public interface BoardMapper {
    @Select("SELECT * FROM board")
    List<Board> findAll();

    @Select("SELECT * FROM board WHERE id = #{id}")
    Board findById(Long id);

    @Insert("INSERT INTO board (title, content, author, created_at) VALUES (#{title}, #{content}, #{author}, NOW())")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Board board);

    @Update("UPDATE board SET title = #{title}, content = #{content}, updated_at = NOW() WHERE id = #{id}")
    void update(Board board);

    @Delete("DELETE FROM board WHERE id = #{id}")
    void delete(Long id);
} 