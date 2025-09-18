<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <div class="card-body text-center">
                <h2 class="card-title text-primary mb-3">
                    <i class="bi bi-person-circle me-2"></i>Chào mừng, <span class="fw-bold">${sessionScope.user.username}</span>!
                </h2>
                <p class="card-text text-muted mb-4">Bạn đã đăng nhập thành công!</p>
                
                <div class="d-grid gap-3 col-lg-6 mx-auto">
                    <a href="<c:url value='/user/videos'/>" class="btn btn-primary btn-lg">
                        <i class="bi bi-play-circle me-2"></i>Xem Video
                    </a>
                    <a href="<c:url value='/user/profile'/>" class="btn btn-outline-secondary btn-lg">
                        <i class="bi bi-person-gear me-2"></i>Thông tin tài khoản
                    </a>
                </div>

                <hr class="my-4">

                <a href="<c:url value='/logout'/>" class="btn btn-danger">
                    <i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
                </a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>