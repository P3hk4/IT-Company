package IT.Company.entity;


import javax.persistence.*;

@Entity
@Table(name = "Projects")
public class Project {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "customer")
    private String customer;

    @Column(name = "name")
    private String name;

    @Column(name = "frontendStatus")
    private Boolean frontendStatus = false;

    @Column(name = "backendStatus")
    private Boolean backendStatus = false;

    @Column(name = "frontendDeveloper")
    private String frontendDeveloper;

    @Column(name = "backendDeveloper")
    private String backendDeveloper;

    @Column(name = "completed")
    private Boolean completed = false;

    @Column(name = "payed")
    private Boolean payed = false;

    public Project(String customer) {
        this.customer = customer;
    }

    public Project(int id, String customer, String name, Boolean frontendStatus, Boolean backendStatus, String frontendDeveloper, String backendDeveloper, Boolean completed, Boolean payed) {
        this.id = id;
        this.customer = customer;
        this.name = name;
        this.frontendStatus = frontendStatus;
        this.backendStatus = backendStatus;
        this.frontendDeveloper = frontendDeveloper;
        this.backendDeveloper = backendDeveloper;
        this.completed = completed;
        this.payed = payed;
    }

    public Project() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getFrontendStatus() {
        return frontendStatus;
    }

    public void setFrontendStatus(Boolean frontendStatus) {
        this.frontendStatus = frontendStatus;
    }

    public Boolean getBackendStatus() {
        return backendStatus;
    }

    public void setBackendStatus(Boolean backendStatus) {
        this.backendStatus = backendStatus;
    }

    public String getFrontendDeveloper() {
        return frontendDeveloper;
    }

    public void setFrontendDeveloper(String frontendDeveloper) {
        this.frontendDeveloper = frontendDeveloper;
    }

    public String getBackendDeveloper() {
        return backendDeveloper;
    }

    public void setBackendDeveloper(String backendDeveloper) {
        this.backendDeveloper = backendDeveloper;
    }

    public Boolean getCompleted() {
        return completed;
    }

    public void setCompleted(Boolean completed) {
        this.completed = completed;
    }

    public Boolean getPayed() {
        return payed;
    }

    public void setPayed(Boolean payed) {
        this.payed = payed;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", customer='" + customer + '\'' +
                ", name='" + name + '\'' +
                ", frontendStatus=" + frontendStatus +
                ", backendStatus=" + backendStatus +
                ", frontendDeveloper='" + frontendDeveloper + '\'' +
                ", backendDeveloper='" + backendDeveloper + '\'' +
                ", completed=" + completed +
                ", payed=" + payed +
                '}';
    }


}
