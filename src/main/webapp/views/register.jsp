<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
    <h2>Đăng ký tài khoản mới</h2>
    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
    <form action="<c:url value='/register'/>" method="post">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" value="${param.username}"><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" value="${param.email}"><br><br>
        
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br><br>
        
        <label for="phone">Phone:</label><br>
        <input type="text" id="phone" name="phone" value="${param.phone}"><br><br>
        
        <label for="images">Image URL:</label><br>
        <input type="text" id="images" name="images" value="${param.images}"><br><br>
        
        <label for="role">Role:</label><br>
        <select id="role" name="role">
            <option value="user">User</option>
            <option value="admin">Admin</option>
        </select><br><br>
        
        <input type="submit" value="Đăng ký">
    </form>
    <p>Đã có tài khoản? <a href="<c:url value='/login'/>">Đăng nhập</a></p>
</body>
</html>