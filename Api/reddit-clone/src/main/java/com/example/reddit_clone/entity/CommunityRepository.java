package com.example.reddit_clone.Entity;

import com.example.reddit_clone.Class.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CommunityRepository extends JpaRepository<CommunityRepository, Long> {

}
