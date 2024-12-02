package service;

import model.User;
import model.UserDAO;

import java.util.List;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public boolean registerUser(User user) {
        if (userDAO.isDuplicateId(user.getId())) {
            return false;
        }
        return userDAO.addUser(user);
    }

    public boolean isDuplicateId(String id) {
        return userDAO.isDuplicateId(id);
    }

    public User login(String id, String password) {
        User user = userDAO.getUser(id);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }
    
    public boolean updateUser(User user) {
        return userDAO.updateUser(user);
    }
}