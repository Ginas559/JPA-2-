<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Danh sách Category</title>
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
        <h2 class="mb-4 text-center text-primary">Danh mục Video</h2>
        
        <a href="<c:url value='/home'/>" class="btn btn-secondary mb-4">
            <i class="bi bi-arrow-left-circle me-2"></i>Quay lại trang chủ
        </a>

        <form action="${pageContext.request.contextPath}/user/videos" method="get" class="d-flex mb-4">
            <input type="hidden" name="action" value="search" />
            <input type="text" class="form-control me-2" name="keyword" placeholder="Nhập tên danh mục..." value="${param.keyword}" />
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-search me-2"></i>Tìm kiếm
            </button>
        </form>
        
        <a href="<c:url value='/user/videos'/>" class="btn btn-outline-info mb-4">
            <i class="bi bi-list-ul me-2"></i>Danh sách đầy đủ
        </a>

        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Category ID</th>
                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Tên danh mục</th>
                        <th scope="col">Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listcate}" var="cate" varStatus="STT">
                        <tr>
                            <td>${STT.index+1}</td>
                            <td>${cate.categoryId}</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/images/${cate.images}" class="category-img" alt="${cate.categoryname} image"/>
                            </td>
                            <td>
                                <a href="<c:url value='/user/videosByCate'>
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