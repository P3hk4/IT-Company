package second.project.Service;

import second.project.entity.Authority;

public interface AuthoritiesService {

    public void deleteAuthority(Authority authority);

    public Authority getAuthority(String username);
}
