package vn.iotstar.controllers.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/admin/users", "/admin/user/edit", "/admin/user/update", "/admin/user/insert",
		"/admin/user/add", "/admin/user/delete" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();

		if (url.contains("/admin/users")) {
			String action = req.getParameter("action");
			String keyword = req.getParameter("keyword");

			if ("search".equals(action) && keyword != null && !keyword.isEmpty()) {
				List<User> searchResults = userService.findByUsername(keyword);
				req.setAttribute("listuser", searchResults);
			} else {
				List<User> list = userService.findAll();
				req.setAttribute("listuser", list);
			}
			req.getRequestDispatcher("/views/admin/user-list.jsp").forward(req, resp);
		} else if (url.contains("/admin/user/edit")) {
			int id = Integer.parseInt(req.getParameter("id"));
			User user = userService.findById(id);
			req.setAttribute("user", user);
			req.getRequestDispatcher("/views/admin/user-edit.jsp").forward(req, resp);
		} else if (url.contains("/admin/user/add")) {
			req.getRequestDispatcher("/views/admin/user-add.jsp").forward(req, resp);
		} else if (url.contains("/admin/user/delete")) {
			int id = Integer.parseInt(req.getParameter("id"));
			try {
				userService.delete(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/users");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();

		if (url.contains("/admin/user/update")) {
			int userId = Integer.parseInt(req.getParameter("userId"));
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String phone = req.getParameter("phone");
			String images = req.getParameter("images");
			String role = req.getParameter("role");
			int status = Integer.parseInt(req.getParameter("status"));

			User user = new User();
			user.setUserId(userId);
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(phone);
			user.setImages(images);
			user.setRole(role);
			user.setStatus(status);

			userService.update(user);
			resp.sendRedirect(req.getContextPath() + "/admin/users");
		} else if (url.contains("/admin/user/insert")) {
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String phone = req.getParameter("phone");
			String images = req.getParameter("images");
			String role = req.getParameter("role");
			int status = Integer.parseInt(req.getParameter("status"));

			User user = new User();
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(phone);
			user.setImages(images);
			user.setRole(role);
			user.setStatus(status);

			userService.insert(user);
			resp.sendRedirect(req.getContextPath() + "/admin/users");
		}
	}
}