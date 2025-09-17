<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Category</title>
</head>
<body>
    <h2>Danh mục Video</h2>
    <a href="<c:url value='/home'/>">Quay lại trang chủ</a>

    <form action="${pageContext.request.contextPath}/user/videos" method="get" style="margin: 10px 0;">
        <input type="hidden" name="action" value="search" />
        <input type="text" name="keyword" placeholder="Nhập tên danh mục..." value="${param.keyword}" />
        <button type="submit">Tìm kiếm</button>
    </form>
    
    <a href="<c:url value='/user/videos'/>">Quay lại danh sách đầy đủ</a>

    <table border="1">
        <tr>
            <th>STT</th>
            <th>Category ID</th>
            <th>Images</th>
            <th>Category Name</th>
            <th>Status</th>
        </tr>
        <c:forEach items="${listcate}" var="cate" varStatus="STT">
            <tr>
                <td>${STT.index+1}</td>
                <td>${cate.categoryId}</td>
                <td>
                    <img src="${cate.images}" width="150" alt="${cate.categoryname} image"/>
                </td>
                <td>
                    <a href="<c:url value='/user/videosByCate'>
                                <c:param name='categoryId' value='${cate.categoryId}'/>
                             </c:url>">${cate.categoryname}</a>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${cate.status == 1}">Đang hoạt động</c:when>
                        <c:otherwise>Không hoạt động</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>