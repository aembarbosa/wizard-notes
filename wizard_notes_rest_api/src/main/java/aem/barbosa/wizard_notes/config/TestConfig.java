package aem.barbosa.wizard_notes.config;

import aem.barbosa.wizard_notes.entities.User;
import aem.barbosa.wizard_notes.repositories.UserRepository;
import com.fasterxml.jackson.databind.deser.BasicDeserializerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import java.util.Arrays;

@Configuration
@Profile("test")
public class TestConfig implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void run(String... args) throws Exception {
        User alyne = new User(null, "alynemb", "Alyne Emmily", "12345678");
        User samir = new User(null, "samirtf", "Samir TF", "87654321");

        try {
            userRepository.saveAll(Arrays.asList(alyne, samir));
        } catch (Exception exception) {
            System.out.println(exception.getMessage());
        }
    }
}