package IT.Company.DAO;

import IT.Company.Service.UserService;
import IT.Company.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import IT.Company.entity.Account;
import IT.Company.entity.Authority;
import IT.Company.entity.Employee;

import java.util.List;

@Repository
public class AccountDAOImplements implements AccountDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private UserService userService;

    @Override
    public List<Account> getAllEmployees() {
        Session session = sessionFactory.getCurrentSession();
        List<Account> accounts = session.createQuery("from Account where (authority = 'ROLE_DEVELOPER') or (authority = 'ROLE_ADMIN') or (authority = 'ROLE_MANAGER')",Account.class).getResultList();
        return accounts;
    }

    @Override
    public List<Account> getAllClients() {
        Session session = sessionFactory.getCurrentSession();
        List<Account> accounts = session.createQuery("from Account where authority = 'ROLE_CLIENT'").getResultList();
        return accounts;
    }

    @Override
    public void saveOrUpdateAcc(Account account) {
        System.out.println(account);
        Session session = sessionFactory.getCurrentSession();
        Authority authority = new Authority(account.getUsername(),account.getAuthority());
        Employee Employee = new Employee(account.getUsername(),account.getName(),account.getSurname(),account.getPost(),account.getSalary());
        User user = userService.getUser(account.getUsername());
        System.out.println(user);
        user.setEnabled(account.getEnabled());
        session.saveOrUpdate(user);
        session.saveOrUpdate(authority);
        session.saveOrUpdate(Employee);
    }

    @Override
    public Account getAccount(String username) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Account where username = :paramUsername",Account.class).setParameter("paramUsername",username).getSingleResult();
    }

    @Override
    public List<Account> getAllFrontDevelopers() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Account where post = 'Front-end developer'",Account.class).getResultList();
    }

    @Override
    public List<Account> getAllBackDevelopers() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Account where post = 'Back-end developer'",Account.class).getResultList();
    }

    @Override
    public List<Account> getAllAccounts() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Account").getResultList();
    }
}
