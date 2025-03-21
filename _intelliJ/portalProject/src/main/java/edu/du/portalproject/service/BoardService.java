package edu.du.portalproject.service;

import edu.du.portalproject.dto.BoardDTO;
import edu.du.portalproject.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository; // Repository 주입

    // 게시글 저장
    public void savePost(BoardDTO boardDTO) {
        boardRepository.save(boardDTO);
    }

    // 게시글 목록 조회
    public List<BoardDTO> getAllPosts() {
        return boardRepository.findAll();
    }

    // 특정 게시글 조회 (ID 기준)
    public BoardDTO getPostById(Long id) {
        return boardRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 게시글이 존재하지 않습니다."));
    }

    // 게시글 수정
    public void updatePost(Long id, BoardDTO boardDTO) {
        BoardDTO existingPost = getPostById(id);
        existingPost.setTitle(boardDTO.getTitle());
        existingPost.setContents(boardDTO.getContents());
        existingPost.setUpdatedAt(boardDTO.getUpdatedAt());
        boardRepository.save(existingPost);
    }

    // 게시글 삭제
    public void deletePost(Long id) {
        boardRepository.deleteById(id);
    }
}
