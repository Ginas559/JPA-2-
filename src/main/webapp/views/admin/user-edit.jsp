<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form action="<c:url value='/admin/user/update'/>" method="post">
    <input type="hidden" id="userId" name="userId" value="${user.userId}">

    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" value="${user.username}"><br>
    
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" value="${user.email}"><br>
    
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" value="${user.password}"><br>
    
    <label for="phone">Phone:</label><br>
    <input type="text" id="phone" name="phone" value="${user.phone}"><br>
    
    <label for="images">Image URL:</label><br>
    <input type="text" id="images" name="images" value="${user.images}"><br>

    <label for="role">Role:</label><br>
    <select id="role" name="role">
        <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
        <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
    </select><br>

    <p>Status:</p>
    <input type="radio" id="statusOn" name="status" value="1" ${user.status == 1 ? 'checked' : ''}>
    <label for="statusOn">Hoạt động</label><br>
    <input type="radio" id="statusOff" name="status" value="0" ${user.status != 1 ? 'checked' : ''}>
    <label for="statusOff">Không hoạt động</label><br>

    <input type="submit" value="Update">
</form>