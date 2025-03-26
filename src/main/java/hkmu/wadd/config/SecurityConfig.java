//package hkmu.wadd.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration //-- automatically calls even though you did not explicitly call it.
//public class SecurityConfig {
//
//    @Bean
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
//}
