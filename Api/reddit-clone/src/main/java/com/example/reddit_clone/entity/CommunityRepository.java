package com.example.reddit_clone.entity;

import com.example.reddit_clone.models.Community;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommunityRepository extends JpaRepository<Community, Long> {

}
