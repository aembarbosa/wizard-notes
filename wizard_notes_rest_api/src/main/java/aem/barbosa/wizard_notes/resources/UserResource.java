package aem.barbosa.wizard_notes.resources;

import aem.barbosa.wizard_notes.entities.User;
import aem.barbosa.wizard_notes.repositories.UserRepository;
import aem.barbosa.wizard_notes.servicies.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping(value = "/users")
public class UserResource {

    @Autowired
    private UserService service;

    // Endpoint para recuperar todos dados do banco de dados
    @GetMapping
    public ResponseEntity<List<User>> findAll() {
//        User u = new User(1L, "Maria", "Maria dos Santos", "123456");
        List<User> users = service.findAll();
        return ResponseEntity.ok().body(users);
    }

    // Endpoint para recuperar dados atravez do id do banco de dados
    @GetMapping(value = "/{id}")
    public ResponseEntity<User> findById(@PathVariable Long id) {
        User obj = service.findById(id);
        return ResponseEntity.ok().body(obj);
    }

    // Inserir novo recurso no banco de dados
    @PostMapping
    public ResponseEntity<User> insert(@RequestBody User user) {
        user = service.insert(user);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(user.getId()).toUri();
        return ResponseEntity.created(uri).body(user);
    }

    // Atualizacao de usuario no banco de dados
    @PutMapping(value = "/{id}")
    public ResponseEntity<User> update(@PathVariable Long id, @RequestBody User user) {
        User existingUser = service.findById(id);
        if (existingUser == null) {
            return ResponseEntity.notFound().build();
        }
        user.setId(id);
        user = service.update(id, user);
        return ResponseEntity.ok().body(user);
    }

    // Deletando usuario no banco de dados
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<User> delete(@PathVariable Long id) {
        User existingUser = service.findById(id);
        if (existingUser == null) {
            return ResponseEntity.notFound().build();
        }
        service.delete(id);
        return ResponseEntity.ok().body(existingUser);
    }

}




