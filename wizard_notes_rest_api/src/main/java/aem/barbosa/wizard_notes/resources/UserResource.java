package aem.barbosa.wizard_notes.resources;

import aem.barbosa.wizard_notes.entities.Note;
import aem.barbosa.wizard_notes.entities.User;
import aem.barbosa.wizard_notes.repositories.UserRepository;
import aem.barbosa.wizard_notes.servicies.NoteService;
import aem.barbosa.wizard_notes.servicies.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping(value = "/users")
public class UserResource {

    @Autowired
    private UserService userService;
    
    @Autowired
    private NoteService notesService;

    // Endpoint para recuperar todos dados do banco de dados
    @GetMapping
    public ResponseEntity<List<User>> findAll() {
//        User u = new User(1L, "Maria", "Maria dos Santos", "123456");
        List<User> users = userService.findAll();
        return ResponseEntity.ok().body(users);
    }

    // Endpoint para recuperar dados atravez do id do banco de dados
    @GetMapping(value = "/{id}")
    public ResponseEntity<User> findById(@PathVariable Long id) {
        User existingUser = userService.findById(id);
        if (existingUser == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(existingUser);
    }

    // Inserir novo recurso no banco de dados
    @PostMapping
    public ResponseEntity<User> insert(@RequestBody User user) {
        try {
            User newUser = userService.insert(user);
            URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(newUser.getId()).toUri();
            return ResponseEntity.created(uri).body(newUser);
        } catch (DataIntegrityViolationException exception) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }

    @PostMapping("/{id}/notes")
    public ResponseEntity<Note> insert(@PathVariable Long id, @RequestBody Note note) {
        User existingUser = userService.findById(id);
        if (existingUser == null) {
            return ResponseEntity.notFound().build();
        }
        
        Note newNote = note;
        newNote.setUser(existingUser);
        notesService.insert(newNote);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(note.getId()).toUri();
        return ResponseEntity.created(uri).body(newNote);
    }

    // Atualizacao de usuario no banco de dados
    @PutMapping(value = "/{id}")
    public ResponseEntity<User> update(@PathVariable Long id, @RequestBody User user) {
        User existingUser = userService.findById(id);
        if (existingUser == null) {
            return ResponseEntity.notFound().build();
        }
        user.setId(id);
        user = userService.update(id, user);
        return ResponseEntity.ok().body(user);
    }

    // Deletando usuario no banco de dados
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<User> delete(@PathVariable Long id) {
        User existingUser = userService.findById(id);
        if (existingUser == null) {
            return ResponseEntity.notFound().build();
        }
        userService.delete(id);
        return ResponseEntity.ok().body(existingUser);
    }
    
    

}




