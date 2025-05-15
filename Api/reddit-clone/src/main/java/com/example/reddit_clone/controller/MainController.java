package com.example.reddit_clone.Controller;
import com.example.reddit_clone.Class.User;
import com.example.reddit_clone.Entity.UserRepository;
import com.example.reddit_clone.services.DBService;
import com.fasterxml.jackson.databind.ser.std.StdKeySerializers;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/auth")
public class MainController {

    private DBService dbService;

    @PostMapping("/signup")
    public ResponseEntity<Object> signup(
            @RequestBody User user
    ){
        boolean response = dbService.SignUpWithEmailandPass(user);

        if (response){
            HashMap map = new HashMap();
            map.put("UserName", user.getUserName());
            map.put("UserEmail", user.getUserEmail());
            map.put("UserPublicUUID", user.getUserPublicUUID());

            return ResponseEntity.ok().body(map);
        }else{
            return ResponseEntity.unprocessableEntity().body("Error while signing up");
        }
    }
}
