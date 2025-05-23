package hkmu.wadd.dao;

import java.util.List;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hkmu.wadd.Model.IndexUser;
import jakarta.annotation.Resource;

@Service
public class UserManagementService {
    @Resource
    private IndexUserRepository indexUserRepository;
    @Transactional
    public List<IndexUser> getAllIndexUser() {
        return indexUserRepository.findAll();
    }
    @Transactional
    public void delete(String username) {
        IndexUser indexUser = indexUserRepository.findById(username).orElse(null);
        if (indexUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        indexUserRepository.delete(indexUser);
    }
    @Transactional
    public void createIndexUser(String username, String password, String[] roles) {
        IndexUser user = new IndexUser(username, password, roles);
        indexUserRepository.save(user);
    }

    @Transactional
    public void registerIndexUser(String username, String password, String fullName, String email, String phone, String[] roles) {
        IndexUser user = new IndexUser(username, password, fullName, email, phone, roles);
        indexUserRepository.save(user);
    }

    @Transactional
    public void editUser(String username, String password, String fullName, String email, String phone, String[] roles) {
        IndexUser user = indexUserRepository.findById(username).orElse(null);

        if (password != null && !password.isBlank()) {
            user.setPassword(password);
        }
        if (fullName != null) user.setFullName(fullName);
        if (email != null) user.setEmail(email);
        if (phone != null) user.setPhone(phone);

        indexUserRepository.save(user);
    }

    @Transactional
    public IndexUser findUserByUsername(String username) {
        return indexUserRepository.findById(username).orElse(null);
    }

}
