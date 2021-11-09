package IT.Company.DAO;

import IT.Company.entity.Account;

import java.util.List;

public interface AccountDAO {

    List<Account> getAllEmployees();

    List<Account> getAllClients();

    void saveOrUpdateAcc(Account account);

    Account getAccount(String username);

    List<Account> getAllFrontDevelopers();

    List<Account> getAllBackDevelopers();

    List<Account> getAllAccounts();
}
