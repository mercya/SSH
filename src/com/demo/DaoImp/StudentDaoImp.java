package com.demo.DaoImp;

import com.demo.Dao.StudentDao;
import com.demo.Entity.Students;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by eCRF on 2017/11/16.
 */
public class StudentDaoImp extends HibernateDaoSupport implements StudentDao {

    /*
    * 获取单条学生的数据
    * */
    @Override
    public Students getStudentByName(String name) {
        StringBuilder sb=new StringBuilder();
        sb.append(" from Students where name= "+name);
        List<Students> list= (List<Students>) getHibernateTemplate().find(sb.toString(),null);
        return list.get(0);
    }

    @Override
    public List<Students> getStudentByStuId(String stu_id) {
        StringBuilder sb=new StringBuilder();
        sb.append(" from Students where stu_id=" +stu_id);
        List<Students> list= (List<Students>) getHibernateTemplate().find(sb.toString(),null);
        return list;
    }
}
