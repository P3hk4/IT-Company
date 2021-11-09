package IT.Company.entity;

import javax.persistence.*;

@Entity
@Table(name = "Employees")
public class Employee {

    @Id
    @Column(name = "username")
    private String username;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "post")
    private String post = "Client";

    @Column(name = "salary")
    private int salary;

    public Employee() {
    }

    public Employee(String username, String name, String surname, String post, int salary) {
        this.username = username;
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

    @Override
    public String toString() {
        return "Employee{" +
                "username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", post='" + post + '\'' +
                ", salary=" + salary +
                '}';
    }
}
