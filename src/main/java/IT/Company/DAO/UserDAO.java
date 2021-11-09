package IT.Company.DAO;

import IT.Company.entity.User;

public interface UserDAO {

    void saveNewUser(User user);

    User getUser(String username);

    void saveOrUpdateUser(User user);

    void deleteUser(User user);
}
