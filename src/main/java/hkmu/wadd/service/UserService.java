package hkmu.wadd.service;
import hkmu.wadd.model.UserInfo;

public interface UserService {
    UserInfo registerUser(UserInfo user);
    UserInfo updateUser(UserInfo user);
    void deleteUser(Long userId);
    UserInfo findUserByUsername(String username);
}
