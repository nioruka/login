<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.User" %>
<jsp:useBean id="user" class="model.User" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>index</title>
</head>
<body>
    <%
        HttpSession session1 = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        User user1 = (User) session.getAttribute("user");
    %>
    <h2><%= user.getId() %>님 환영합니다!</h2>

    <!-- (role이 admin인 경우에만-->
    <% if ("admin".equals(user.getRole())) { %>
        <form action="user" method="post">
            <input type="hidden" name="action" value="admin">
            <button type="submit">관리자 페이지로 이동</button>
        </form>
    <% } %>

    <!-- 로그아웃 버튼 -->
    <form action="user" method="post">
        <input type="hidden" name="action" value="logout">
        <button type="submit">로그아웃</button>
    </form>
</body>
</html>
