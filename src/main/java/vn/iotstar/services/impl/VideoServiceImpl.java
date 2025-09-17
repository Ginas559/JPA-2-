package vn.iotstar.services.impl;

import java.util.List;
import vn.iotstar.dao.VideoDao;
import vn.iotstar.dao.impl.VideoDaoImpl;
import vn.iotstar.entity.Video;
import vn.iotstar.services.VideoService;

public class VideoServiceImpl implements VideoService {

	VideoDao videoDao = new VideoDaoImpl();
	
	@Override
	public void insert(Video video) {
		videoDao.insert(video);
	}

	@Override
	public void update(Video video) {
		videoDao.update(video);
	}

	@Override
	public void delete(int videoId) throws Exception {
		videoDao.delete(videoId);
	}

	@Override
	public Video findById(int videoId) {
		return videoDao.findById(videoId);
	}

	@Override
	public List<Video> findAll() {
		return videoDao.findAll();
	}

	@Override
	public List<Video> findByTitle(String title) {
		return videoDao.findByTitle(title);
	}

	@Override
	public List<Video> findAll(int page, int pagesize) {
		return videoDao.findAll(page, pagesize);
	}

	@Override
	public int count() {
		return videoDao.count();
	}
	
	@Override
	public List<Video> findByCategoryId(int categoryId) {
	    return videoDao.findByCategoryId(categoryId);
	}
}