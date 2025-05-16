package com.example.reddit_clone.controller;

import com.example.reddit_clone.services.DBService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/posts")
public class PostsController {

    @GetMapping("/add")
    public String hi(){
        return "ADDED";
    }

}
