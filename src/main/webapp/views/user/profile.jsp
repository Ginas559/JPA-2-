<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Hồ sơ người dùng</title>
</head>
<body>
    <h2>Hồ sơ người dùng</h2>
    <p><b>Username:</b> ${user.username}</p>
    <p><b>Email:</b> ${user.email}</p>
    <p><b>Phone:</b> ${user.phone}</p>
    <p><b>Role:</b> ${user.role}</p>
    <img src="${user.images}" alt="User Image" style="width:100px;">
    <br><br>
    <a href="<c:url value='/home'/>">Quay lại trang chủ</a>
</body>
</html>