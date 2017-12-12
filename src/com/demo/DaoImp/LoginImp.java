package com.demo.DaoImp;

import com.demo.Dao.Login;
import com.demo.Entity.Users;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by eCRF on 2017/7/17.
 */
public class LoginImp extends HibernateDaoSupport implements Login {


    @Override
    public Users getUserByNameandPassword(String name, String password) {
        StringBuilder sb=new StringBuilder();
        sb.append(" from Users where UserName='"+name+"' and Password= '"+password+"'");
        List<Users> list=new ArrayList<>();
        list= (List<Users>) this.getHibernateTemplate().find(sb.toString(),null);
        if (list.size()==0) {
            return null;
        }else {
            return list.get(0);
        }
    }
}
