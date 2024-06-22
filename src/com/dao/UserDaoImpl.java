package com.dao;

import com.model.User;
import com.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// 用户数据访问对象实现类
public class UserDaoImpl implements UserDao {

//    @Override
//    public void addUser(User user) {
//        // 添加用户
//        String sql = "INSERT INTO users (username, password, user_type, first_login) VALUES (?, ?, ?, ?)";
//        try (Connection connection = DBUtil.getConnection();
//             PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setString(1, user.getUsername());
//            statement.setString(2, user.getPassword());
//            statement.setString(3, user.getUserType());
//            statement.setBoolean(4, user.isFirstLogin());
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
@Override
public void addUser(User user) {
    String sql = "INSERT INTO users (username, password, class_id, department, user_type, first_login) VALUES (?, ?, ?, ?, ?, ?)";
    try (Connection conn = DBUtil.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getPassword());
        ps.setObject(3, user.getClassId()); // 可以为 null
        ps.setString(4, user.getDepartment());
        ps.setString(5, user.getUserType());
        ps.setBoolean(6, user.isFirstLogin());
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    @Override
    public int getUserIdByUsername(String username) {
        int userId = -1;
        String sql = "SELECT id FROM users WHERE username = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }

    @Override
    public void updateUser(User user) {
        String sql = "UPDATE users SET username = ?, password = ?, class_id = ?, department = ?, user_type = ?, first_login = ? WHERE id = ?";
                try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setObject(3, user.getClassId()); // 可以为 null
            ps.setString(4, user.getDepartment());
            ps.setString(5, user.getUserType());
            ps.setBoolean(6, user.isFirstLogin());
            ps.setInt(7, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User getUserById(int id) {
        // 通过ID获取用户
        String sql = "SELECT * FROM users WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setUserType(rs.getString("user_type"));
                user.setFirstLogin(rs.getBoolean("first_login"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        User user = null;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setDepartment(rs.getString("department"));
                    user.setUserType(rs.getString("user_type"));
                    user.setFirstLogin(rs.getBoolean("first_login"));
                    user.setClassId(rs.getString("class_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setClassId(rs.getString("class_id"));
                user.setDepartment(rs.getString("department"));
                user.setUserType(rs.getString("user_type"));
                user.setFirstLogin(rs.getBoolean("first_login"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void deleteUser(int id) {
        // 删除用户
        String sql = "DELETE FROM users WHERE id=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public List<User> getAllTeachers() {
        List<User> teachers = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE user_type = 'teacher'";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setDepartment(rs.getString("department"));
                user.setUserType(rs.getString("user_type"));
                user.setFirstLogin(rs.getBoolean("first_login"));
                teachers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }
}
