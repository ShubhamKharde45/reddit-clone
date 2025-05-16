package com.example.reddit_clone.controller;
import com.example.reddit_clone.models.User;
import com.example.reddit_clone.models.Userdata;
import com.example.reddit_clone.services.DBService;
import lombok.AllArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@AllArgsConstructor
@RequestMapping("/auth")
public class UserController {

    @Autowired
    private DBService dbService;

    @PostMapping("/signup")
    public ResponseEntity<Object> signup(
            @RequestBody Userdata userdata
    ){
        User _user = new User();
        _user.setUserName(userdata.getUsername());
        _user.setUserEmail(userdata.getEmail());
        _user.setUserPassword(userdata.getPassword());
        _user.setUserPublicUUID(UUID.randomUUID().toString());
        _user.setUserStatus(true);

        boolean response = dbService.SignUpWithEmailandPass(_user);
        if (response){
            HashMap map = new HashMap();
            map.put("UserName", _user.getUserName());
            map.put("UserEmail", _user.getUserEmail());
            map.put("UserPublicUUID", _user.getUserPublicUUID());

            return ResponseEntity.ok().body(map);
        }else{
            return ResponseEntity.unprocessableEntity().body("Error while signing up");
        }
    }

    @PostMapping("/login")
    public ResponseEntity<Object> signin(
            @RequestBody Map<String, String> data
    ){
        String email = data.get("email");
        String password = data.get("password");
        Object response = dbService.LogInWithEmailAndPassword(email,password);
        if (response.equals("Incorrect password")){

            return ResponseEntity.ok().body("Invalid Credentials");
        }
        if(response.equals("User does not exist")){
            return ResponseEntity.unprocessableEntity().body("User does not exist");
        }
        return ResponseEntity.ok().body(response);
    }
}
