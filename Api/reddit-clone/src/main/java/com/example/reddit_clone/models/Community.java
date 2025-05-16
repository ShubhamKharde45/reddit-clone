package com.example.reddit_clone.models;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private String communityAdminPublicUUID;

    @ManyToMany
    @JoinTable(
            name = "community_members",
            joinColumns = @JoinColumn(name = "community_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> members = new ArrayList<>();

    public Map toMap(
            Community community
    ){
        Map<String, Object> map = new HashMap();
        map.put("communityName", community.getCommunityName());
        map.put("communityDescription", community.getCommunityDescription());
        map.put("communityPassword", community.getCommunityPassword());
        map.put("communityCreatedTime", community.getCommunityCreatedTime());
        map.put("communityAdminPublicUUID", community.getCommunityAdminPublicUUID());
        return map;
    }
    public Community toModel(
            Map map
    ){
        Community community = new Community();

        community.setCommunityName(map.get("communityName").toString());
        community.setCommunityDescription(map.get("communityDescription").toString());
        community.setCommunityPassword(map.get("communityPassword").toString());
        community.setCommunityCreatedTime(map.get("communityCreatedTime").toString());
        community.setCommunityAdminPublicUUID(map.get("communityAdminPublicUUID").toString());

        return community;
    }
}
