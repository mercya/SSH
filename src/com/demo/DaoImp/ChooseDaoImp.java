package com.demo.DaoImp;

import com.demo.Dao.Choose;
import com.demo.Entity.Province;
import com.demo.Entity.Users;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by eCRF on 2017/9/6.
 */
public class ChooseDaoImp extends HibernateDaoSupport implements Choose {
    @Override
    public int GetProvinceDetailByID(String province_name) {
        StringBuilder sb=new StringBuilder();
        sb.append(" from Province where Province= "+province_name);
        List<Province> list=new ArrayList<>();
        list= (List<Province>) this.getHibernateTemplate().find(sb.toString(),null);
        return list.get(0).getId();
        
    }
}
