package com.demo.Dao;

import com.demo.Entity.Students;

import java.util.List;

/**
 * Created by eCRF on 2017/11/16.
 */
public interface StudentDao {

    public Students getStudentByName(String name);
    public List<Students> getStudentByStuId(String stu_id);

}
