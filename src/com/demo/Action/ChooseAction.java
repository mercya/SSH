package com.demo.Action;


import com.demo.ServiceImp.ChooseServiceImp;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;

/**
 * Created by eCRF on 2017/9/6.
 */
public class ChooseAction extends ActionSupport {
    ChooseServiceImp chooseServiceImp;

    public ChooseServiceImp getChooseServiceImp() {
        return chooseServiceImp;
    }

    public void setChooseServiceImp(ChooseServiceImp chooseServiceImp) {
        this.chooseServiceImp = chooseServiceImp;
    }

    public String getID(){
        ServletRequest request= ServletActionContext.getRequest();
        String name= (String) request.getParameter("name");
        return String.valueOf(chooseServiceImp.GetProvinceID(name));
    }
    public String MapChoose(){
        ServletRequest request= ServletActionContext.getRequest();
        return  request.getParameter("id");
    }
}
