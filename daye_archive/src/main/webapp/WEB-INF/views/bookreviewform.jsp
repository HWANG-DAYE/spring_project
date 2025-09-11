<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Review</title>
<style>
body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f7f7f7;
}

.container {
    display: flex;
    padding: 20px;
}

.content {
    flex: 1;
    min-height: 400px;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.form-card {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.05);
    padding: 30px 40px;
    max-width: 1000px;
    width: 100%;
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #333;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 6px;
    color: #444;
}

input[type="text"], textarea, select {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
    box-sizing: border-box;
}

textarea {
    resize: vertical;
}

.form-group {
    margin-bottom: 20px;
}

.btn-group {
    text-align: center;
    margin-top: 20px;
}

.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.2s ease;
}

.btn-submit {
    background-color: #f5f5f5;
    color: black;
    margin-right: 10px;
}

.btn-submit:hover {
    background-color: #ccc;
}

.btn-cancel {
    background-color: #f5f5f5;
    color: #333;
}

.btn-cancel:hover {
    background-color: #ccc;
}
.search-results {
    margin-top: 15px;
}
.search-item {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.2s;
}
.search-item:hover {
    background: #f9f9f9;
}
.search-item img {
    width: 50px;
    height: auto;
    margin-right: 10px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function searchBook() {
    let keyword = document.getElementById("searchKeyword").value;
    fetch("/archive/book/search?keyword=" + encodeURIComponent(keyword))
        .then(res => res.json())
        .then(data => {
            let resultsDiv = document.getElementById("searchResults");
            resultsDiv.innerHTML = "";

            data.forEach(book => {
                let div = document.createElement("div");
                div.classList.add("book-item");

                // 🔹 백틱 대신 문자열 결합
                let imgTag = '<img src="' + book.thumbnail + '" width="50">';
                let titleSpan = '<span>' + book.title + ' (' + book.authors + ')</span>';
                div.innerHTML = imgTag + titleSpan;

                div.onclick = function() {
                    let selectedDiv = document.getElementById("selectedBook");
                    selectedDiv.innerHTML = '<img src="' + book.thumbnail + '" width="80"><br>' +
                                            book.title + ' - ' + book.authors;

                    document.getElementById("bookTitle").value = book.title;
                    document.getElementById("bookAuthors").value = book.authors;
                    document.getElementById("bookThumbnail").value = book.thumbnail;
                };

                resultsDiv.appendChild(div);
            });
        })
        .catch(err => console.error(err));
}
</script>


</head>
<body>

<header>
    <jsp:include page="navi.jsp" />
</header>

<div class="container">
    <jsp:include page="mainprofile.jsp" />
    <div class="content">

        <div class="form-card">
            <h2>📚 책 리뷰 작성</h2>

            <form action="<c:url value='/book/insert' />" method="post">

                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" required>
                </div>

                                <!-- 책 검색 영역 -->
                <div class="form-group">
                    <label for="book">책 검색</label>
                    <input type="text" id="searchKeyword" placeholder="책 제목 검색">
                    <button type="button" onclick="searchBook()">검색</button>
                    <div id="searchResults" class="search-results"></div>
                </div>

                <!-- 선택된 책 정보 표시 -->
                <div class="form-group">
                    <label>선택된 책</label>
                    <div id="selectedBook">선택된 책이 없습니다.</div>
                </div>

                <!-- hidden input (DB 저장용) -->
                <input type="hidden" id="bookTitle" name="bookTitle">
                <input type="hidden" id="bookAuthors" name="bookAuthors">
                <input type="hidden" id="bookThumbnail" name="bookThumbnail">

                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="content" rows="8" required></textarea>
                </div>

                <div class="form-group">
                    <label for="hashtags">해시태그</label>
                    <input type="text" id="hashtags" name="hashtags" placeholder="#독서 #감상">
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-submit">작성하기</button>
                    <button type="button" class="btn btn-cancel" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>

    </div>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
