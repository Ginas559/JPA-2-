package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		// Tìm kiếm người dùng bằng username và password
		User user = userService.findByUsername(username).stream()
				.filter(u -> u.getPassword().equals(password))
				.findFirst().orElse(null);

		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user); // Lưu đối tượng User vào session
			
			if ("admin".equals(user.getRole())) {
				resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
			} else {
				resp.sendRedirect(req.getContextPath() + "/home");
			}
		} else {
			req.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng.");
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
		}
	}
}