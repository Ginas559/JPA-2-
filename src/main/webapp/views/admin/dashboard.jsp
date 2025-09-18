<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <div class="card-body text-center">
                <h2 class="card-title text-primary mb-3">
                    <i class="bi bi-gear-fill me-2"></i>Chào mừng, <span class="fw-bold">${sessionScope.user.username}</span>!
                </h2>
                <p class="card-text text-muted mb-4">Đây là các chức năng quản trị bạn có thể sử dụng:</p>
                
                <hr class="my-4">

                <div class="row g-3 justify-content-center">
                    <div class="col-md-4">
                        <a href="<c:url value='/admin/categories'/>" class="btn btn-primary btn-lg w-100">
                            <i class="bi bi-tags-fill me-2"></i>Quản lý Category
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="<c:url value='/admin/videos'/>" class="btn btn-success btn-lg w-100">
                            <i class="bi bi-play-btn-fill me-2"></i>Quản lý Video
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="<c:url value='/admin/users'/>" class="btn btn-info btn-lg w-100 text-white">
                            <i class="bi bi-people-fill me-2"></i>Quản lý User
                        </a>
                    </div>
                </div>

                <hr class="my-4">

                <a href="<c:url value='/logout'/>" class="btn btn-danger mt-3">
                    <i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
                </a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>