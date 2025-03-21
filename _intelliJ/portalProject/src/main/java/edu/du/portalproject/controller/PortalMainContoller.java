package edu.du.portalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PortalMainContoller {

    @GetMapping("/")
    public String index() {
        return "portalMain/home";
    }
}
