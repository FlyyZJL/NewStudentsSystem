package com.dao;

import com.model.StudentInfo;
import java.util.List;

// 学生信息数据访问对象接口
public interface StudentInfoDao {
    void addStudentInfo(StudentInfo studentInfo);
    List<StudentInfo> getStudentsByClassId(int classId);
    List<StudentInfo> getStudentsByTeacherId(int teacherId);
    void updateStudentInfo(StudentInfo studentInfo);
    void deleteStudentInfo(int id);
    StudentInfo getStudentInfoById(int id);
}
