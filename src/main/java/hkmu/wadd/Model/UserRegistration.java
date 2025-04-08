package hkmu.wadd.Model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;

public class UserRegistration {

    @NotEmpty(message = "Username is required")
    private String username;

    @NotEmpty(message = "Password is required")
    private String password;

    private String fullName;

    @Email(message = "Email should be valid")
    @NotEmpty(message = "Email is required")
    private String email;

    @NotEmpty(message = "Phone is required")
    private String phone;

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}