package com.dao;

import com.model.StudentInfo;
import java.util.List;

// 学生信息数据访问对象接口
public interface StudentInfoDao {
    void addStudentInfo(StudentInfo studentInfo);  // 添加学生信息
    void updateStudentInfo(StudentInfo studentInfo);  // 更新学生信息
    List<StudentInfo> getStudentsByTeacherId(int teacherId);//通过教师ID获取本班学生的信息
    StudentInfo getStudentInfoById(int id);  // 通过ID获取学生信息
    List<StudentInfo> getAllStudentInfos();  // 获取所有学生信息
    void deleteStudentInfo(int id);  // 删除学生信息
}
