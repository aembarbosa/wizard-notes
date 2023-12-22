package aem.barbosa.wizard_notes.resources;

import aem.barbosa.wizard_notes.entities.Notes;
import aem.barbosa.wizard_notes.servicies.NotesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/notes")
public class NotesResource {

    @Autowired
    private NotesService service;

    @GetMapping
    public ResponseEntity<List<Notes>> findAll() {
//        Notes u = new Notes(1L, "Maria", "Maria dos Santos", "123456");
        List<Notes> users = service.findAll();
        return ResponseEntity.ok().body(users);
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Notes> findById(@PathVariable Long id) {
        Notes obj = service.findById(id);
        return ResponseEntity.ok().body(obj);
    }

}




