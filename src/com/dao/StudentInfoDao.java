package com.dao;

import com.model.StudentInfo;
import java.util.List;

// 学生信息数据访问对象接口
public interface StudentInfoDao {
    void addStudentInfo(StudentInfo studentInfo);
    List<StudentInfo> getStudentsByClassId(int classId);
    List<StudentInfo> getStudentsByTeacherId(int teacherId);
    // 更新学生信息
    void updateStudentInfo(StudentInfo studentInfo);
    // 删除学生信息
    void deleteStudentById(int studentId);
    StudentInfo getStudentInfoById(int id);
    void updateStudentStatus(int studentId, String status); // 新增方法
    List<StudentInfo> getPendingStudents();
    StudentInfo getStudentInfoByUsername(String username);
}
