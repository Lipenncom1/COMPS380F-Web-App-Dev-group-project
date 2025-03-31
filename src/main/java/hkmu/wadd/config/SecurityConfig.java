package hkmu.wadd.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/login", "/register", "/register/**","/h2-console/**", "/css/**", "/js/**").permitAll()
                        .anyRequest().permitAll()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .defaultSuccessUrl("/index", true)
                        .failureUrl("/login?error")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout")
                        .permitAll()
                )
                .csrf(csrf -> csrf.disable())
                .headers(headers -> headers.frameOptions().disable());

        return http.build();
    }

    @Bean
    public UserDetailsService jdbcUserDetailsService(DataSource dataSource) {
        String usersByUsernameQuery =
                "SELECT username, password, true as enabled " +
                        "FROM USERINFO " +
                        "WHERE username = ?";

        String authsByUserQuery =
                "SELECT username, CONCAT('ROLE_', role) as authority " +
                        "FROM USERINFO " +
                        "WHERE username = ?";

        JdbcUserDetailsManager users = new JdbcUserDetailsManager(dataSource);
        users.setUsersByUsernameQuery(usersByUsernameQuery);
        users.setAuthoritiesByUsernameQuery(authsByUserQuery);

        // 添加调试日志
        System.out.println("User Query: " + usersByUsernameQuery);
        System.out.println("Auth Query: " + authsByUserQuery);

        return users;
    }

//    @Bean
//    public UserDetailsService jdbcUserDetailsService(DataSource dataSource) {
//        // from sql to init
//        String usersByUsernameQuery =
//                "SELECT username, password, 'true' as enabled " +
//                        "FROM USERINFO " +
//                        "WHERE username=? AND role IS NOT NULL";
//
//        String authsByUserQuery =
//                "SELECT username, 'ROLE_' || role as authority " +
//                        "FROM USERINFO " +
//                        "WHERE username = ?";
////                "SELECT username, CONCAT('ROLE_', role) as authority " +
////                        "FROM USERINFO " +
////                        "WHERE username=?";
//
//        JdbcUserDetailsManager users = new JdbcUserDetailsManager(dataSource);
//        users.setUsersByUsernameQuery(usersByUsernameQuery);
//        users.setAuthoritiesByUsernameQuery(authsByUserQuery);
//        return users;
//    }
//
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeHttpRequests(auth -> auth
//                                // 开放路径在前
//                                .requestMatchers("/login", "/register", "/h2-console/**").permitAll()
//                                // 具体权限规则
////                        .requestMatchers("/admin/**").hasRole("ADMIN")
////                        .requestMatchers("/teacher/**").hasRole("TEACHER")
//                                // 通用规则在最后
//                                .anyRequest().permitAll()
//                )
//                .formLogin(form -> form
//                        .loginPage("/login")
//                        .defaultSuccessUrl("/index", true)
//                        .loginProcessingUrl("/login")
//                        .usernameParameter("username")
//                        .passwordParameter("password")
//                        .failureUrl("/login?error")
//                        .permitAll()
//                )
//                .logout(logout -> logout
//                        .logoutUrl("/logout")
//                        .logoutSuccessUrl("/login?logout")
//                )
//                .csrf(csrf -> csrf.disable())  // 禁用 CSRF
//                .headers(headers -> headers.frameOptions().disable()); // 允许 H2 控制台
//        return http.build();
//    }
}