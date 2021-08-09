package second.project.Service;

import second.project.entity.Account;

import java.util.List;

public interface AccountService {

    public List<Account> getAllEmployees();

    public List<Account> getAllClients();

    public void saveOrUpdateAcc(Account account);

    public Account getAccount(String username);

    public List<Account> getAllFrontDevelopers();

    public List<Account> getAllBackDevelopers();
}
