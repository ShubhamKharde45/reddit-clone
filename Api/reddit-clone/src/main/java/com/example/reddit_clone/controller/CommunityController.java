
package com.example.reddit_clone.controller;
import com.example.reddit_clone.entity.CommunityRepository;
import com.example.reddit_clone.models.Community;
import com.example.reddit_clone.services.CommunityDBService;
import com.example.reddit_clone.services.DBService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/community")
public class CommunityController {

    @Autowired
    private CommunityRepository communityRepo;

    @Autowired
    private CommunityDBService communityDBService;

    @PostMapping("/make")
    public ResponseEntity<Object> makeCommunity(@RequestBody Map map){
        try {
            communityDBService.MakeCommunty(map);
            return ResponseEntity.ok().body("Added");
        }catch (Exception e){
            return ResponseEntity.unprocessableEntity().body("Not Added");
        }
    }

}
