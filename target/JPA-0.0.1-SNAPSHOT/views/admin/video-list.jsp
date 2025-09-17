<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<a href="<c:url value='/admin/video/add'/>">Add video</a>

<form action="${pageContext.request.contextPath}/admin/videos" method="get" style="margin: 10px 0;">
    <input type="hidden" name="action" value="search" />
    <input type="text" name="keyword" placeholder="Nhập tên video..." value="${param.keyword}" />
    <button type="submit">Tìm kiếm</button>
</form>

<a href="<c:url value='/admin/videos'/>">Quay lại danh sách đầy đủ</a>

<table border="1">
    <tr>
        <th>STT</th>
        <th>Video ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Poster</th>
        <th>Active</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${listvideo}" var="video" varStatus="STT">
        <tr>
            <td>${STT.index+1}</td>
            <td>${video.videoId}</td>
            <td>${video.title}</td>
            <td>${video.description}</td>
            <td>
                <img src="${video.poster}" width="150" alt="${video.title} poster"/>
            </td>
            <td>
                <c:choose>
                    <c:when test="${video.active == 1}">Hoạt động</c:when>
                    <c:otherwise>Không hoạt động</c:otherwise>
                </c:choose>
            </td>
            <td>${video.category.categoryname}</td>
            <td>
                <a href="<c:url value='/admin/video/edit'>
                            <c:param name='id' value='${video.videoId}'/>
                         </c:url>">Edit</a>
                |
                <a href="<c:url value='/admin/video/delete'>
                            <c:param name='id' value='${video.videoId}'/>
                         </c:url>">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>