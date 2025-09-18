<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form action="<c:url value='/admin/video/insert'/>" method="post">
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title"><br>
    <br>
    <label for="description">Description:</label><br>
    <textarea id="description" name="description"></textarea><br>
    <br>
    <h3>Dung link anh hcmute: https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/3a/e2/14/3ae214c6-d27a-4bc3-571d-ef2279828425/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png</h3>
    <label for="poster">Poster URL:</label><br>
    <input type="text" id="poster" name="poster"><br>
    <br>
    <p>Active:</p>
    <input type="radio" id="activeOn" name="active" value="1" checked>
    <label for="activeOn">Hoạt động</label><br>
    <br>
    <input type="radio" id="activeOff" name="active" value="0">
    <label for="activeOff">Không hoạt động</label><br>
    <br>
    <label for="categoryId">Category:</label><br>
    <select id="categoryId" name="categoryId">
        <c:forEach items="${listCategory}" var="cate">
            <option value="${cate.categoryId}">${cate.categoryname}</option>
        </c:forEach>
    </select><br>
<br>
    <input type="submit" value="Insert">
</form>