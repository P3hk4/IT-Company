package IT.Company.context;

import IT.Company.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import IT.Company.Service.AccountService;
import IT.Company.Service.AuthoritiesService;
import IT.Company.Service.ProjectService;
import IT.Company.Service.UserService;
import IT.Company.entity.Account;
import IT.Company.entity.Project;

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
    public String homepage(){
        return "/homePage";
    }

    @RequestMapping("/login")
    public String login(){
        return "/homePage";
    }

    @RequestMapping("/registration")
    public String registration(Model model){
        User user = new User();
        model.addAttribute("user",user);
        return "/registration";
    }

    @RequestMapping("/saveRegistration")
    public String saveRegistration(@ModelAttribute("user")User user){
        userService.saveNewUser(user);
        return "/homePage";
    }

    @RequestMapping("/allEmployees")
    public String allEmployees(Model model){
        List<Account> accounts = accountService.getAllEmployees();
        model.addAttribute("accounts",accounts);
        return "/allAccounts";
    }

    @RequestMapping("/allClients")
    public String allClients(Model model){
        model.addAttribute("accounts",accountService.getAllClients());
        return "/allAccounts";
    }

    @RequestMapping("/onOffAcc")
    public String disableAcc(@RequestParam("username")String username) {
        User user = userService.getUser(username);
        if (user.getEnabled() == 1) {
            user.setEnabled((byte) 0);
        } else {
            user.setEnabled((byte) 1);
        }
        userService.saveOrUpdateUser(user);
        String auth = authoritiesService.getAuthority(username).getAuthority();
        if (auth.equals("ROLE_CLIENT")) {
            return "redirect:/allClients";
        } else {
            return "redirect:/allEmployees";
        }
    }

    @RequestMapping("/back")
    public String back(@RequestParam("auth")String auth){
        System.out.println(auth);
        if (auth.equals("ROLE_CLIENT")) {
            return "redirect:/allClients";
        } else {
            return "redirect:/allEmployees";
        }
    }

    @RequestMapping("/catalog")
    public String allAccounts(){
        return "/catalog";
    }

    @RequestMapping("/confirmDeleteAcc")
    public String deleteAcc(@RequestParam("username")String username, Model model){
    model.addAttribute("acc",accountService.getAccount(username));
    return "/confirmDeleteAcc";
    }

    @RequestMapping("/deleteAcc")
    public String deleteAcc(@ModelAttribute("username")String username){
        String auth = authoritiesService.getAuthority(username).getAuthority();
        authoritiesService.deleteAuthority(authoritiesService.getAuthority(username));
        userService.deleteUser(userService.getUser(username));
        if (auth.equals("ROLE_CLIENT")){
        return "redirect:/allClients";
        } else {
            return "redirect:/allEmployees";
        }
    }

    @RequestMapping("/myAccPage")
    public String myPage(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Account acc = accountService.getAccount(user.getUsername());
        model.addAttribute("myAcc",acc);
        return "myAcc";
    }

    @RequestMapping("/updateMyAcc")
    public String updateMyAcc(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Account acc = accountService.getAccount(user.getUsername());
        model.addAttribute("myAcc",acc);
        return "/updateMyAcc";
    }

    @RequestMapping("/saveUpdateMyAcc")
    public String saveUpdateMyAcc(@ModelAttribute("myAcc") Account account){
        accountService.saveOrUpdateAcc(account);
        return "myAcc";
    }

    @RequestMapping("/adminUpdateAcc")
    public String adminUpdateAcc(@RequestParam("username") String username, Model model){
        Account account = accountService.getAccount(username);
        model.addAttribute("acc",account);
        return "/adminUpdateAcc";
    }

    @RequestMapping("/saveAdminUpdate")
    public String saveAdminUpdate(@ModelAttribute("acc")Account account){
        String auth = account.getAuthority();
        if ((account.getPost().equals("Front-end developer") || (account.getPost().equals("Back-end developer")) && !(account.getAuthority().equals("ROLE_DEVELOPER")))){
            account.setAuthority("ROLE_DEVELOPER");
        } else if ((account.getPost().equals("Client") && !(account.getAuthority().equals("ROLE_CLIENT")))){
            account.setAuthority("ROLE_CLIENT");
        } else if ((account.getPost().equals("Administrator")) && !(account.getAuthority().equals("ROLE_ADMIN"))){
            account.setAuthority("ROLE_ADMIN");
        } else if ((account.getPost().equals("Operations manager") && !(account.getAuthority().equals("ROLE_MANAGER")))){
            account.setAuthority("ROLE_MANAGER");
        }
        accountService.saveOrUpdateAcc(account);
        if (auth.equals(("ROLE_CLIENT")) ){
            return "redirect:/allClients";
        } else {
            return "redirect:/allEmployees";
        }
    }

    @RequestMapping("/myCurrentProjects")
    public String myCurrentProjects(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("myProjects",projectService.getMyCurrentProjects(user.getUsername()));
        return "myCurrentProjects";
    }

    @RequestMapping("/myCompletedProjects")
    public String myCompletedProjects(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("myProjects",projectService.getMyCompletedProjects(user.getUsername()));
        return "myCompletedProjects";
    }

    @RequestMapping("/addOrder")
    public String addOrder(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Project project = new Project(user.getUsername());
        model.addAttribute("project",project);
        return "/addOrder";
    }

    @RequestMapping("/saveNewOrder")
    public String saveNewOrder(@ModelAttribute("project")Project project){
        projectService.saveProject(project);
        return "redirect:/myCurrentProjects";
    }

    @RequestMapping("/projectsInProgress")
    public String projectsInProcess(Model model){
        model.addAttribute("projects",projectService.getAllProjectsInProgress());
        return "/projectsInProgress";
    }

    @RequestMapping("/projectsWithoutDevelopers")
    public String projectsWithoutDevelopers(Model model){
        model.addAttribute("projects",projectService.getAllProjectsWithoutDevelopers());
        return "/projectsWithoutDevelopers";
    }

    @RequestMapping("/payProject")
    public String payProject(@RequestParam("id") int id,Model model){
        Project project = projectService.getProject(id);
        if (project.getPayed().equals(false)){
            model.addAttribute("project",project);
            return "/confirmProjectPay";
        } else if (project.getPayed().equals(true)) {
        return "/alreadyPaidError";
        }
        return "redirect:/myCurrentProjects";
    }

    @RequestMapping("/saveProjectPay")
    public String saveProjectPay(@ModelAttribute("project")Project project){
        project = projectService.getProject(project.getId());
        project.setPayed(true);
        projectService.saveProject(project);
        return "redirect:/myCurrentProjects";
    }

    @RequestMapping("/addDeveloper")
    public String addDeveloper(@RequestParam("id") int id,@RequestParam("button")String button,Model model){
        if (button.equals("front")) {
            model.addAttribute("accounts",accountService.getAllFrontDevelopers());
        } else if (button.equals("back")){
            model.addAttribute("accounts",accountService.getAllBackDevelopers());
        }
        model.addAttribute("projectId",id);
        return "/addDeveloper";
    }

    @RequestMapping("/saveAddDeveloper")
    public String saveAddDeveloper(@RequestParam("username")String username,@RequestParam("projectId")int id){
        Project project = projectService.getProject(id);
        if (accountService.getAccount(username).getPost().equals("Front-end developer")) {
            project.setFrontendDeveloper(username);
        } else if (accountService.getAccount(username).getPost().equals("Back-end developer")) {
            project.setBackendDeveloper(username);
        }
        projectService.saveProject(project);
        return "redirect:/projectsWithoutDevelopers";
    }

    @RequestMapping("/projectsUnpaid")
    public String projectsUnpaid(Model model){
        model.addAttribute("projects",projectService.getAllProjectsUnpaid());
        return "/projectsUnpaid";
    }

    @RequestMapping("/deleteProject")
    public String deleteProject(@RequestParam("projectId")int id,@RequestParam("button")String button){
        projectService.deleteProject(id);
        if (button.equals("projectsUnpaid")) {
            return "redirect:/projectsUnpaid";
        } else if (button.equals("myCurrentProjects")){
            return "redirect:/myCurrentProjects";
        } else {
            return "redirect:/projectsCompleted";
        }
    }

    @RequestMapping("/myWorkProjects")
    public String myWork(Model model){
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<Project> projects = projectService.getMyWorkProject(user.getUsername());
        model.addAttribute("projects",projects);
        model.addAttribute("username",user.getUsername());
        return "/myWorkProjects";
    }

    @RequestMapping("/completeMyWork")
    public String completeMyWork(@RequestParam("projectId")int id,@RequestParam("username")String username){
        Project project = projectService.getProject(id);
        Account account = accountService.getAccount(username);
        if (account.getPost().equals("Front-end developer")){
            project.setFrontendStatus(true);
        } else if (account.getPost().equals("Back-end developer")){
            project.setBackendStatus(true);
        }
        projectService.saveProject(project);
        return "redirect:/myWorkProjects";
    }

    @RequestMapping("/releaseProject")
    public String releaseProject(@RequestParam("projectId")int id){
        Project project = projectService.getProject(id);
        if ((project.getFrontendStatus()) && (project.getBackendStatus())) {
            project.setCompleted(true);
            projectService.saveProject(project);
            return "redirect:/projectsInProgress";
        } else {
            return "/releaseError";
        }
    }

    @RequestMapping("/projectsCompleted")
    public String projectsCompleted(Model model){
        model.addAttribute("projects",projectService.getAllProjectsCompleted());
        return "/projectsCompleted";
    }

    @RequestMapping("/changePassword")
    public String changePassword(@RequestParam("username")String username,Model model){
        model.addAttribute("username",username);
        return "/confirmPassword";
    }

    @RequestMapping("/confirmPassword")
    public String confirmPassword(@RequestParam("username")String username, @RequestParam("password")String password, Model model){
        password = "{noop}"+password;
        if (password.equals(userService.getUser(username).getPassword())){
            model.addAttribute("user",userService.getUser(username));
            return "newPassword";
        } else {
            model.addAttribute("username",username);
            return "/confirmPasswordError";
        }
    }

    @RequestMapping("/saveNewPassword")
    public String saveNewPassword(@ModelAttribute("user")User user, @RequestParam("newPassword") String newPassword){
        System.out.println(user+newPassword);
        user.setPassword("{noop}"+newPassword);
        System.out.println(user);
        userService.saveOrUpdateUser(user);
        return "redirect:/myAccPage";
    }

}
