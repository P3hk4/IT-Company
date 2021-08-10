package IT.Company.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import IT.Company.entity.Authority;

@Repository
public class AuthoritiesDAOImplementation implements AuthoritiesDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void deleteAuthority(Authority authority) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(authority);
    }

    @Override
    public Authority getAuthority(String username) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Authority where username = :paramUsername",Authority.class).setParameter("paramUsername",username).getSingleResult();
    }
}
