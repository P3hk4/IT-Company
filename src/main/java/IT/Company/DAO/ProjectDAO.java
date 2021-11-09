package IT.Company.DAO;

import IT.Company.entity.Project;

import java.util.List;


public interface ProjectDAO {

    List<Project> getAllProjectsInProgress();

    List<Project> getAllProjectsUnpaid();

    List<Project> getAllProjectsCompleted();

    List<Project> getAllProjectWithoutDevelopers();

    Project getProject(int id);

    List<Project> getMyProjects(String username);

    void saveProject(Project project);

    void deleteProject(int id);

    void payProject(int id);

    List<Project> getMyWorkProjects(String username);
}
