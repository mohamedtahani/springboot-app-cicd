package com.example.backend;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest
@ActiveProfiles("test")  // Tells Spring to load application-test.properties
public class BackendApplicationTests {

    @Test
    void contextLoads() {
    }
}
