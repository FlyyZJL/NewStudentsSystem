package com.dao;

import com.model.ClassTeacherRelation;
import com.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// 教师与班级关系数据访问对象实现类
public class ClassTeacherRelationDaoImpl implements ClassTeacherRelationDao {

    @Override
    public void addRelation(ClassTeacherRelation relation) {
        // 添加关系
        String sql = "INSERT INTO class_teacher_relation (teacher_id, class_id) VALUES (?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, relation.getTeacherId());
            statement.setInt(2, relation.getClassId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateRelation(ClassTeacherRelation relation) {
        // 更新关系
        String sql = "UPDATE class_teacher_relation SET teacher_id=?, class_id=? WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, relation.getTeacherId());
            statement.setInt(2, relation.getClassId());
            statement.setInt(3, relation.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ClassTeacherRelation getRelationById(int id) {
        // 通过ID获取关系
        String sql = "SELECT * FROM class_teacher_relation WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                ClassTeacherRelation relation = new ClassTeacherRelation();
                relation.setId(rs.getInt("id"));
                relation.setTeacherId(rs.getInt("teacher_id"));
                relation.setClassId(rs.getInt("class_id"));
                return relation;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<ClassTeacherRelation> getAllRelations() {
        // 获取所有关系
        String sql = "SELECT * FROM class_teacher_relation";
        List<ClassTeacherRelation> relationList = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                ClassTeacherRelation relation = new ClassTeacherRelation();
                relation.setId(rs.getInt("id"));
                relation.setTeacherId(rs.getInt("teacher_id"));
                relation.setClassId(rs.getInt("class_id"));
                relationList.add(relation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return relationList;
    }

    @Override
    public void deleteRelation(int id) {
        // 删除关系
        String sql = "DELETE FROM class_teacher_relation WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
