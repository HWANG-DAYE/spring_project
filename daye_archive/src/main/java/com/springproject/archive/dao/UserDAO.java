package com.springproject.archive.dao;

import com.springproject.archive.dto.UserDTO;

public interface UserDAO {
    void insertUser(UserDTO user); 
    UserDTO findByUsername(String username);
    int checkDuplicateUsername(String username);
}
