package com.springproject.archive.dto;

import java.util.Date;

public class BookReview {
    private int id;
    private int userId;
    private String title;
    private String content;
    private String hashtags;

    private String bookTitle;
    private String bookAuthors;
    private String bookThumbnail;

    private Date createdAt;

    // ✅ 기본 생성자
    public BookReview() {}

    // ✅ getter / setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getHashtags() { return hashtags; }
    public void setHashtags(String hashtags) { this.hashtags = hashtags; }

    public String getBookTitle() { return bookTitle; }
    public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }

    public String getBookAuthors() { return bookAuthors; }
    public void setBookAuthors(String bookAuthors) { this.bookAuthors = bookAuthors; }

    public String getBookThumbnail() { return bookThumbnail; }
    public void setBookThumbnail(String bookThumbnail) { this.bookThumbnail = bookThumbnail; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}