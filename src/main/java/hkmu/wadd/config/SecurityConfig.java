package hkmu.wadd.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http)
            throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/index/delete/**", "/user/**", "/index/editLecture/**", "/index/addLecture/**",
                                "/index/addPoll/**", "/index/editPoll/**", "/index/deletePoll/**", "/index/voteHistories").hasRole("ADMIN")
                        .requestMatchers("/view/**", "/index/view/**", "/index/viewPoll/**").permitAll()
                        .requestMatchers("/index/vote/**").hasAnyRole("USER", "ADMIN")
                        .requestMatchers("/h2-console/**", "/css/**", "/js/**", "/index", "/index/index").permitAll()
                        .anyRequest().permitAll()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                )
                .rememberMe(remember -> remember
                        .key("uniqueAndSecret")
                        .tokenValiditySeconds(86400)
                )
                .csrf(csrf -> csrf.disable())
                .headers(headers -> headers.frameOptions().disable())
                .httpBasic(withDefaults());
        return http.build();
    }
}