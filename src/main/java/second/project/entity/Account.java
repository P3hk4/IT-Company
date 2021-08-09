package second.project.entity;

import javax.persistence.*;

@Entity
@Table(name = "Accounts")
public class Account {

    @Id
    @Column(name = "username")
    private String username;

    @Column(name = "enabled")
    private byte enabled;

    @Column(name = "authority")
    private String authority;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "post")
    private String post;

    @Column(name = "salary")
    private int salary;

    public Account() {
    }

    public Account(String username, byte enabled, String authority, String name, String surname, String post, int salary) {
        this.username = username;
        this.enabled = enabled;
        this.authority = authority;
        this.name = name;
        this.surname = surname;
        this.post = post;
        this.salary = salary;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public byte getEnabled() {
        return enabled;
    }

    public void setEnabled(byte enabled) {
        this.enabled = enabled;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }
}
