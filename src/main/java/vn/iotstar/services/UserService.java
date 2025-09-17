package vn.iotstar.services;

import java.util.List;
import vn.iotstar.entity.User;

public interface UserService {
	void insert(User user);
	void update(User user);
	void delete(int userId) throws Exception;
	User findById(int userId);
	List<User> findAll();
	List<User> findByUsername(String username);
	List<User> findAll(int page, int pagesize);
	int count();
	User findByUsername2(String username);
}