package aem.barbosa.wizard_notes.resources;

import aem.barbosa.wizard_notes.entities.Note;
import aem.barbosa.wizard_notes.servicies.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping(value = "/notes")
public class NoteResource {

    @Autowired
    private NoteService service;

    @GetMapping
    public ResponseEntity<List<Note>> findAll() {
        List<Note> notes = service.findAll();
        return ResponseEntity.ok().body(notes);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Note> findById(@PathVariable Long id) {
        Note existingNote = service.findById(id);
        if (existingNote == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(existingNote);
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<Note> update(@PathVariable Long id, @RequestBody Note note) {
        Note existingNote = service.findById(id);
        if (existingNote == null) {
            return ResponseEntity.notFound().build();
        }
        note.setId(id);

        Note responseNote = service.update(note);
        return ResponseEntity.ok().body(responseNote);
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Note> delete(@PathVariable Long id) {
        Note existingNote = service.findById(id);
        if (existingNote == null) {
            return ResponseEntity.notFound().build();
        }
        service.deleteNote(id);
        return ResponseEntity.ok().body(existingNote);
    }
}




