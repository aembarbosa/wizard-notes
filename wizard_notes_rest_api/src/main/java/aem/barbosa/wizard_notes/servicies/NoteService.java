package aem.barbosa.wizard_notes.servicies;

import aem.barbosa.wizard_notes.entities.Note;
import aem.barbosa.wizard_notes.repositories.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NoteService {

    @Autowired
    private NoteRepository repository;

    public List<Note> findAll() {
        return repository.findAll();
    }

    public Note findById(Long id) {
        Optional<Note> note = repository.findById(id);
        return note.orElse(null);
    }

    public Note insert(Note note) {
        return repository.save(note);
    }

    public Note update(Note newNote) {
        return repository.save(newNote);
    }

    public void deleteNote(Long id) {
        repository.deleteById(id);
    }

}
