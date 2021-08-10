package IT.Company.Service;

import IT.Company.entity.Project;

import java.util.List;

public interface ProjectService {

    public List<Project> getAllProjectsInProgress();

    public List<Project> getAllProjectsUnpaid();

    public List<Project> getAllProjectsCompleted();

    public List<Project> getAllProjectsWithoutDevelopers();

    public Project getProject(int id);

    public List<Project> getMyProjects(String username);

    public void saveProject(Project project);

    public void deleteProject(int id);

    public List<Project> getMyWorkProject(String username);
}
