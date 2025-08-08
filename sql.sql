-- 사용자
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 프로필
CREATE TABLE profile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    school VARCHAR(100),
    career TEXT,
    certificates TEXT,
    education TEXT,
    skills TEXT,
    github VARCHAR(255),
    portfolio_link VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 블로그 (썸네일 추가됨)
CREATE TABLE blog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200),
    content TEXT,
    thumbnail_url VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 블로그 이미지 테이블
CREATE TABLE blog_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    blog_id INT NOT NULL,
    image_url VARCHAR(255),
    uploaded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (blog_id) REFERENCES blog(id)
);

-- 책 리뷰
CREATE TABLE book_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200),
    author VARCHAR(100),
    isbn VARCHAR(30),
    thumbnail_url VARCHAR(255),
    rating INT,
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 영화 리뷰
CREATE TABLE movie_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200),
    tmdb_id VARCHAR(30),
    poster_url VARCHAR(255),
    rating INT,
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO users (id, username, password, email) 
VALUES (1, 'testuser', 'password', 'test@example.com');