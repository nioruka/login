package controller;


import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/user")
public class UserController extends HttpServlet {
    private UserService userService = new UserService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = request.getParameter("role");

            User user = new User(id, password, email, role);

            if (userService.registerUser(user)) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "이미 로그인 중이거나 회원가입에 실패했습니다.");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            }
        } else if ("checkDuplicate".equals(action)) {
            String id = request.getParameter("id");
            boolean isDuplicate = userService.isDuplicateId(id);
            request.setAttribute("id", id);
            request.setAttribute("isDuplicate", isDuplicate);
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        } else if ("login".equals(action)) {
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            if (userService.isDuplicateId(id)) {
                User user = userService.login(id, password);
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("index.jsp");
                } else {
                    request.setAttribute("loginError", "비밀번호가 틀렸습니다.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("loginError", "존재하지 않는 아이디입니다.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("login.jsp");
        } else if ("admin".equals(action)) {
            List<User> userList = userService.getAllUsers();
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("/adminpage.jsp").forward(request, response);
        } else if ("editUser".equals(action)) {
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String role = request.getParameter("role");

            User user = new User(id, password, email, role);
            if (userService.updateUser(user)) {
                response.sendRedirect("user?action=admin");
            } else {
                request.setAttribute("error", "사용자 정보 수정에 실패했습니다.");
                response.sendRedirect("user?action=admin");
            }
        }
    }
}
