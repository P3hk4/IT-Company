package IT.Company.DAO;

import IT.Company.entity.Authority;

public interface AuthoritiesDAO {

    void deleteAuthority(Authority authority);

    Authority getAuthority(String username);
}
