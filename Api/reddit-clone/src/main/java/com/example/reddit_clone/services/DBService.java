package com.example.reddit_clone.services;


import com.example.reddit_clone.models.User;
import com.example.reddit_clone.entity.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class DBService {
    @Autowired
    private UserRepository userRepo;

    public boolean SignUpWithEmailandPass(User user){
        try {
            userRepo.save(user);
            return true;
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
    }

    public Object LogInWithEmailAndPassword(String email, String password){
        try {
            User user = userRepo.findByUserEmail(email);
            if (user != null && user.getUserPassword().equals(password)) {
            HashMap map = new HashMap();
            map.put("UserName", user.getUserName());
            map.put("UserPublicUUID", user.getUserPublicUUID());
            return map;
            }
            return "Incorrect password";
        }catch (Exception e){
            return "User does not exist";
        }
    }



}
