package vn.iotstar.controllers.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.entity.Category;
import vn.iotstar.entity.Video;
import vn.iotstar.services.CategoryService;
import vn.iotstar.services.VideoService;
import vn.iotstar.services.impl.CategoryServiceImpl;
import vn.iotstar.services.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/admin/videos", "/admin/video/edit", "/admin/video/update", "/admin/video/insert",
		"/admin/video/add", "/admin/video/delete" })
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	VideoService videoService = new VideoServiceImpl();
	CategoryService categoryService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();

		if (url.contains("/admin/videos")) {
			String action = req.getParameter("action");
			String keyword = req.getParameter("keyword");
			String categoryIdParam = req.getParameter("categoryId");

			if ("search".equals(action) && keyword != null && !keyword.isEmpty()) {
				List<Video> searchResults = videoService.findByTitle(keyword);
				req.setAttribute("listvideo", searchResults);
			} else if ("filter".equals(action) && categoryIdParam != null && !categoryIdParam.isEmpty()) {
				int categoryId = Integer.parseInt(categoryIdParam);
				List<Video> filteredResults = videoService.findByCategoryId(categoryId);
				req.setAttribute("listvideo", filteredResults);
			} else {
				List<Video> list = videoService.findAll();
				req.setAttribute("listvideo", list);
			}
			req.getRequestDispatcher("/views/admin/video-list.jsp").forward(req, resp);
		} else if (url.contains("/admin/video/edit")) {
			int id = Integer.parseInt(req.getParameter("id"));
			Video video = videoService.findById(id);
			List<Category> listCategory = categoryService.findAll();
			req.setAttribute("video", video);
			req.setAttribute("listCategory", listCategory);
			req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
		} else if (url.contains("/admin/video/add")) {
			List<Category> listCategory = categoryService.findAll();
			req.setAttribute("listCategory", listCategory);
			req.getRequestDispatcher("/views/admin/video-add.jsp").forward(req, resp);
		} else if (url.contains("/admin/video/delete")) {
			int id = Integer.parseInt(req.getParameter("id"));
			try {
				videoService.delete(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();

		if (url.contains("/admin/video/update")) {
			int videoId = Integer.parseInt(req.getParameter("videoId"));
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String poster = req.getParameter("poster");
			int active = Integer.parseInt(req.getParameter("active"));
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));

			Video video = new Video();
			video.setVideoId(videoId);
			video.setTitle(title);
			video.setDescription(description);
			video.setPoster(poster);
			video.setActive(active);

			Category category = categoryService.findById(categoryId);
			video.setCategory(category);

			videoService.update(video);
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		} else if (url.contains("/admin/video/insert")) {
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String poster = req.getParameter("poster");
			int active = Integer.parseInt(req.getParameter("active"));
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));

			Video video = new Video();
			video.setTitle(title);
			video.setDescription(description);
			video.setPoster(poster);
			video.setActive(active);

			Category category = categoryService.findById(categoryId);
			video.setCategory(category);
			
			videoService.insert(video);
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		}
	}
}