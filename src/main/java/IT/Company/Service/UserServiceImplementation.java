package IT.Company.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import IT.Company.DAO.UserDAO;
import IT.Company.entity.User;

@Service
public class UserServiceImplementation implements UserService{

    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional
    public void saveNewUser(User user) {
        userDAO.saveNewUser(user);
    }

    @Override
    @Transactional
    public User getUser(String username) {
        return userDAO.getUser(username);
    }

    @Override
    @Transactional
    public void saveOrUpdateUser(User user) {
        userDAO.saveOrUpdateUser(user);
    }

    @Override
    @Transactional
    public void deleteUser(User user) {
        userDAO.deleteUser(user);
    }
}
