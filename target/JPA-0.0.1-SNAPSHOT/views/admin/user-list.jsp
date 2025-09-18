<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<a href="<c:url value='/admin/user/add'/>">Add user</a>

<form action="${pageContext.request.contextPath}/admin/users" method="get" style="margin: 10px 0;">
    <input type="hidden" name="action" value="search" />
    <input type="text" name="keyword" placeholder="Nhập username..." value="${param.keyword}" />
    <button type="submit">Tìm kiếm</button>
</form>

<a href="<c:url value='/admin/users'/>">Quay lại danh sách đầy đủ</a>

<table border="1">
    <tr>
        <th>STT</th>
        <th>User ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${listuser}" var="user" varStatus="STT">
        <tr>
            <td>${STT.index+1}</td>
            <td>${user.userId}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>
            <td>
                <c:choose>
                    <c:when test="${user.status == 1}">Hoạt động</c:when>
                    <c:otherwise>Không hoạt động</c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="<c:url value='/admin/user/edit'>
                            <c:param name='id' value='${user.userId}'/>
                         </c:url>">Edit</a>
                |
                <a href="<c:url value='/admin/user/delete'>
                            <c:param name='id' value='${user.userId}'/>
                         </c:url>">Delete</a>
            </td>
        </tr>
    </c:forEach>
    <br>
    <a href="<c:url value='/admin/dashboard'/>">Quay lại Admin Dashboard</a>
</table>