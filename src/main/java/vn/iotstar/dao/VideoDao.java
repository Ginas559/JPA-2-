package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.entity.Video;

public interface VideoDao {
	void insert(Video video);
	void update(Video video);
	void delete(int videoId) throws Exception;
	Video findById(int videoId);
	List<Video> findAll();
	List<Video> findByTitle(String title);
	List<Video> findAll(int page, int pagesize);
	int count();
	List<Video> findByCategoryId(int categoryId);
}