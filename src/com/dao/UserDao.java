package com.dao;

import com.model.User;
import java.util.List;

// 用户数据访问对象接口
public interface UserDao {
    void addUser(User user);  // 添加用户
    void updateUser(User user);  // 更新用户
    User getUserById(int id);  // 通过ID获取用户
    User getUserByUsername(String username);  // 通过用户名获取用户
    List<User> getAllUsers();  // 获取所有用户
    void deleteUser(int id);  // 删除用户



    
}
