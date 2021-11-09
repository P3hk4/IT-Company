package IT.Company.Service;

import IT.Company.entity.Authority;

public interface AuthoritiesService {

    void deleteAuthority(Authority authority);

    Authority getAuthority(String username);
}
