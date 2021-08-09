package second.project.DAO;

import second.project.entity.Account;
import second.project.entity.User;

public interface UserDAO {

    public void saveNewUser(User user);

    public User getUser(String username);

    public void saveOrUpdateUser(User user);

    public void deleteUser(User user);
}
