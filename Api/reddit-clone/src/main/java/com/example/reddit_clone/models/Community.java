package com.example.reddit_clone.Class;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "communities")
public class Community {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    @Column(nullable = false, unique = true)
    private String communityName;

    private String communityDescription;

    @Column(nullable = false)
    private String communityPassword;

    @Column(nullable = false)
    private String communityCreatedTime;

    @Column(nullable = false)
    private User communityAdmin;

    private List<User> connectedUsers = new ArrayList<User>();

}
