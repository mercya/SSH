package com.demo.ServiceImp;

import com.demo.DaoImp.StudentDaoImp;
import com.demo.Entity.Students;
import com.demo.Service.StudentService;

import java.util.List;

/**
 * Created by eCRF on 2017/11/16.
 */

public class StudentServiceImp implements StudentService{

    StudentDaoImp studentDaoImp;

    public StudentDaoImp getStudentDaoImp() {
        return studentDaoImp;
    }

    public void setStudentDaoImp(StudentDaoImp studentDaoImp) {
        this.studentDaoImp = studentDaoImp;
    }

    @Override
    public Students getStudentsByname(String name) {

        return  studentDaoImp.getStudentByName(name);
    }

    @Override
    public List<Students> getStudentsBystu_id(String stu_id) {
        return studentDaoImp.getStudentByStuId(stu_id);
    }
}
