package aem.barbosa.wizard_notes.servicies;

import aem.barbosa.wizard_notes.entities.User;
import aem.barbosa.wizard_notes.repositories.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository repository;

    public List<User> findAll() {
        return repository.findAll();
    }

    public User findById(Long id) {
        Optional<User> obj = repository.findById(id);
        return obj.orElse(null);
    }

    // Inserir no banco de dados um usuario
    public User insert(User user) {
       return repository.save(user);
    }

    @Transactional
    public User update(Long id, User user) {
        User entity = repository.getReferenceById(id);
        updateData(entity, user);
        return repository.save(entity);
    }

    private void updateData(User entity, User user) {
        entity.setUsername(entity.getUsername());
        entity.setFull_name(user.getFull_name());
        entity.setPassword(user.getPassword());
    }

    // Deletar um usuário do banco de dados
    public void delete(Long id) {
        repository.deleteById(id);
    }

}
