<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form action="<c:url value='/admin/user/insert'/>" method="post">
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username"><br>
    
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email"><br>
    
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password"><br>
    
    <label for="phone">Phone:</label><br>
    <input type="text" id="phone" name="phone"><br>
    
    <label for="images">Image URL:</label><br>
    <input type="text" id="images" name="images"><br>

    <label for="role">Role:</label><br>
    <select id="role" name="role">
        <option value="user">User</option>
        <option value="admin">Admin</option>
    </select><br>

    <p>Status:</p>
    <input type="radio" id="statusOn" name="status" value="1" checked>
    <label for="statusOn">Hoạt động</label><br>
    <input type="radio" id="statusOff" name="status" value="0">
    <label for="statusOff">Không hoạt động</label><br>

    <input type="submit" value="Insert">
</form>