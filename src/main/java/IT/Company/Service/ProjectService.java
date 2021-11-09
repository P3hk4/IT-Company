package IT.Company.Service;

import IT.Company.entity.Project;

import java.util.List;

public interface ProjectService {

    List<Project> getAllProjectsInProgress();

    List<Project> getAllProjectsUnpaid();

    List<Project> getAllProjectsCompleted();

    List<Project> getAllProjectsWithoutDevelopers();

    Project getProject(int id);

    List<Project> getMyProjects(String username);

    void saveProject(Project project);

    void deleteProject(int id);

    void payProject(int id);

    List<Project> getMyWorkProject(String username);
}
