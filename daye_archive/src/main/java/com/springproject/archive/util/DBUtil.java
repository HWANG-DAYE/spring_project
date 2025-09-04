package com.springproject.archive.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/archive_db?serverTimezone=UTC";
    private static final String USER = "root";  // 👉 본인 DB 사용자명
    private static final String PASSWORD = "0000"; // 👉 본인 DB 비밀번호

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("DB 연결 실패: " + e.getMessage());
        }
    }
}