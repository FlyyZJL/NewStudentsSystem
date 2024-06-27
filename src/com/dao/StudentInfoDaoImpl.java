package com.dao;

import com.model.StudentInfo;
import com.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentInfoDaoImpl implements StudentInfoDao {

    @Override
    public void addStudentInfo(StudentInfo studentInfo) {
        String sql = "INSERT INTO students_info (name, gender, origin, birth_date, ethnicity, phone, email, class_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentInfo.getName());
            ps.setString(2, studentInfo.getGender());
            ps.setString(3, studentInfo.getOrigin());
            ps.setDate(4, new java.sql.Date(studentInfo.getBirthDate().getTime()));
            ps.setString(5, studentInfo.getEthnicity());
            ps.setString(6, studentInfo.getPhone());
            ps.setString(7, studentInfo.getEmail());
            ps.setString(8, studentInfo.getClassId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<StudentInfo> getStudentsByClassId(int classId) {
        List<StudentInfo> students = new ArrayList<>();
        String sql = "SELECT * FROM students_info WHERE class_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, classId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    StudentInfo student = new StudentInfo();
                    student.setId(rs.getInt("id"));
                    student.setName(rs.getString("name"));
                    student.setGender(rs.getString("gender"));
                    student.setOrigin(rs.getString("origin"));
                    student.setBirthDate(rs.getDate("birth_date"));
                    student.setEthnicity(rs.getString("ethnicity"));
                    student.setPhone(rs.getString("phone"));
                    student.setEmail(rs.getString("email"));
                    student.setClassId(rs.getString("class_id"));
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public List<StudentInfo> getStudentsByTeacherId(int teacherId) {
        List<StudentInfo> students = new ArrayList<>();
        String sql = "SELECT si.* FROM students_info si " +
                "JOIN class_teacher_relation ctr ON si.class_id = ctr.class_id " +
                "WHERE ctr.userid = ? AND si.status = 'approved'";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, teacherId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    StudentInfo student = new StudentInfo();
                    student.setId(rs.getInt("id"));
                    student.setName(rs.getString("name"));
                    student.setGender(rs.getString("gender"));
                    student.setOrigin(rs.getString("origin"));
                    student.setBirthDate(rs.getDate("birth_date"));
                    student.setEthnicity(rs.getString("ethnicity"));
                    student.setPhone(rs.getString("phone"));
                    student.setEmail(rs.getString("email"));
                    student.setClassId(rs.getString("class_id"));
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public void updateStudentInfo(StudentInfo studentInfo) {
        String sql = "UPDATE students_info SET name = ?, gender = ?, origin = ?, birth_date = ?, ethnicity = ?, phone = ?, email = ?, class_id = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentInfo.getName());
            ps.setString(2, studentInfo.getGender());
            ps.setString(3, studentInfo.getOrigin());
            ps.setDate(4, new java.sql.Date(studentInfo.getBirthDate().getTime()));
            ps.setString(5, studentInfo.getEthnicity());
            ps.setString(6, studentInfo.getPhone());
            ps.setString(7, studentInfo.getEmail());
            ps.setString(8, studentInfo.getClassId());
            ps.setInt(9, studentInfo.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteStudentById(int studentId) {
        String sql = "DELETE FROM students_info WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public StudentInfo getStudentInfoById(int id) {
        StudentInfo student = null;
        String sql = "SELECT * FROM students_info WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    student = new StudentInfo();
                    student.setId(rs.getInt("id"));
                    student.setName(rs.getString("name"));
                    student.setGender(rs.getString("gender"));
                    student.setOrigin(rs.getString("origin"));
                    student.setBirthDate(rs.getDate("birth_date"));
                    student.setEthnicity(rs.getString("ethnicity"));
                    student.setPhone(rs.getString("phone"));
                    student.setEmail(rs.getString("email"));
                    student.setClassId(rs.getString("class_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }
    @Override
    public void updateStudentStatus(int studentId, String status) {
        String sql = "UPDATE students_info SET status = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, studentId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<StudentInfo> getPendingStudents() {
        List<StudentInfo> students = new ArrayList<>();
        String sql = "SELECT si.* FROM students_info si " +
                "JOIN class_teacher_relation ctr ON si.class_id = ctr.class_id " +
                "WHERE ctr.userid = ? AND si.status = 'Pending'";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                StudentInfo student = new StudentInfo();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setGender(rs.getString("gender"));
                student.setOrigin(rs.getString("origin"));
                student.setBirthDate(rs.getDate("birth_date"));
                student.setEthnicity(rs.getString("ethnicity"));
                student.setPhone(rs.getString("phone"));
                student.setEmail(rs.getString("email"));
                student.setClassId(rs.getString("class_id"));
                student.setStatus(rs.getString("status"));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }
    @Override
    public StudentInfo getStudentInfoByUsername(String username) {
        StudentInfo studentInfo = null;
        String sql = "SELECT * FROM students_info WHERE name = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    studentInfo = new StudentInfo();
                    studentInfo.setId(rs.getInt("id"));
                    studentInfo.setName(rs.getString("name"));
                    studentInfo.setGender(rs.getString("gender"));
                    studentInfo.setOrigin(rs.getString("origin"));
                    studentInfo.setBirthDate(rs.getDate("birth_date"));
                    studentInfo.setEthnicity(rs.getString("ethnicity"));
                    studentInfo.setPhone(rs.getString("phone"));
                    studentInfo.setEmail(rs.getString("email"));
                    studentInfo.setClassId(rs.getString("class_id"));
                    studentInfo.setStatus(rs.getString("status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentInfo;
    }

}
