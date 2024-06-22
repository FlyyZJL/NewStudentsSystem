package com.dao;

import com.model.DepartmentClass;
import com.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// 院系与班级数据访问对象实现类
public class DepartmentClassDaoImpl implements DepartmentClassDao {

    @Override
    public void addDepartmentClass(DepartmentClass departmentClass) {
        // 添加院系与班级
        String sql = "INSERT INTO department_class (department_id, class_id, department_name, class_name) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, departmentClass.getDepartmentId());
            statement.setInt(2, departmentClass.getClassId());
            statement.setString(3, departmentClass.getDepartmentName());
            statement.setString(4, departmentClass.getClassName());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateDepartmentClass(DepartmentClass departmentClass) {
        // 更新院系与班级
        String sql = "UPDATE department_class SET department_id=?, class_id=?, department_name=?, class_name=? WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, departmentClass.getDepartmentId());
            statement.setInt(2, departmentClass.getClassId());
            statement.setString(3, departmentClass.getDepartmentName());
            statement.setString(4, departmentClass.getClassName());
            statement.setInt(5, departmentClass.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public DepartmentClass getDepartmentClassById(int id) {
        // 通过ID获取院系与班级
        String sql = "SELECT * FROM department_class WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                DepartmentClass departmentClass = new DepartmentClass();
                departmentClass.setId(rs.getInt("id"));
                departmentClass.setDepartmentId(rs.getInt("department_id"));
                departmentClass.setClassId(rs.getInt("class_id"));
                departmentClass.setDepartmentName(rs.getString("department_name"));
                departmentClass.setClassName(rs.getString("class_name"));
                return departmentClass;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<DepartmentClass> getAllDepartmentClasses() {
        // 获取所有院系与班级
        String sql = "SELECT * FROM department_class";
        List<DepartmentClass> departmentClassList = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                DepartmentClass departmentClass = new DepartmentClass();
                departmentClass.setId(rs.getInt("id"));
                departmentClass.setDepartmentId(rs.getInt("department_id"));
                departmentClass.setClassId(rs.getInt("class_id"));
                departmentClass.setDepartmentName(rs.getString("department_name"));
                departmentClass.setClassName(rs.getString("class_name"));
                departmentClassList.add(departmentClass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departmentClassList;
    }

    @Override
    public void deleteDepartmentClass(int id) {
        // 删除院系与班级
        String sql = "DELETE FROM department_class WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

