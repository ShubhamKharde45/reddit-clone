package com.example.reddit_clone.models;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;


@Getter
@Setter
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String userName;

    @Column(nullable = false, unique = true)
    private String userEmail;
    private String userPassword;

    @Column(nullable = false, unique = true)
    private String userPublicUUID;

    @Column(nullable = false)
    private boolean userStatus;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Post> posts = new ArrayList<Post>();

    @ManyToMany(mappedBy = "members")
    private List<Community> communities = new ArrayList<>();
}
