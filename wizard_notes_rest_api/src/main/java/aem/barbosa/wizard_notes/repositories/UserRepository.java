package aem.barbosa.wizard_notes.repositories;

import aem.barbosa.wizard_notes.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
