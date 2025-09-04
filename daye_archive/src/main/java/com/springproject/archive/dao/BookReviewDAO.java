package com.springproject.archive.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.springproject.archive.dto.BookReview;
import com.springproject.archive.util.DBUtil;

import java.sql.*;
import java.util.*;

public class BookReviewDAO {
	// 리뷰 저장
    public void insert(BookReview review) {
        String sql = "INSERT INTO book_reviews(user_id, title, content, hashtags, book_title, book_authors, book_thumbnail) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, review.getUserId());
            pstmt.setString(2, review.getTitle());
            pstmt.setString(3, review.getContent());
            pstmt.setString(4, review.getHashtags());
            pstmt.setString(5, review.getBookTitle());
            pstmt.setString(6, review.getBookAuthors());
            pstmt.setString(7, review.getBookThumbnail());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 모든 리뷰 불러오기
    public List<BookReview> getAll() {
        List<BookReview> list = new ArrayList<>();
        String sql = "SELECT * FROM book_reviews ORDER BY created_at DESC";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                BookReview r = new BookReview();
                r.setId(rs.getInt("id"));
                r.setUserId(rs.getInt("user_id"));
                r.setTitle(rs.getString("title"));
                r.setContent(rs.getString("content"));
                r.setHashtags(rs.getString("hashtags"));
                r.setBookTitle(rs.getString("book_title"));
                r.setBookAuthors(rs.getString("book_authors"));
                r.setBookThumbnail(rs.getString("book_thumbnail"));
                r.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
