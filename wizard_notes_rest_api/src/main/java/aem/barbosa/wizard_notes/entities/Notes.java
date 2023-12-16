package aem.barbosa.wizard_notes.entities;

import java.io.Serializable;
import java.util.Objects;

public class Notes implements Serializable {

    private Long id;
    private String title;
    private String message;
    private int user_id;

    public Notes(){
    }

    public Notes(Long id, String title, String message, int user_id) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.user_id = user_id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Notes notes)) return false;
        return getId() == notes.getId();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }
}
