package second.project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import second.project.DAO.AuthoritiesDAO;
import second.project.entity.Authority;

@Service
public class AuthoritiesServiceImplementation implements AuthoritiesService {

    @Autowired
    private AuthoritiesDAO authoritiesDAO;

    @Override
    @Transactional
    public void deleteAuthority(Authority authority) {
        authoritiesDAO.deleteAuthority(authority);
    }

    @Override
    @Transactional
    public Authority getAuthority(String username) {
        return authoritiesDAO.getAuthority(username);
    }
}
