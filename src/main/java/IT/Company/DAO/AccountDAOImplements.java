package IT.Company.DAO;

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
        Session session = sessionFactory.getCurrentSession();
        Authority authority = new Authority(account.getUsername(),account.getAuthority());
        Employee Employee = new Employee(account.getUsername(),account.getName(),account.getSurname(),account.getPost(),account.getSalary());
        System.out.println(account+"acc");
        System.out.println(authority+"authority");
        System.out.println(Employee +"employee");
        session.saveOrUpdate(authority);
        session.saveOrUpdate(Employee);
    }

    @Override
    public Account getAccount(String username) {
        Session session = sessionFactory.getCurrentSession();
        Account account = session.createQuery("from Account where username = :paramUsername",Account.class).setParameter("paramUsername",username).getSingleResult();
        return account;
    }

    @Override
    public List<Account> getAllFrontDevelopers() {
        Session session = sessionFactory.getCurrentSession();
        List<Account> accounts = session.createQuery("from Account where post = 'Front-end developer'",Account.class).getResultList();
        return accounts;
    }

    @Override
    public List<Account> getAllBackDevelopers() {
        Session session = sessionFactory.getCurrentSession();
        List<Account> accounts = session.createQuery("from Account where post = 'Back-end developer'",Account.class).getResultList();
        return accounts;
    }
}
