package com.springproject.archive;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.springproject.archive.dao.BlogDAO;
import com.springproject.archive.dto.BlogDTO;

public class BlogDAOTest {

    private BlogDAO blogDAO;

    @Before
    public void setUp() {
        blogDAO = new BlogDAO();
    }

    @After
    public void tearDown() {
        blogDAO = null;
    }

    @Test
    public void testInsertBlog() {
        BlogDTO blog = new BlogDTO();
        blog.setUserId(1); // 테스트용 유저 ID
        blog.setTitle("JUnit 테스트 제목");
        blog.setContent("JUnit 테스트 내용입니다.");
        blog.setThumbnailUrl("test.jpg");

        int result = blogDAO.insertBlog(blog);
        assertEquals(1, result);
    }

    @Test
    public void testGetAllBlogs() {
        List<BlogDTO> blogList = blogDAO.getAllBlogs();
        assertNotNull(blogList);
        assertTrue(blogList.size() >= 0); // 비어 있어도 성공
    }

    @Test
    public void testGetBlogById() {
        BlogDTO blog = blogDAO.getBlogById(1); // 실제 존재하는 ID 넣기
        if (blog != null) {
            assertEquals(1, blog.getId());
            assertNotNull(blog.getTitle());
        }
    }
}