package hkmu.wadd.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.audit.InMemoryAuditEventRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

import static org.springframework.security.config.Customizer.withDefaults;

//
//@Configuration //-- automatically calls even though you did not explicitly call it.
//@EnableWebSecurity
//public class SecurityConfig {
//
//    @Bean
//    public UserDetailsService jdbcUserDetailsService(DataSource dataSource) {
//        String usersByUsernameQuery
//                = "SELECT username, password, true FROM users WHERE username=?";
//        String authsByUserQuery
//                = "SELECT username, role FROM user_roles WHERE username=?";
//        JdbcUserDetailsManager users = new JdbcUserDetailsManager(dataSource);
//        users.setUsersByUsernameQuery(usersByUsernameQuery);
//        users.setAuthoritiesByUsernameQuery(authsByUserQuery);
//        return users;
//    }

//    @Bean
//    public UserDetailsService userDetailsService() {
//        UserDetails user1 = User.withUsername("keith")
//                .password("{noop}keithpw").roles("ADMIN", "USER").build();
//        UserDetails user2 = User.withUsername("john")
//                .password("{noop}johnpw").roles("USER").build();
//        InMemoryUserDetailsManager userDetailsManager
//                = new InMemoryUserDetailsManager();
//        userDetailsManager.createUser(user1);
//        userDetailsManager.createUser(user2);
//        return userDetailsManager;
//    }


//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeHttpRequests(authorize -> authorize
//                        .anyRequest().authenticated()
//                )
//                .formLogin(withDefaults())
//                .httpBasic(withDefaults());
//        return http.build();
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder(); // 使用 BCrypt 加密算法
//    }

//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeHttpRequests(auth -> auth
//                        .requestMatchers("/register", "/login", "/h2-console/**").permitAll()
//                        .anyRequest().authenticated()
//                )
//                .formLogin(form -> form
//                        .loginPage("/login")
//                        .defaultSuccessUrl("/", true)
//                        .failureUrl("/login?error=true")
//                )
//                .logout(logout -> logout
//                        .logoutSuccessUrl("/login")
//                );
////                .csrf().disable()  // 禁用 CSRF 以支持 H2 控制台
////                .headers().frameOptions().disable(); // 允许 H2 控制台的 iframe
//
//        return http.build();
//    }
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeHttpRequests()
//                .requestMatchers("/login").permitAll() // Allow access to the login page
//                .anyRequest().authenticated()         // Secure all other endpoints
//                .and()
//                .formLogin()
//                .loginPage("/login")                  // Specify the login page URL
//                .permitAll()
//                .and()
//                .logout()
//                .logoutSuccessUrl("/login")           // Redirect to login page after logout
//                .permitAll();
//        return http.build();
//    }

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public UserDetailsService jdbcUserDetailsService(DataSource dataSource) {
        // 从 USERINFO 表直接获取用户信息和角色（注意：Spring Security 要求角色格式为 ROLE_XXX）
        String usersByUsernameQuery =
                "SELECT username, password, 'true' as enabled " +  // 假设所有用户默认启用
                        "FROM USERINFO " +
                        "WHERE username=?";

        String authsByUserQuery =
                "SELECT username, CONCAT('ROLE_', role) as authority " +  // 添加 ROLE_ 前缀
                        "FROM USERINFO " +
                        "WHERE username=?";

        JdbcUserDetailsManager users = new JdbcUserDetailsManager(dataSource);
        users.setUsersByUsernameQuery(usersByUsernameQuery);
        users.setAuthoritiesByUsernameQuery(authsByUserQuery);
        return users;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        // 开放路径在前
                        .requestMatchers("/login","/WEB-INF/jsp/login.jsp", "/register", "/h2-console/**", "/css/**", "/js/**").permitAll()
                        // 具体权限规则
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/teacher/**").hasRole("TEACHER")
                        // 通用规则在最后
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .defaultSuccessUrl("/", true)
                )
                .csrf(csrf -> csrf.disable())  // 禁用 CSRF
                .headers(headers -> headers.frameOptions().disable()); // 允许 H2 控制台
        return http.build();
    }
}