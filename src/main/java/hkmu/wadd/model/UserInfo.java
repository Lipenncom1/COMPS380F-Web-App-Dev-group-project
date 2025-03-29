package hkmu.wadd.model;

import jakarta.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "USERINFO")
public class UserInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "sid", unique = true, nullable = false)
    private String sid = "a0000000";

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(name = "full_name", nullable = false)
    private String fullName = "FACKY CHAIN";

    @Column(name = "phone_num")
    private String phoneNum;

    private String email;

    @Column(nullable = false)
    private String role = "STUDENT";

    // ---------- JPA 必需的无参构造函数 ----------
    protected UserInfo() {}

    // ---------- 全参构造函数（可选） ----------
    public UserInfo(Long id, String sid, String username, String password, String fullName, String phoneNum, String email, String role) {
        this.id = id;
        this.sid = sid;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.phoneNum = phoneNum;
        this.email = email;
        this.role = role;
    }

    //UserInfo() 和 hashCode

    // ---------- Getter/Setter 方法 ----------
    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getSid() { return sid; }

    public void setSid(String sid) { this.sid = sid; }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }

    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPhoneNum() { return phoneNum; }

    public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }

    public void setRole(String role) { this.role = role; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserInfo userInfo = (UserInfo) o;
        return false;
    }
}
