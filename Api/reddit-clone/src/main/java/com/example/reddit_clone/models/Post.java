package com.example.reddit_clone.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "posts")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String PostTitle;
    private String PostDescription;
    private String PostTime;

    private String PostAttachmentType;

    private String PostAttachmentsUrl;

    private String PostUserName;
    private int PostLikesCount;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}
