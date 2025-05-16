package com.example.reddit_clone.entity;

import com.example.reddit_clone.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    boolean existsByUserPublicUUIDAndUserEmail(String userPublicUUID, String userEmail);
    User findByUserPublicUUID(String userPublicUUID);
    boolean existsByUserEmailAndUserPassword(String email, String password);

    User findByUserEmail(String email);
}
