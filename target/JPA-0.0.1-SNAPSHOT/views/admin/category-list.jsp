<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Quản lý Danh mục</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .category-img {
            width: 150px;
            height: 100px;
            object-fit: cover;
            border-radius: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4 text-center text-primary">Quản lý Danh mục</h2>
        
        <div class="d-flex justify-content-between mb-4">
            <a href="<c:url value='/admin/dashboard'/>" class="btn btn-secondary">
                <i class="bi bi-arrow-left me-2"></i>Quay lại Dashboard
            </a>
            <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary">
                <i class="bi bi-plus-circle me-2"></i>Thêm danh mục
            </a>
        </div>

        <form action="${pageContext.request.contextPath}/admin/categories" method="get" class="d-flex mb-4">
            <input type="hidden" name="action" value="search" />
            <input type="text" class="form-control me-2" name="keyword" placeholder="Nhập tên danh mục..." value="${param.keyword}" />
            <button type="submit" class="btn btn-outline-primary">
                <i class="bi bi-search me-2"></i>Tìm kiếm
            </button>
        </form>
        
        <a href="<c:url value='/admin/categories'/>" class="btn btn-outline-info mb-4">
            <i class="bi bi-list-ul me-2"></i>Danh sách đầy đủ
        </a>

        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">ID</th>
                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Tên danh mục</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listcate}" var="cate" varStatus="STT">
                        <tr>
                            <td>${STT.index+1}</td>
                            <td>${cate.categoryId}</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/images/${cate.images}" width="150" alt="${cate.categoryname} image"/>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/videos'>
                                            <c:param name='action' value='filter'/>
                                            <c:param name='categoryId' value='${cate.categoryId}'/>
                                         </c:url>">${cate.categoryname}</a>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${cate.status == 1}">
                                        <span class="badge bg-success">Đang hoạt động</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Không hoạt động</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/category/edit'>
                                            <c:param name='id' value='${cate.categoryId}'/>
                                         </c:url>" class="btn btn-warning btn-sm me-2">
                                    <i class="bi bi-pencil-square"></i>
                                </a>
                                <a href="<c:url value='/admin/category/delete'>
                                            <c:param name='id' value='${cate.categoryId}'/>
                                         </c:url>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>