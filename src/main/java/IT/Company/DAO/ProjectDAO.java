package IT.Company.DAO;

import IT.Company.entity.Project;

import java.util.List;


public interface ProjectDAO {

    public List<Project> getAllProjectsInProgress();

    public List<Project> getAllProjectsUnpaid();

    public List<Project> getAllProjectsCompleted();

    public List<Project> getAllProjectWithoutDevelopers();

    public Project getProject(int id);

    public List<Project> getMyProjects(String username);

    public void saveProject(Project project);

    public void deleteProject(int id);

    public List<Project> getMyWorkProjects(String username);
}
