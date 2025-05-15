package com.example.reddit_clone.Entity;

import com.example.reddit_clone.Class.Post;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<Post, Long> {

}
