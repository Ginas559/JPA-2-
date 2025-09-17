package vn.iotstar.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String images = req.getParameter("images");

		// Kiểm tra username đã tồn tại chưa
		User existingUser = userService.findByUsername2(username);
		if (existingUser != null) {
			req.setAttribute("error", "Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.");
			req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
			return;
		}

		// Tạo đối tượng User mới
		User user = new User();
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(phone);
		user.setImages(images); // Lưu đường dẫn ảnh
		user.setRole("user"); 
		user.setStatus(1); 

		userService.insert(user);
		
		// Chuyển hướng về trang đăng nhập
		req.setAttribute("success", "Đăng ký thành công. Bây giờ bạn có thể đăng nhập.");
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}
}