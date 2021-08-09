package second.project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import second.project.DAO.AccountDAO;
import second.project.entity.Account;

import java.util.List;

@Service
public class AccountServiceImplementation implements AccountService {

    @Autowired
    private AccountDAO accountDAO;

    @Override
    @Transactional
    public List<Account> getAllEmployees() {
        return accountDAO.getAllEmployees();
    }

    @Override
    @Transactional
    public List<Account> getAllClients() {
        return accountDAO.getAllClients();
    }

    @Override
    @Transactional
    public void saveOrUpdateAcc(Account account) {
        accountDAO.saveOrUpdateAcc(account);
    }

    @Override
    @Transactional
    public Account getAccount(String username) {
        return accountDAO.getAccount(username);
    }

    @Override
    @Transactional
    public List<Account> getAllFrontDevelopers() {
        return accountDAO.getAllFrontDevelopers();
    }

    @Override
    @Transactional
    public List<Account> getAllBackDevelopers() {
        return accountDAO.getAllBackDevelopers();
    }
}
