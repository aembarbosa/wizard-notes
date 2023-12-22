package aem.barbosa.wizard_notes.repositories;

import aem.barbosa.wizard_notes.entities.Note;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteRepository extends JpaRepository<Note, Long> {
}
