package second.project.DAO;

import second.project.entity.Authority;

public interface AuthoritiesDAO {

    public void deleteAuthority(Authority authority);

    public Authority getAuthority(String username);
}
