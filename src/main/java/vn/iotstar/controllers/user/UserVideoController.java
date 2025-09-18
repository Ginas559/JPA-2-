package vn.iotstar.controllers.user;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.entity.Category;
import vn.iotstar.services.CategoryService;
import vn.iotstar.services.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = "/user/videos")
public class UserVideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CategoryService categoryService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		String keyword = req.getParameter("keyword");

		if ("search".equals(action) && keyword != null && !keyword.isEmpty()) {
			List<Category> searchResults = categoryService.findByCategoryname(keyword);
			req.setAttribute("listcate", searchResults);
		} else {
			List<Category> list = categoryService.findAll();
			req.setAttribute("listcate", list);
		}
		
		req.getRequestDispatcher("/views/user/categories.jsp").forward(req, resp);
	}
}