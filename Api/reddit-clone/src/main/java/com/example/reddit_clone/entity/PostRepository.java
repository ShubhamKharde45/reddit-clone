package com.example.reddit_clone.entity;

import com.example.reddit_clone.models.Post;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<Post, Long> {

}
