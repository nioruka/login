<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>사용자 정보 페이지</title>
</head>
<body>
    <h2>사용자 정보</h2>
    <table border="1">
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이메일</th>
            <th>역할</th>
            <th>수정</th>
        </tr>
        <%
            List<User> userList = (List<User>) request.getAttribute("userList");
            if (userList != null && !userList.isEmpty()) {
                for (User user : userList) {
        %>
                    <form action="user" method="post">
                        <input type="hidden" name="action" value="editUser">
                        <tr>
                            <td><%= user.getId() %></td>
                            <input type="hidden" name="id" value="<%= user.getId() %>">
                            <td><input type="text" name="password" value="<%= user.getPassword() %>" required></td>
                            <td><input type="email" name="email" value="<%= user.getEmail() %>" required></td>
                            <td>
                                <select name="role">
                                    <option value="user" <%= "user".equals(user.getRole()) ? "selected" : "" %>>일반</option>
                                    <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>관리자</option>
                                </select>
                            </td>
                            <td>
                                <button type="submit">수정</button>
                            </td>
                        </tr>
                    </form>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5">사용자 정보가 없습니다.</td>
            </tr>
        <%
            }
        %>
    </table>
    <form action="user" method="post">
        <input type="hidden" name="action" value="logout">
        <button type="submit">로그아웃</button>
    </form>
</body>
</html>
