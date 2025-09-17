<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Chào mừng, ${sessionScope.user.username} (Admin)</h2>
    <p>Đây là các chức năng bạn có thể sử dụng:</p>
    <ul>
        <li><a href="<c:url value='/admin/categories'/>">Quản lý Category</a></li>
        <li><a href="<c:url value='/admin/videos'/>">Quản lý Video</a></li>
        <li><a href="<c:url value='/admin/users'/>">Quản lý User</a></li>
    </ul>
    <a href="<c:url value='/logout'/>">Đăng xuất</a>
</body>
</html>