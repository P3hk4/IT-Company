package IT.Company.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import IT.Company.DAO.ProjectDAO;
import IT.Company.entity.Project;

import java.util.List;

@Service
public class ProjectServiceImplementation implements ProjectService{

    @Autowired
    private ProjectDAO projectDAO;

    @Override
    @Transactional
    public List<Project> getAllProjectsInProgress() {
        return projectDAO.getAllProjectsInProgress();
    }

    @Override
    @Transactional
    public List<Project> getAllProjectsUnpaid() {
        return projectDAO.getAllProjectsUnpaid();
    }

    @Override
    @Transactional
    public List<Project> getAllProjectsCompleted() {
        return projectDAO.getAllProjectsCompleted();
    }

    @Override
    @Transactional
    public List<Project> getAllProjectsWithoutDevelopers() {
        return projectDAO.getAllProjectWithoutDevelopers();
    }

    @Override
    @Transactional
    public Project getProject(int id) {
        return projectDAO.getProject(id);
    }

    @Override
    @Transactional
    public List<Project> getMyProjects(String username) {
        return projectDAO.getMyProjects(username);
    }

    @Override
    @Transactional
    public void saveProject(Project project) {
        projectDAO.saveProject(project);
    }

    @Override
    @Transactional
    public void deleteProject(int id) {
        projectDAO.deleteProject(id);
    }

    @Override
    @Transactional
    public List<Project> getMyWorkProject(String username) {
        return projectDAO.getMyWorkProjects(username);
    }
}
