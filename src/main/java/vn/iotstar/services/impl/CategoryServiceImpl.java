package vn.iotstar.services.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.services.CategoryService;

public class CategoryServiceImpl implements CategoryService{

	CategoryDao cateDao = new CategoryDaoImpl();
	
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return cateDao.count();
	}

	@Override
	public List<Category> findAll(int page, int pagesize) {
		// TODO Auto-generated method stub
		return cateDao.findAll(page, pagesize);
	}

	@Override
	public List<Category> findByCategoryname(String catname) {
//	    EntityManager em = JPAConfig.getEntityManager();
//	    String jpql = "SELECT c FROM Category c WHERE c.categoryname LIKE :catname";
//	    TypedQuery<Category> query = em.createQuery(jpql, Category.class);
//	    query.setParameter("catname", "%" + catname + "%");
//	    return query.getResultList();
		
		return cateDao.findByCategoryname(catname);
	}


	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return cateDao.findAll();
	}

	@Override
	public Category findById(int cateid) {
		// TODO Auto-generated method stub
		return cateDao.findById(cateid);
	}

	@Override
	public void delete(int cateid) throws Exception {
		// TODO Auto-generated method stub
		cateDao.delete(cateid);
	}

	@Override
	public void update(Category category) {
		// TODO Auto-generated method stub
		cateDao.update(category);
	}

	@Override
	public void insert(Category category) {
		// TODO Auto-generated method stub
		cateDao.insert(category);
	}
	
}
