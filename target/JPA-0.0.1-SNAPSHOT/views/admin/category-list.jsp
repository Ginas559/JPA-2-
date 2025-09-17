<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<a href="<c:url value='/admin/category/add'/>">Add category</a>

<form action="${pageContext.request.contextPath}/admin/categories" method="get" style="margin: 10px 0;">
    <input type="hidden" name="action" value="search" />
    <input type="text" name="keyword" placeholder="Nhập tên category..." value="${param.keyword}" />
    <button type="submit">Tìm kiếm</button>
</form>

<a href="<c:url value='/admin/categories'/>">Quay lại danh sách đầy đủ</a>

<table border="1">
    <tr>
        <th>STT</th>
        <th>Images</th>
        <th>Category Name</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${listcate}" var="cate" varStatus="STT">
        <tr>
            <td>${STT.index+1}</td>
            <td>
                <img src="<c:url value='/images/${cate.images}'/>" width="150"/>
            </td>
            <td>${cate.categoryname}</td>
            <td>
                <c:choose>
                    <c:when test="${cate.status == 1}">Đang hoạt động</c:when>
                    <c:otherwise>Khóa</c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="<c:url value='/admin/category/edit'>
                            <c:param name='id' value='${cate.categoryId}'/>
                         </c:url>">Edit</a>
                |
                <a href="<c:url value='/admin/category/delete'>
                            <c:param name='id' value='${cate.categoryId}'/>
                         </c:url>">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>