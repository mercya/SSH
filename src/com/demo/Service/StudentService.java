package com.demo.Service;

import com.demo.Entity.Students;

import java.util.List;

/**
 * Created by eCRF on 2017/11/16.
 */
public interface StudentService {

    public Students getStudentsByname(String name);
    public List<Students> getStudentsBystu_id(String stu_id);

}
