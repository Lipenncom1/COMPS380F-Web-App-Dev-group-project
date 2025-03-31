package hkmu.wadd.dao;


import jakarta.annotation.Resource;
import hkmu.wadd.Model.LectureUser;
import hkmu.wadd.Model.UserRole;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User;


import java.util.ArrayList;
import java.util.List;

@Service
public class LectureUserService implements UserDetailsService {
    @Resource
    LectureUserRepository lectureUserRepository;
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        LectureUser lectureUser = lectureUserRepository.findById(username).orElse(null);
        if (lectureUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : lectureUser.getRoles()) {
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new User(lectureUser.getUsername(), lectureUser.getPassword(), authorities);
    }
}