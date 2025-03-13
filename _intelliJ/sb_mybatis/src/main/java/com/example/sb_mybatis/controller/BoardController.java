package com.example.sb_mybatis.controller;

import com.example.sb_mybatis.model.Board;
import com.example.sb_mybatis.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("boards", boardService.getAllBoards());
        return "board/list";
    }

    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    @PostMapping("/write")
    public String write(@ModelAttribute Board board) {
        boardService.createBoard(board);
        return "redirect:/board";
    }

    @GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model) {
        model.addAttribute("board", boardService.getBoardById(id));
        return "board/detail";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("board", boardService.getBoardById(id));
        return "board/edit";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id, @ModelAttribute Board board) {
        board.setId(id);
        boardService.updateBoard(board);
        return "redirect:/board";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        boardService.deleteBoard(id);
        return "redirect:/board";
    }
} 