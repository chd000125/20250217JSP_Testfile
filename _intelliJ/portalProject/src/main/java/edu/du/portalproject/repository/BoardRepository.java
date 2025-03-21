package edu.du.portalproject.repository;

import edu.du.portalproject.dto.BoardDTO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardRepository extends JpaRepository<BoardDTO, Long> {
}
