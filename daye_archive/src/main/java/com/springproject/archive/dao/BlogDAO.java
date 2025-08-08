package com.springproject.archive.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.springproject.archive.dto.BlogDTO;

public class BlogDAO {

    private String jdbcUrl = "jdbc:mysql://localhost:3306/archive_db?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=UTF-8";
    private String jdbcUser = "root";
    private String jdbcPass = "0000";

    // 커넥션 얻기
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
    }

    // 전체 블로그 리스트 조회
    public List<BlogDTO> getAllBlogs() {
        List<BlogDTO> blogList = new ArrayList<>();
        String sql = "SELECT * FROM blog ORDER BY created_at DESC";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                BlogDTO blog = new BlogDTO();
                blog.setId(rs.getInt("id"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setThumbnailUrl(rs.getString("thumbnail_url"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));
                blogList.add(blog);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return blogList;
    }

    // 단일 블로그 조회
    public BlogDTO getBlogById(int id) {
        BlogDTO blog = null;
        String sql = "SELECT * FROM blog WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    blog = new BlogDTO();
                    blog.setId(rs.getInt("id"));
                    blog.setUserId(rs.getInt("user_id"));
                    blog.setTitle(rs.getString("title"));
                    blog.setContent(rs.getString("content"));
                    blog.setThumbnailUrl(rs.getString("thumbnail_url"));
                    blog.setCreatedAt(rs.getTimestamp("created_at"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return blog;
    }

    // 블로그 글 추가
    public int insertBlog(BlogDTO blog) {
        String sql = "INSERT INTO blog(user_id, title, content, thumbnail_url) VALUES (?, ?, ?, ?)";
        int result = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, blog.getUserId());
            pstmt.setString(2, blog.getTitle());
            pstmt.setString(3, blog.getContent());
            pstmt.setString(4, blog.getThumbnailUrl());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}