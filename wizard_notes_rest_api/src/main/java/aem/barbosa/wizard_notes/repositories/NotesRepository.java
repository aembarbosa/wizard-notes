package aem.barbosa.wizard_notes.repositories;

import aem.barbosa.wizard_notes.entities.Notes;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotesRepository extends JpaRepository<Notes, Long> {
}
