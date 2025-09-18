<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hồ sơ người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .profile-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%; /* Tạo hình tròn cho ảnh */
            border: 3px solid #007bff;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow-lg p-4 text-center">
            <div class="card-body">
                <h2 class="card-title mb-4">Hồ sơ người dùng</h2>
                
                <div class="mb-4">
                    <img src="${pageContext.request.contextPath}/images/${user.images}" alt="User Image" class="profile-img">
                </div>
                
                <ul class="list-group list-group-flush mb-4">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <b>Username:</b>
                        <span>${user.username}</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <b>Email:</b>
                        <span>${user.email}</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <b>Phone:</b>
                        <span>${user.phone}</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <b>Role:</b>
                        <span>${user.role}</span>
                    </li>
                </ul>
                
                <a href="<c:url value='/home'/>" class="btn btn-secondary mt-3">
                    <i class="bi bi-arrow-left-circle me-2"></i>Quay lại trang chủ
                </a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>