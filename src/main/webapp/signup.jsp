
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="model.User" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입 페이지</h2>
    <form action="user" method="post">
        <input type="hidden" name="action" value="register">
        <div>
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="role">역할:</label>
            <select id="role" name="role">
                <option value="user" selected>일반</option>
                <option value="admin">관리자</option>
            </select>
        </div>
        <button type="submit">회원가입</button>
    </form>
    <p style="color: red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
</body>
</html>
