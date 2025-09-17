<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Video theo Category</title>
</head>
<body>
    <h2>Video theo Category</h2>
    <a href="<c:url value='/user/videos'/>">Quay lại danh sách danh mục</a>
    
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Title</th>
            <th>Description</th>
            <th>Poster</th>
        </tr>
        <c:forEach items="${listvideo}" var="video" varStatus="STT">
            <tr>
                <td>${STT.index+1}</td>
                <td>${video.title}</td>
                <td>${video.description}</td>
                <td>
                    <img src="${video.poster}" width="150" alt="${video.title} poster"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>