<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form action="<c:url value='/admin/video/update'/>" method="post">
    <input type="hidden" id="videoId" name="videoId" value="${video.videoId}">
    
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" value="${video.title}"><br>
    
    <label for="description">Description:</label><br>
    <textarea id="description" name="description">${video.description}</textarea><br>
    
    <label for="poster">Poster URL:</label><br>
    <input type="text" id="poster" name="poster" value="${video.poster}"><br>
    
    <p>Active:</p>
    <input type="radio" id="activeOn" name="active" value="1" ${video.active == 1 ? 'checked' : ''}>
    <label for="activeOn">Hoạt động</label><br>
    
    <input type="radio" id="activeOff" name="active" value="0" ${video.active != 1 ? 'checked' : ''}>
    <label for="activeOff">Không hoạt động</label><br>
    
    <label for="categoryId">Category:</label><br>
    <select id="categoryId" name="categoryId">
        <c:forEach items="${listCategory}" var="cate">
            <option value="${cate.categoryId}" ${video.category.categoryId == cate.categoryId ? 'selected' : ''}>
                ${cate.categoryname}
            </option>
        </c:forEach>
    </select><br>

    <input type="submit" value="Update">
</form>