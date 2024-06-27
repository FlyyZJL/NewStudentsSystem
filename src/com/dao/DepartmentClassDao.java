package com.dao;

import com.model.DepartmentClass;
import java.util.List;

// 院系与班级数据访问对象接口
public interface DepartmentClassDao {
    void addDepartmentClass(DepartmentClass departmentClass);  // 添加院系与班级
    void updateDepartmentClass(DepartmentClass departmentClass);  // 更新院系与班级
    DepartmentClass getDepartmentClassById(int id);  // 通过ID获取院系与班级
    List<DepartmentClass> getAllDepartmentClasses();  // 获取所有院系与班级
    void deleteDepartmentClass(int id);  // 删除院系与班级
    boolean existsDepartmentId(int departmentId);  // 检查院系是否存在
    boolean existsClassId(int classId);  // 检查班级是否存在
    String getDepartmentIdByName(String departmentName);
    String getClassIdByName(String className);
}
