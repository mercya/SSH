package com.demo.Action;

import com.demo.utils.AppUtils;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import jdk.nashorn.internal.runtime.regexp.joni.ast.Node;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by eCRF on 2017/9/19.
 */
public class AppAction extends ActionSupport{

//    private String Code;
//    private String Content;
//    private int ForceUpdating;
    //http://192.168.131.34:8080/text.action

    public String Test() {

        Map<String, Object> resultlMap = new HashMap<String, Object>();
        resultlMap.put("Code", "1");
        resultlMap.put("Content", "更新内容");
        resultlMap.put("ForceUpdating", 1);
        try {
            AppUtils.outJson(resultlMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
