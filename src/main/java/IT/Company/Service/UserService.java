package IT.Company.Service;

import IT.Company.entity.User;

public interface UserService {

    public void saveNewUser(User user);

    public User getUser(String username);

    public void saveOrUpdateUser(User user);

    public void deleteUser(User user);
}
