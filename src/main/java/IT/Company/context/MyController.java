package IT.Company.context;

import IT.Company.entity.Account;
import IT.Company.entity.Project;
import IT.Company.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import IT.Company.Service.AccountService;
import IT.Company.Service.AuthoritiesService;
import IT.Company.Service.ProjectService;
import IT.Company.Service.UserService;

import java.util.List;


@Controller
public class MyController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private UserService userService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private AuthoritiesService authoritiesService;

    @RequestMapping("/")
    public String homepage(Model model){
        User user = new User();
        model.addAttribute("User",user);
        return "/homePage";
    }

    @RequestMapping(value = "/saveRegistration")
    @ResponseBody
    public void saveRegistration(@ModelAttribute User user){
        userService.saveNewUser(user);
    }

    @RequestMapping(value = "/myPage")
    public String myPage(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Account account = accountService.getAccount(user.getUsername());
        model.addAttribute("account",account);
        return "/myPage";
    }

    @RequestMapping(value = "/saveMyEditAccount")
    public String saveMyEditAccount(@ModelAttribute("Account")Account account){
        accountService.saveOrUpdateAcc(account);
        return "redirect:/myPage";
    }

    @RequestMapping(value = "/login")
    public String login(){
        return "/homePage";
    }

    @RequestMapping(value = "/changePassword")
    public String changePassword(@RequestParam("username")String username, Model model){
        User user = userService.getUser(username);
        return user.getPassword();
    }

    @RequestMapping(value = "/checkPassword")
    @ResponseBody
    public String checkPassword(@RequestParam("username")String username, @RequestParam("oldPassword") String oldPassword){
        User user = userService.getUser(username);
        String result;
        if (user.getPassword().equals("{noop}"+oldPassword)){
            result = "true";
        } else  result = "false";
        return result;
    }

    @RequestMapping(value = "/saveNewPassword")
    public void saveNewPassword(@RequestParam("password")String password, @RequestParam("username")String username){
        User user = userService.getUser(username);
        user.setPassword("{noop}"+password);
        userService.saveOrUpdateUser(user);
    }

    @RequestMapping(value = "/deleteAccount")
    public void deleteAccount(@RequestParam("username")String username){
        authoritiesService.deleteAuthority(authoritiesService.getAuthority(username));
        userService.deleteUser(userService.getUser(username));
    }

    @RequestMapping(value = "/allAccounts")
    public String allAccounts(Model model){
        model.addAttribute("accounts",accountService.getAllAccounts());
        model.addAttribute("type","Все зарегистрированные аккаунты");
        return "accounts";
    }

    @RequestMapping(value = "/allClients")
    public String allClients(Model model){
        model.addAttribute("accounts",accountService.getAllClients());
        model.addAttribute("type","Все клиенты компании");
        return "accounts";
    }

    @RequestMapping(value = "/allEmployees")
    public String allDevelopers(Model model){
        model.addAttribute("accounts",accountService.getAllEmployees());
        model.addAttribute("type","Все сотрудники компании");
        return "accounts";
    }

    @RequestMapping(value = "/editAccount")
    public String editAccount(@RequestParam("username")String username, Model model){
        Account account = accountService.getAccount(username);
        model.addAttribute("account", account);
        return "/editAccount";
    }

    @RequestMapping(value = "/saveEditAccount")
    public String saveEditAccount(@ModelAttribute("account")Account account){
        accountService.saveOrUpdateAcc(account);
        return "redirect:/";
    }

    @RequestMapping(value = "/projectsInProgress")
    public String projectsInProgress(Model model){
        model.addAttribute("projects",projectService.getAllProjectsInProgress());
        model.addAttribute("type","Все проекты в разработке");
        return "/projects";
    }

    @RequestMapping(value = "/projectsWithoutDevelopers")
    public String projectsWithoutDevelopers(Model model){
        model.addAttribute("projects", projectService.getAllProjectsWithoutDevelopers());
        model.addAttribute("type","Все проекты без разработчиков");
        return "/projects";
    }

    @RequestMapping(value = "/projectsCompleted")
    public String projectsCompleted(Model model){
        model.addAttribute("projects",projectService.getAllProjectsCompleted());
        model.addAttribute("type","Все завершенные проекты");
        return "/projects";
    }

    @RequestMapping(value = "/projectsUnpaid")
    public String projectsUnpaid(Model model){
        model.addAttribute("projects",projectService.getAllProjectsUnpaid());
        model.addAttribute("type","Проекты ожидающие оплаты");
        return "/projects";
    }

    @RequestMapping(value = "/deleteProject")
    public void deleteProject(@RequestParam("id")int id){
        projectService.deleteProject(id);
    }

    @RequestMapping(value = "/createProject")
    public String createProject(){
        return "/createProject";
    }

    @RequestMapping(value = "/saveNewProject")
    public String saveNewProject(@RequestParam("name")String name){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Project project = new Project(user.getUsername(), name);
        projectService.saveProject(project);
        return "redirect:/";
    }

    @RequestMapping(value = "/myProjects")
    public String myProjects(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<Project> projects = projectService.getMyProjects(user.getUsername());
        model.addAttribute("projects",projects);
        return "/myProjects";
    }

    @RequestMapping(value = "/payProject")
    public void payProject(@RequestParam("id")int id){
        projectService.payProject(id);
    }

    @RequestMapping(value = "/setFrontendDeveloper")
    public String setFrontDeveloper(@RequestParam("id")int id, Model model){
        model.addAttribute("project", projectService.getProject(id));
        model.addAttribute("accounts",accountService.getAllFrontDevelopers());
        return "/setDeveloper";
    }

    @RequestMapping(value = "/setBackendDeveloper")
    public String setBackendDeveloper(@RequestParam("id")int id, Model model){
        model.addAttribute("project", projectService.getProject(id));
        model.addAttribute("accounts",accountService.getAllBackDevelopers());
        return "/setDeveloper";
    }

    @RequestMapping(value = "/saveDeveloperToProject")
    public String saveDeveloperToProject(@RequestParam("accountUsername")String accountUsername, @RequestParam("projectId")int projectId){
        Account account = accountService.getAccount(accountUsername);
        Project project = projectService.getProject(projectId);
        if (account.getPost().equals("Front-end developer")) {
            project.setFrontendDeveloper(accountUsername);
        } else if (account.getPost().equals("Back-end developer")) {
            project.setBackendDeveloper(accountUsername);
        }
        System.out.println(project);
        projectService.saveProject(project);
        return "redirect:/projectsWithoutDevelopers";
    }

    @RequestMapping(value = "/myWorkProjects")
    public String myWorkProjects(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("projects",projectService.getMyWorkProject(user.getUsername()));
        return "/myWorkProjects";
    }

    @RequestMapping(value = "/saveMyProjectWork")
    public void saveMyProjectWork(@RequestParam("projectId")int id){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Project project = projectService.getProject(id);
        if (project.getFrontendDeveloper().equals(user.getUsername())){
            project.setFrontendStatus(true);
        } else if (project.getBackendDeveloper().equals(user.getUsername())){
            project.setBackendStatus(true);
        }
        projectService.saveProject(project);
    }

    @RequestMapping(value = "/submitProject")
    public void submitProject(@RequestParam("id")int id){
        Project project = projectService.getProject(id);
        project.setCompleted(true);
        projectService.saveProject(project);
    }
}
