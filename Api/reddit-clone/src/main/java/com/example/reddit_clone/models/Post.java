package com.example.reddit_clone.Class;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "posts")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String PostTitle;
    private String PostDescription;
    private String PostTime;

    private List<String> PostAttachmentType;


    private List<String> PostAttachmentsUrl;

    private String PostUserName;
    private int PostLikesCount;
    private int PostCommentsCount;

    private List<String> PostComments;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}
