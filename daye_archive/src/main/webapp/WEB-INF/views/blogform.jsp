<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog</title>
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

input[type="text"], textarea, input[type="file"] {
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
</style>
</head>
<body>

    <header>
        <jsp:include page="navi.jsp" />
    </header>

    <div class="container">
        <jsp:include page="mainprofile.jsp" />
        <div class="content">

            <div class="form-card">
                <h2>📝 블로그 글 작성</h2>

                <!-- ✅ action을 blog/insert 로 수정 -->
                <form action="<c:url value='/blog/insert' />"
                      method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="image">썸네일 이미지</label>
                        <input type="file" id="image" name="image" accept="image/*">
                    </div>

                    <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="title" name="title" required>
                    </div>

                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea id="content" name="content" rows="8" required></textarea>
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
