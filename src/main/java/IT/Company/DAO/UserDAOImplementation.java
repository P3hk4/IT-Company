package IT.Company.DAO;

import IT.Company.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import IT.Company.entity.Authority;
import IT.Company.entity.Employee;

@Repository
public class UserDAOImplementation implements UserDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveNewUser(User user) {
        Session session = sessionFactory.getCurrentSession();
            user.setPassword("{noop}"+user.getPassword());
            Authority authority = new Authority(user.getUsername(), "ROLE_CLIENT");
            Employee Employee = new Employee();
            Employee.setUsername(user.getUsername());
            session.save(user);
            session.save(authority);
            session.save(Employee);
        }

    @Override
    public User getUser(String username) {
        Session session = sessionFactory.getCurrentSession();
        User user = session.createQuery("from User where username = :paramUsername",User.class).setParameter("paramUsername",username).getSingleResult();
        return user;
    }

    @Override
    public void saveOrUpdateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(user);
    }

    @Override
    public void deleteUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }
}
