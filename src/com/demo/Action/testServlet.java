package com.demo.Action;

import org.apache.avalon.framework.thread.SingleThreaded;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

/**
 * Created by eCRF on 2017/10/9.
 */

public class testServlet extends HttpServlet  implements SingleThreaded{
    /**
     *@params req  resp
     *@author  Marco
     *@date  2017/11/13
     */

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
              resp.setContentType("text/html");
              PrintWriter out = resp.getWriter();
              out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
              out.println("<HTML>");
              out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
              out.println("  <BODY>");
              out.print("    This is ");
              out.print(this.getClass());
              out.println(", using the GET method");
              out.println("  </BODY>");
              out.println("</HTML>");
              out.flush();
              out.close();
//        String path = this.getServletContext().getRealPath("\\images\\tou2.jpg");
//        String fileName = path.substring(path.lastIndexOf("\\"));
//        resp.setContentType("image/jpeg");
//        resp.setHeader("content-disposition","attachment;filename"+ URLEncoder.encode(fileName,"UTF-8"));
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
//                response.setContentType("text/html");
//                PrintWriter out = response.getWriter();
//                out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//                out.println("<HTML>");
//                out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//                out.println("  <BODY>");
//                out.print("    This is ");
//                out.print(this.getClass());
//                out.println(", using the POST method");
//                out.println("  </BODY>");
//                out.println("</HTML>");
//                out.flush();
//                out.close();
        doGet(req,response);
    }
}
