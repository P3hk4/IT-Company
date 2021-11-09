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
                    .antMatchers("/myPage").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/saveMyEditAccount").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/login").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/changePassword").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/checkPassword").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/saveNewPassword").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/deleteAccount").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/allAccounts").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/allClients").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/allEmployees").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/editAccount").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/saveEditAccount").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsInProgress").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsWithoutDevelopers").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsCompleted").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projectsUnpaid").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/deleteProject").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/createProject").hasAnyRole("ADMIN","CLIENT")
                    .antMatchers("/saveNewProject").hasAnyRole("ADMIN","CLIENT")
                    .antMatchers("/myProjects").hasAnyRole("ADMIN","CLIENT")
                    .antMatchers("/payProject").hasAnyRole("ADMIN","CLIENT")
                    .antMatchers("/setFrontendDeveloper").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/setBackendDeveloper").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/saveDeveloperToProject").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/myWorkProjects").hasAnyRole("DEVELOPER")
                    .antMatchers("/saveMyProjectWork").hasAnyRole("DEVELOPER")
                    .antMatchers("/submitProject").hasAnyRole("ADMIN","MANAGER")
                    .and().logout().logoutUrl("/logout").logoutSuccessUrl("/").and().formLogin().permitAll();
        http.csrf().disable();
        http.headers().frameOptions().disable();
    }
}
