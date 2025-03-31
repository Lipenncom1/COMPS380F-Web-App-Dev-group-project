package hkmu.wadd.dao;

import hkmu.wadd.Model.LectureUser;
import jakarta.annotation.Resource;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserManagementService {
    @Resource
    private LectureUserRepository lectureUserRepository;
    @Transactional
    public List<LectureUser> getAllLectureUser() {
        return lectureUserRepository.findAll();
    }
    @Transactional
    public void delete(String username) {
        LectureUser lectureUser = lectureUserRepository.findById(username).orElse(null);
        if (lectureUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        lectureUserRepository.delete(lectureUser);
    }
    @Transactional
    public void createLectureUser(String username, String password, String[] roles) {
        LectureUser user = new LectureUser(username, password, roles);
        lectureUserRepository.save(user);
    }
}