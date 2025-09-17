<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form action="<c:url value='/admin/video/insert'/>" method="post">
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title"><br>
    
    <label for="description">Description:</label><br>
    <textarea id="description" name="description"></textarea><br>
    
    <label for="poster">Poster URL:</label><br>
    <input type="text" id="poster" name="poster"><br>
    
    <p>Active:</p>
    <input type="radio" id="activeOn" name="active" value="1" checked>
    <label for="activeOn">Hoạt động</label><br>
    
    <input type="radio" id="activeOff" name="active" value="0">
    <label for="activeOff">Không hoạt động</label><br>
    
    <label for="categoryId">Category:</label><br>
    <select id="categoryId" name="categoryId">
        <c:forEach items="${listCategory}" var="cate">
            <option value="${cate.categoryId}">${cate.categoryname}</option>
        </c:forEach>
    </select><br>

    <input type="submit" value="Insert">
</form>