package com.demo.Entity;

/**
 * Created by eCRF on 2017/9/14.
 */

public class Updateinfo {
    private String Code;
    private String Content;
    private int ForceUpdating;

    public int getForceUpdating() {
        return ForceUpdating;
    }

    public void setForceUpdating(int forceUpdating) {
        ForceUpdating = forceUpdating;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
}
