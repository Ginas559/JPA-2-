<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
    <h2>Đăng nhập</h2>
    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
    <form action="<c:url value='/login'/>" method="post">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Log in">
    </form>
    <p>Chưa có tài khoản? <a href="<c:url value='/register'/>">Đăng ký</a></p>
</body>
</html>