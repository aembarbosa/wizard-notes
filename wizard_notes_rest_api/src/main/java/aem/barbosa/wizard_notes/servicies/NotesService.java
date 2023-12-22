package aem.barbosa.wizard_notes.servicies;

import aem.barbosa.wizard_notes.entities.Notes;
import aem.barbosa.wizard_notes.repositories.NotesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NotesService {

    @Autowired
    private NotesRepository repository;

    public List<Notes> findAll() {
        return repository.findAll();
    }

    public Notes findById(Long id) {
        Optional<Notes> obj = repository.findById(id);
        return obj.get();
    }
}
