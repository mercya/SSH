package com.demo.Action;

import com.demo.DaoImp.LoginImp;
import com.demo.Entity.Users;
import com.demo.ServiceImp.LoginServiceImp;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

/**
 * Created by eCRF on 2017/7/17.
 */
public class LoginAction extends ActionSupport {

    private String loginName;
    private String loginPwd;
    private LoginServiceImp loginServiceImp;

    public LoginServiceImp getLoginServiceImp() {
        return loginServiceImp;
    }

    public void setLoginServiceImp(LoginServiceImp loginServiceImp) {
        this.loginServiceImp = loginServiceImp;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String LoginA(){
//       loginName= (String) ServletActionContext.getRequest().getParameter("loginName");
//       loginPwd=(String) ServletActionContext.getRequest().getParameter("loginPwd");
        Users users=loginServiceImp.getUsers(loginName,loginPwd);
        if (users==null){
            return "error";
        }else {
            return "success";
        }
    }
}
