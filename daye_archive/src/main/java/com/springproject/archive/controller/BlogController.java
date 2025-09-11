package com.springproject.archive.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springproject.archive.dto.Blog;
import com.springproject.archive.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Autowired
    private BlogService blogService;

    // 블로그 목록 조회
    @GetMapping("/list")
    public String showBlogPage(Model model) {
        List<Blog> blogList = blogService.selectBlogList(); // DB에서 가져오기
        model.addAttribute("blogList", blogList);           // JSP에 전달
        return "bloglist"; // bloglist.jsp로 이동
    }

    @GetMapping("/form")
    public String writeBlogPage() {
        return "blogform";
    }

    @PostMapping("/insert")
    public String insertBlog( Blog blog ) throws IOException {
        blog.setUserId(1); // 🔹 로그인 기능 없으니까 임시로 1번 유저
        System.out.println(blog);

        // 이미지 저장
//        if (!file.isEmpty()) {
//            String uploadDir = "C:/upload/"; // 서버 저장 경로
//            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
//            file.transferTo(new File(uploadDir + fileName));
//            blog.setThumbnailUrl("/upload/" + fileName);
//        }

        blogService.insertBlog(blog);

        return "redirect:/blog/list"; // 글 작성 후 목록으로
    }
}
