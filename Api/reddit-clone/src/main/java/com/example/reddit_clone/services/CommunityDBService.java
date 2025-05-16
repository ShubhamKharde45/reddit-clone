package com.example.reddit_clone.services;

import com.example.reddit_clone.entity.CommunityRepository;
import com.example.reddit_clone.models.Community;
import com.example.reddit_clone.models.User;
import com.example.reddit_clone.entity.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CommunityDBService {
    @Autowired
    private CommunityRepository communityRepo;

    @Autowired
    private UserRepository userRepo;

    public boolean MakeCommunty(Map map){
        try {
            List<User> members = new ArrayList<>();
            for(String uuid : (List<String>) map.get("memberUUIDs")){
                User user = userRepo.findByUserPublicUUID(uuid);
                if (user != null) {

                }
                members.add(user);
            }
            Community community = new Community();
            community.setCommunityName(map.get("communityName").toString());
            community.setCommunityDescription(map.get("communityDescription").toString());
            community.setCommunityPassword(map.get("communityPassword").toString());
            community.setCommunityCreatedTime(map.get("communityCreatedTime").toString());
            community.setCommunityAdminPublicUUID(map.get("communityAdminPublicUUID").toString());
            community.setMembers(members);
            communityRepo.save(community);
            return true;
        }catch (Exception e){
            return false;
        }
    }

}
