<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Danh sách Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4 text-center">Danh sách Video</h2>
        
        <div class="d-flex justify-content-end mb-3">
            <a href="<c:url value='/home'/>" class="btn btn-secondary">
                <i class="bi bi-arrow-left me-2"></i>Quay lại trang chủ
            </a>
        </div>
        
        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Tiêu đề</th>
                        <th scope="col">Mô tả</th>
                        <th scope="col">Danh mục</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listvideo}" var="video" varStatus="STT">
                        <tr>
                            <td class="col-1">${STT.index + 1}</td>
                            <td class="col-4">${video.title}</td>
                            <td class="col-5">${video.description}</td>
                            <td class="col-2">${video.category.categoryname}</td>
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