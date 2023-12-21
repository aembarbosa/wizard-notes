package aem.barbosa.wizard_notes.resources;

import aem.barbosa.wizard_notes.entities.User;
import aem.barbosa.wizard_notes.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/users")
public class UserResource {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public ResponseEntity<List<User>> findAll() {
//        User u = new User(1L, "Maria", "Maria dos Santos", "123456");
        List<User> users = userRepository.findAll();
        return ResponseEntity.ok().body(users);
    }

}




