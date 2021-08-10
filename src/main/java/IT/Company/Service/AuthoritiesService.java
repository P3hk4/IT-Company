package IT.Company.Service;

import IT.Company.entity.Authority;

public interface AuthoritiesService {

    public void deleteAuthority(Authority authority);

    public Authority getAuthority(String username);
}
