package com.dao;

import com.model.User;
import com.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// 用户数据访问对象实现类
public class UserDaoImpl implements UserDao {

    @Override
    public void addUser(User user) {
        // 添加用户
        String sql = "INSERT INTO users (username, password, user_type, first_login) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getUserType());
            statement.setBoolean(4, user.isFirstLogin());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateUser(User user) {
        // 更新用户
        String sql = "UPDATE users SET username=?, password=?, user_type=?, first_login=? WHERE userid=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getUserType());
            statement.setBoolean(4, user.isFirstLogin());
            statement.setInt(5, user.getUserid());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User getUserById(int id) {
        // 通过ID获取用户
        String sql = "SELECT * FROM users WHERE userid=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("userid"));
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
        // 通过用户名获取用户
        String sql = "SELECT * FROM users WHERE username=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("id"));
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
    public List<User> getAllUsers() {
        // 获取所有用户
        String sql = "SELECT * FROM users";
        List<User> userList = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setUserType(rs.getString("user_type"));
                user.setFirstLogin(rs.getBoolean("first_login"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void deleteUser(int id) {
        // 删除用户
        String sql = "DELETE FROM users WHERE userid=?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
