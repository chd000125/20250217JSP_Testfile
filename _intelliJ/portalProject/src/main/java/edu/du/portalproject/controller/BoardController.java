package edu.du.portalproject.controller;

import edu.du.portalproject.dto.BoardDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping
    public String showBoard(Model model) {
        return "board"; // 게시판 목록 페이지
    }

    @GetMapping("/write")
    public String writePostForm(HttpSession session, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("user") == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
            return "redirect:/login";
        }
        return "boardWrite"; // 글쓰기 페이지
    }

    @PostMapping("/write")
    public String savePost(@RequestParam String title, @RequestParam String content, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:portalAccount/login";
        }
        // 글 저장 로직
        return "redirect:portalBoard/board";
    }

    @GetMapping("/board/write")
    public String writeBoard(HttpSession session, Model model) {
        // 세션에서 userName 가져오기 (없다면 기본값 설정)
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            userName = "Guest"; // 기본값
        }
        model.addAttribute("userName", userName);
        return "write"; // write.html로 이동
    }

    @GetMapping("/edit/{id}")
    public String editPost(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        model.addAttribute("post", new Post(id, "수정할 글", "작성자", LocalDateTime.now()));
        return "boardEdit";
    }

    @PostMapping("/edit/{id}")
    public String updatePost(@PathVariable Long id, @RequestParam String title, @RequestParam String content) {
        // 글 수정 로직
        return "redirect:/board";
    }

    @PostMapping("/delete/{id}")
    public String deletePost(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        // 글 삭제 로직
        return "redirect:/board";
    }

}
