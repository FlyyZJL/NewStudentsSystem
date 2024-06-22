package com.model;

// 教师与班级关系实体类
public class ClassTeacherRelation {
    private int id;  // 自增ID
    private int teacherId;  // 教师ID
    private int classId;  // 班级ID

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }
}
