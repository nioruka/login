<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="model.User" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body>
    <h2>로그인 페이지</h2>
    <form action="user" method="post">
        <input type="hidden" name="action" value="login">
        <div>
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">로그인</button>
        
    </form>
    <p style="color: red;">
        <%= request.getAttribute("loginError") != null ? request.getAttribute("loginError") : "" %>
    </p>
    <form action="signup.jsp" method="get">
        <button type="submit">회원가입</button>
    </form>
</body>
</html>