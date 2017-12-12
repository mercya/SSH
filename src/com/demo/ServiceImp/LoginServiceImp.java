package com.demo.ServiceImp;

import com.demo.DaoImp.LoginImp;
import com.demo.Entity.Users;
import com.demo.Service.LoginService;

/**
 * Created by eCRF on 2017/7/18.
 */
public class LoginServiceImp implements LoginService {

    private LoginImp loginImp;

    public LoginImp getLoginImp() {
        return loginImp;
    }

    public void setLoginImp(LoginImp loginImp) {
        this.loginImp = loginImp;
    }

    @Override
    public Users getUsers(String name,String password) {
        return loginImp.getUserByNameandPassword(name,password);
    }
}
