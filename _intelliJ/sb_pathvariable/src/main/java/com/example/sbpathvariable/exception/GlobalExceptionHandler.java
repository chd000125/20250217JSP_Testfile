package com.example.sbpathvariable.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MemberNotFoundException.class)
    public ModelAndView handleMemberNotFoundException(MemberNotFoundException e) {
        log.error("회원을 찾을 수 없습니다.", e);
        ModelAndView mav = new ModelAndView("error/404");
        mav.addObject("errorMessage", e.getMessage());
        return mav;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception e) {
        log.error("예상치 못한 오류가 발생했습니다.", e);
        ModelAndView mav = new ModelAndView("error/500");
        mav.addObject("errorMessage", "서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
        return mav;
    }
} 