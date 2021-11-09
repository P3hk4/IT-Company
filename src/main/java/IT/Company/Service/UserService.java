package IT.Company.Service;

import IT.Company.entity.User;

public interface UserService {

    void saveNewUser(User user);

    User getUser(String username);

    void saveOrUpdateUser(User user);

    void deleteUser(User user);
}
