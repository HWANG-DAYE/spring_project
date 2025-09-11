package com.springproject.archive.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springproject.archive.dto.Blog;

@Mapper
public interface BlogMapper {
    void insertBlog(Blog blog);

	List<Blog> selectBlogList();
}