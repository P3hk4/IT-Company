package IT.Company.DAO;

import IT.Company.entity.Authority;

public interface AuthoritiesDAO {

    public void deleteAuthority(Authority authority);

    public Authority getAuthority(String username);
}
