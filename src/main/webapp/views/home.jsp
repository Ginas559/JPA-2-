<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ</title>
</head>
<body>
    <h2>Chào mừng, ${sessionScope.user.username}</h2>
    <p>Bạn đã đăng nhập thành công!</p>
    <ul>
        <li><a href="<c:url value='/user/videos'/>">Xem Video</a></li>
        <li><a href="<c:url value='/user/profile'/>">Thông tin tài khoản</a></li>
    </ul>
    <a href="<c:url value='/logout'/>">Đăng xuất</a>
</body>
</html>