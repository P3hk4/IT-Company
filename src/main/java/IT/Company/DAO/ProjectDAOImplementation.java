package IT.Company.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import IT.Company.entity.Project;

import java.util.List;

@Repository
public class ProjectDAOImplementation implements ProjectDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Project> getAllProjectsInProgress() {
        Session session = sessionFactory.getCurrentSession();
        List<Project> projectsOnWork = session.createQuery("from Project where (frontendDeveloper != null ) and (backendDeveloper != null) and (payed = true) and (completed = false)",Project.class).getResultList();
        return projectsOnWork;
    }

    @Override
    public List<Project> getAllProjectsUnpaid() {
        Session session = sessionFactory.getCurrentSession();
        List <Project> projectsWaitPays = session.createQuery("from Project where payed = false ",Project.class).getResultList();
        return projectsWaitPays;
    }

    @Override
    public List<Project> getAllProjectsCompleted() {
        Session session = sessionFactory.getCurrentSession();
        List<Project> projectsCompleted = session.createQuery("from Project where completed = true", Project.class).getResultList();
        return projectsCompleted;
    }

    @Override
    public List<Project> getAllProjectWithoutDevelopers() {
        Session session = sessionFactory.getCurrentSession();
        List<Project> projectsWithoutDevelopers = session.createQuery("from Project where (payed = true ) and ((frontendDeveloper = null ) or (backendDeveloper = null))",Project.class).getResultList();
        return projectsWithoutDevelopers;
    }

    @Override
    public Project getProject(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Project.class,id);
    }

    @Override
    public List<Project> getMyProjects(String username) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Project where customer = :paramUsername",Project.class).setParameter("paramUsername",username).getResultList();
    }

    @Override
    public void saveProject(Project project) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(project);
    }

    @Override
    public void deleteProject(int id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete("Project.class",id);
    }

    @Override
    public List<Project> getMyWorkProjects(String username) {
        Session session = sessionFactory.getCurrentSession();
        List<Project> projects = session.createQuery("from Project where ((frontendDeveloper = :paramUsername) and (frontendStatus = false)) or ((backendDeveloper = :paramUsername) and (backendStatus = false))",Project.class).setParameter("paramUsername",username).getResultList();
        return projects;
    }


}
