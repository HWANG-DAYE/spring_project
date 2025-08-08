package com.springproject.archive.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookController {

    @GetMapping("/booklist")
    public String showBookPage() {
        return "booklist";
    }
}