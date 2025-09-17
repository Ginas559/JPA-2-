package vn.iotstar.dao.impl;

import java.util.List;
import java.util.Queue;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.entity.Category;


public class CategoryDaoImpl implements CategoryDao{

    // Insert
    @Override
	public void insert(Category category) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(category);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    // Update
    @Override
	public void update(Category category) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(category);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    // Delete
    @Override
	public void delete(int cateid) throws Exception {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Category category = enma.find(Category.class, cateid);
            if (category != null) {
            	enma.remove(category);
            } else {
            	throw new Exception("Khong tim thay");
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    // Tìm theo ID
    @Override
	public Category findById(int cateid) {
        EntityManager enma = JPAConfig.getEntityManager();
        Category category = enma.find(Category.class, cateid);
        return category;
    }

    // Tìm tất cả
    @Override
	public List<Category> findAll() {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Category> query = enma.createNamedQuery("Category.findAll", Category.class);
        return query.getResultList();
    }

    // Tìm theo tên
    @Override
	public List<Category> findByCategoryname(String catname) {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT c FROM Category c WHERE c.categoryname LIKE :catname";
        TypedQuery<Category> query = enma.createQuery(jpql, Category.class);
        query.setParameter("catname", "%" + catname + "%");
        return query.getResultList();
    }
    
    @Override
	public List<Category> findAll(int page, int pagesize) {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Category> query = enma.createNamedQuery("Category.findAll", Category.class);
        query.setFirstResult(page * pagesize);
        query.setMaxResults(pagesize);
        return query.getResultList();
    }
    
    @Override
	public int count() {
    	EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT count(c) FROM categories c";
        Query query = enma.createQuery(jpql);
        return ((Long)query.getSingleResult()).intValue();
    }
}
