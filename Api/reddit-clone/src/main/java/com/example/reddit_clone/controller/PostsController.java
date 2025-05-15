package com.example.reddit_clone.Controller;

import com.example.reddit_clone.Class.Post;
import com.example.reddit_clone.Class.User;
import com.example.reddit_clone.services.DBService;
import com.example.reddit_clone.services.PostsDBService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/post")
public class PostsController {

    private DBService dbService;

}
