package com.example.backend.controller;

import com.example.backend.repository.MessageRepository;
import com.example.backend.model.Message;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/message")
public class MessageController {

    private final MessageRepository repo;

    public MessageController(MessageRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public String getMessage() {
        return repo.findAll().get(0).getText();
    }
}
