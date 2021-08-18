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
                    .antMatchers("/changePassword").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/confirmPassword").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/saveNewPassword").hasAnyRole("ADMIN","DEVELOPER","CLIENT","MANAGER")
                    .antMatchers("/myAccPage").hasAnyRole("ADMIN","CLIENT","MANAGER","DEVELOPER")
                    .antMatchers("/updateMyAcc").hasAnyRole("ADMIN","CLIENT","MANAGER","DEVELOPER")
                    .antMatchers("/saveUpdateMyAcc").hasAnyRole("ADMIN","CLIENT","MANAGER","DEVELOPER")
                    .antMatchers("/login").hasAnyRole("ADMIN","DEVELOPER","CLIENT")
                    .antMatchers("/addDeveloper").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/saveAddDeveloper").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/deleteProject").hasAnyRole("ADMIN","CLIENT","MANAGER")
                    .antMatchers("/catalog").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/projects*").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/all*").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/releaseProject").hasAnyRole("ADMIN","MANAGER")
                    .antMatchers("/registration").hasRole("ANONYMOUS")
                    .antMatchers("/saveRegistration").hasAnyRole("ANONYMOUS")
                    .antMatchers("/onOffAcc").hasRole("ADMIN")
                    .antMatchers("/back").hasRole("ADMIN")
                    .antMatchers("/deleteAcc").hasAnyRole("ADMIN")
                    .antMatchers("/confirmDelete").hasRole("ADMIN")
                    .antMatchers("/adminUpdateAcc").hasRole("ADMIN")
                    .antMatchers("/saveAdminUpdate").hasRole("ADMIN")
                    .antMatchers("/myCurrentProjects").hasRole("CLIENT")
                    .antMatchers("/myCompletedProjects").hasRole("CLIENT")
                    .antMatchers("/addOrder").hasRole("CLIENT")
                    .antMatchers("/saveNewOrder").hasRole("CLIENT")
                    .antMatchers("/payProjects").hasRole("CLIENT")
                    .antMatchers("/saveProjectPay").hasRole("CLIENT")
                    .antMatchers("/myWorkProjects").hasRole("DEVELOPER")
                    .antMatchers("/completeMyWork").hasRole("DEVELOPER")
                    .and().logout().logoutUrl("/logout").logoutSuccessUrl("/").and().formLogin().permitAll();
    }
}
