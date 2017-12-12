package com.demo.Service;

import com.demo.Entity.Users;

/**
 * Created by eCRF on 2017/7/18.
 */
public interface LoginService {
    public Users getUsers(String name,String password);

}
