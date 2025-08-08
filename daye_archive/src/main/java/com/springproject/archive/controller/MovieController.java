package com.springproject.archive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {

    @GetMapping("/movielist")
    public String showMoviePage() {
        return "movielist";
    }
}