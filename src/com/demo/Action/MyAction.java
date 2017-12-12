package com.demo.Action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by eCRF on 2017/11/14.
 */
public class MyAction extends ActionSupport {
    private Integer age;

    public Integer getAge() {
        return age;
    }
    public void setAge(Integer age) {
        this.age = age;
    }

    public String save() {
        return "success";
    }



}
