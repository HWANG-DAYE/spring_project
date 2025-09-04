package com.springproject.archive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movie")
public class MovieController {

    @GetMapping("/list")
    public String showMoviePage() {
        return "movielist";
    }
    
    @GetMapping("/form")
    public String writeBlogPage() {
        return "moviereviewform";
    }
}