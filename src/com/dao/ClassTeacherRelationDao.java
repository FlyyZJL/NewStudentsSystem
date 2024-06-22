package com.dao;

import com.model.ClassTeacherRelation;
import java.util.List;

// 教师与班级关系数据访问对象接口
public interface ClassTeacherRelationDao {
    void addRelation(ClassTeacherRelation relation);  // 添加关系
    void updateRelation(ClassTeacherRelation relation);  // 更新关系
    ClassTeacherRelation getRelationById(int id);  // 通过ID获取关系
    List<ClassTeacherRelation> getAllRelations();  // 获取所有关系
    void deleteRelation(int id);  // 删除关系
}
