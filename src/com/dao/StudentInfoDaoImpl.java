package com.dao;

import com.model.StudentInfo;
import com.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// 学生信息数据访问对象实现类
public class StudentInfoDaoImpl implements StudentInfoDao {

    @Override
    public void addStudentInfo(StudentInfo studentInfo) {
        // 添加学生信息
        String sql = "INSERT INTO students_info (name, gender, origin, birth_date, ethnicity, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, studentInfo.getName());
            statement.setString(2, studentInfo.getGender());
            statement.setString(3, studentInfo.getOrigin());
            statement.setDate(4, new java.sql.Date(studentInfo.getBirthDate().getTime()));
            statement.setString(5, studentInfo.getEthnicity());
            statement.setString(6, studentInfo.getPhone());
            statement.setString(7, studentInfo.getEmail());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateStudentInfo(StudentInfo studentInfo) {
        // 更新学生信息
        String sql = "UPDATE students_info SET name=?, gender=?, origin=?, birth_date=?, ethnicity=?, phone=?, email=? WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, studentInfo.getName());
            statement.setString(2, studentInfo.getGender());
            statement.setString(3, studentInfo.getOrigin());
            statement.setDate(4, new java.sql.Date(studentInfo.getBirthDate().getTime()));
            statement.setString(5, studentInfo.getEthnicity());
            statement.setString(6, studentInfo.getPhone());
            statement.setString(7, studentInfo.getEmail());
            statement.setInt(8, studentInfo.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public StudentInfo getStudentInfoById(int id) {
        // 通过ID获取学生信息
        String sql = "SELECT * FROM students_info WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                StudentInfo studentInfo = new StudentInfo();
                studentInfo.setId(rs.getInt("id"));
                studentInfo.setName(rs.getString("name"));
                studentInfo.setGender(rs.getString("gender"));
                studentInfo.setOrigin(rs.getString("origin"));
                studentInfo.setBirthDate(rs.getDate("birth_date"));
                studentInfo.setEthnicity(rs.getString("ethnicity"));
                studentInfo.setPhone(rs.getString("phone"));
                studentInfo.setEmail(rs.getString("email"));
                return studentInfo;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<StudentInfo> getAllStudentInfos() {
        // 获取所有学生信息
        String sql = "SELECT * FROM students_info";
        List<StudentInfo> studentInfoList = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                StudentInfo studentInfo = new StudentInfo();
                studentInfo.setId(rs.getInt("id"));
                studentInfo.setName(rs.getString("name"));
                studentInfo.setGender(rs.getString("gender"));
                studentInfo.setOrigin(rs.getString("origin"));
                studentInfo.setBirthDate(rs.getDate("birth_date"));
                studentInfo.setEthnicity(rs.getString("ethnicity"));
                studentInfo.setPhone(rs.getString("phone"));
                studentInfo.setEmail(rs.getString("email"));
                studentInfoList.add(studentInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentInfoList;
    }

    @Override
    public void deleteStudentInfo(int id) {
        // 删除学生信息
        String sql = "DELETE FROM students_info WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public List<StudentInfo> getStudentsByTeacherId(int teacherId) {
        List<StudentInfo> students = new ArrayList<>();
        String sql = "SELECT s.* FROM students_info s " +
                "JOIN class_teacher_relation ctr ON s.class_id = ctr.class_id " +
                "WHERE ctr.teacher_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, teacherId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    StudentInfo student = new StudentInfo();
                    student.setId(rs.getInt("user_id"));
                    student.setName(rs.getString("name"));
                    student.setGender(rs.getString("gender"));
                    student.setOrigin(rs.getString("native_place"));
                    student.setBirthDate(rs.getDate("birth_date"));
                    student.setEthnicity(rs.getString("ethnicity"));
                    student.setPhone(rs.getString("phone"));
                    student.setEmail(rs.getString("email"));
                    students.add(student);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }
}
