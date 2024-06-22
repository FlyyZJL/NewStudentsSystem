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
}
