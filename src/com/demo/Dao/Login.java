package com.demo.Dao;

import com.demo.Entity.Users;

import java.util.List;

/**
 * Created by eCRF on 2017/7/17.
 */
public interface Login {
    public Users getUserByNameandPassword(String name,String password);
}
