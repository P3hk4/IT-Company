package IT.Company.Service;

import IT.Company.entity.Account;

import java.util.List;

public interface AccountService {

    List<Account> getAllEmployees();

    List<Account> getAllClients();

    List<Account> getAllAccounts();

    void saveOrUpdateAcc(Account account);

    Account getAccount(String username);

    List<Account> getAllFrontDevelopers();

    List<Account> getAllBackDevelopers();
}
