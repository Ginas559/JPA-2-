package vn.iotstar.configs;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.iotstar.entity.Category;

public class Test {
	public static void main(String[] args) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		
		Category cate = new Category();
		cate.setCategoryname("Iphone");
		cate.setImages("abc.jpg");
		cate.setStatus(1);
		
		try {
			trans.begin();
			
			//Noi thuc hien cac lenh insert - update - delete
			enma.persist(cate);
			
			trans.commit();
		} catch(Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.clear();
		}
	}
}
