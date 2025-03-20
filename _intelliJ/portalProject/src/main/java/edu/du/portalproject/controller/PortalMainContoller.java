package edu.du.portalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PortalMainContoller {

    @GetMapping("/")
    public String index() {
        return "portalMain/home";
    }
    @GetMapping("/login")
    public String login() {
        return "portalMain/login";
    }
    @GetMapping
    public String Register() {
        return "portalMain/register";
    }

}
