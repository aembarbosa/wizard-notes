package aem.barbosa.wizard_notes.entities;

import java.io.Serializable;
import java.util.Objects;

public class User implements Serializable {

    public Long id;
    private String username;
    private String full_name;
    private String password;

    public User() {
    }

    public User(Long id, String username, String full_name, String password) {
        this.id = id;
        this.username = username;
        this.full_name = full_name;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User user)) return false;
        return getId() == user.getId();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }
}