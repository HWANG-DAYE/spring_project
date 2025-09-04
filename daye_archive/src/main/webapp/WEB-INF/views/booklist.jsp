<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
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
}

.top-btn {
	position: fixed;
	bottom: 50px; /* 화면 아래에서 20px */
	right: 70px; /* 화면 오른쪽에서 20px */
	width: 50px;
	height: 50px;
	cursor: pointer;
	z-index: 999; /* 다른 요소보다 위 */
}

.top-btn img {
	width: 100%;
	height: 100%;
	opacity: 0.8; /* 살짝 투명 */
	transition: opacity 0.3s ease;
}

.top-btn img:hover {
	opacity: 1; /* 마우스 올렸을 때 진하게 */
}

.write-btn {
	float: right;
	margin-bottom: 20px;
	background-color: #ffddee;
	border: none;
	padding: 10px 20px;
	border-radius: 15px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.write-btn:hover {
	background-color: #ffccdd;
}
.cards {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
    padding: 20px;
}
.card {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: transform 0.2s;
}
.card:hover {
    transform: translateY(-5px);
}
.card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
}
.card-content {
    padding: 15px;
}
.card-content h3 {
    margin: 0;
    font-size: 18px;
}
.card-content p {
    font-size: 14px;
    color: #666;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
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
			<a href="${pageContext.request.contextPath}/book/form">
				<button class="write-btn">✏️ 글쓰기</button>
			</a>
			
			<div class="cards">
    <c:forEach var="review" items="${reviews}">
        <div class="card">
            <img src="${review.bookThumbnail}" onerror="this.src='/images/noimage.png'"/>
            <div class="card-content">
                <h3>${review.title}</h3>
                <p>${review.bookTitle} - ${review.bookAuthors}</p>
                <p>${review.content}</p>
            </div>
        </div>
    </c:forEach>
</div>
			
			
	<!-- Top 버튼 -->
	<a href="#" class="top-btn">
		<img src="<c:url value='/resources/images/topbutton.png' />" alt="Top">
	</a>
			<script>
				// 부드럽게 스크롤해서 맨 위로 이동
				document.querySelector('.top-btn').addEventListener('click',
						function(e) {
							e.preventDefault();
							window.scrollTo({
								top : 0,
								behavior : 'smooth'
							});
						});
			</script>

		</div>

	</div>



	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>