package com.springproject.archive.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.archive.dto.BlogDTO;
import com.springproject.archive.mapper.BlogMapper;

@Service
public class BlogService {

    @Autowired
    private BlogMapper blogMapper;

    public void insertBlog(BlogDTO blog) {
        blogMapper.insertBlog(blog);
    }
}
