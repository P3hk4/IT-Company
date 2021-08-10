package IT.Company.DAO;

import IT.Company.entity.Account;

import java.util.List;

public interface AccountDAO {

    public List<Account> getAllEmployees();

    public List<Account> getAllClients();

    public void saveOrUpdateAcc(Account account);

    public Account getAccount(String username);

    public List<Account> getAllFrontDevelopers();

    public List<Account> getAllBackDevelopers();
}