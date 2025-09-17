package vn.iotstar.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.entity.Video;
import vn.iotstar.services.VideoService;
import vn.iotstar.services.impl.VideoServiceImpl;

@WebServlet(urlPatterns = "/user/videosByCate")
public class UserVideosByCateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	VideoService videoService = new VideoServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int categoryId = Integer.parseInt(req.getParameter("categoryId"));
		List<Video> filteredVideos = videoService.findByCategoryId(categoryId);
		
		req.setAttribute("listvideo", filteredVideos);
		req.getRequestDispatcher("/views/user/videosByCate.jsp").forward(req, resp);
	}
}