package model;

public class User {
    private String id;
    private String password;
    private String email;
    private String role;

    // 기본 생성자 및 Getter/Setter 메소드
    public User() {}

    public User(String id, String password, String email, String role) {
        this.id = id;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
