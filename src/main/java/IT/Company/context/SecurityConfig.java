package IT.Company.context;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
            http.authorizeRequests().antMatchers("/").hasAnyRole("ADMIN","ANONYMOUS","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/login").hasAnyRole("ADMIN","DEVELOPER","CLIENT")
                    .antMatchers("/catalog").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsInProgress").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsWithoutDevelopers").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsUnpaid").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsCompleted").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/allEmployees").hasAnyRole("ADMIN","MANAGER")
                    .and().logout().logoutUrl("/logout").logoutSuccessUrl("/").and().formLogin().permitAll();
    }
}
