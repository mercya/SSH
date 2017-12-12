package com.demo.utils;

import com.google.gson.Gson;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.DataOutputStream;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by eCRF on 2017/9/21.
 */
public class AppUtils {
    public static void outJson(Map<String, Object> rs) throws Exception {
        Gson g  = new Gson();
        String json = g.toJson(rs);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("application/json;charset=utf-8");
        response.setHeader("Cache-Control","no-cache");

        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
        pw.close();
    }


    public static void outText(String rs,String contentType) throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType(contentType);
        response.setHeader("Cache-Control","no-cache");
        DataOutputStream wr = new DataOutputStream(response.getOutputStream());
        wr.write(rs.getBytes());//输出流
        wr.flush();
        wr.close();
    }
    /**
     *@params  xml
     *@author  Marco
     *@date  2017/11/10
     */
    public static void outXml(String xml) throws Exception {
        HttpServletResponse response = ServletActionContext.getResponse();
        //设置response 的ContentType
        response.setContentType("application/xml;charset=utf-8");
        response.setHeader("Cache-Control","no-cache");

        PrintWriter pw = response.getWriter();
        pw.print(xml);
        pw.flush();
        pw.close();
    }

}
