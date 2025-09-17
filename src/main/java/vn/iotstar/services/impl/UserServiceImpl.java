package vn.iotstar.services.impl;

import java.util.List;
import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;

public class UserServiceImpl implements UserService {

	UserDao userDao = new UserDaoImpl();
	
	@Override
	public void insert(User user) {
		userDao.insert(user);
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void delete(int userId) throws Exception {
		userDao.delete(userId);
	}

	@Override
	public User findById(int userId) {
		return userDao.findById(userId);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public List<User> findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public List<User> findAll(int page, int pagesize) {
		return userDao.findAll(page, pagesize);
	}

	@Override
	public int count() {
		return userDao.count();
	}
	
	@Override
	public User findByUsername2(String username) {
	    return userDao.findByUsername2(username);
	}
}