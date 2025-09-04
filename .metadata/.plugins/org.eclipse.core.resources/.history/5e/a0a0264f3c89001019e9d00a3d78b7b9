package com.springproject.archive.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springproject.archive.dto.BlogDTO;
import com.springproject.archive.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @GetMapping("/list")
    public String showBlogPage() {
        return "bloglist";
    }

    @GetMapping("/form")
    public String writeBlogPage() {
        return "blogform";
    }

    @PostMapping("/insert")
    public String insertBlog(@RequestParam("title") String title,
                              @RequestParam("content") String content,
                              @RequestParam("image") MultipartFile file) throws IOException {

        BlogDTO blog = new BlogDTO();
        blog.setUserId(1); // 🔹 로그인 기능 없으니까 임시로 1번 유저
        blog.setTitle(title);
        blog.setContent(content);

        // 이미지 저장
        if (!file.isEmpty()) {
            String uploadDir = "C:/upload/"; // 서버 저장 경로
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            file.transferTo(new File(uploadDir + fileName));
            blog.setThumbnailUrl("/upload/" + fileName);
        }

        blogService.insertBlog(blog);

        return "redirect:/blog/list"; // 글 작성 후 목록으로
    }
}
