package com.example.reddit_clone.services;

import com.example.reddit_clone.entity.PostRepository;
import com.example.reddit_clone.entity.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostsDBService {
    @Autowired
    private UserRepository userRepo;

    @Autowired
    private PostRepository postsRepo;


}
