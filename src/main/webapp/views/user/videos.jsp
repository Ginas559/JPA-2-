<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Video</title>
</head>
<body>
    <h2>Danh sách Video</h2>
    <a href="<c:url value='/home'/>">Quay lại trang chủ</a>
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Title</th>
            <th>Description</th>
            <th>Category</th>
        </tr>
        <c:forEach items="${listvideo}" var="video" varStatus="STT">
            <tr>
                <td>${STT.index+1}</td>
                <td>${video.title}</td>
                <td>${video.description}</td>
                <td>${video.category.categoryname}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>