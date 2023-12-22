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
//        Notes u = new Notes(1L, "Maria", "Maria dos Santos", "123456");
        List<Note> users = service.findAll();
        return ResponseEntity.ok().body(users);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Note> findById(@PathVariable Long id) {
        Note obj = service.findById(id);
        return ResponseEntity.ok().body(obj);
    }

    @PostMapping
    public ResponseEntity<Note> insert(@RequestBody Note note) {
        note = service.insert(note);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(note.getId()).toUri();
        return ResponseEntity.created(uri).body(note);
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




