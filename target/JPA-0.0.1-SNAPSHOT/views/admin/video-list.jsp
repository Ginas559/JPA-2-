<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Quản lý Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .video-poster {
            width: 150px;
            height: 100px;
            object-fit: cover;
            border-radius: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4 text-center text-primary">Quản lý Video</h2>
        
        <div class="d-flex justify-content-between mb-4">
            <a href="<c:url value='/admin/dashboard'/>" class="btn btn-secondary">
                <i class="bi bi-arrow-left me-2"></i>Quay lại Dashboard
            </a>
            <a href="<c:url value='/admin/video/add'/>" class="btn btn-primary">
                <i class="bi bi-plus-circle me-2"></i>Thêm video
            </a>
        </div>

        <form action="${pageContext.request.contextPath}/admin/videos" method="get" class="d-flex mb-4">
            <input type="hidden" name="action" value="search" />
            <input type="text" class="form-control me-2" name="keyword" placeholder="Nhập tên video..." value="${param.keyword}" />
            <button type="submit" class="btn btn-outline-primary">
                <i class="bi bi-search me-2"></i>Tìm kiếm
            </button>
        </form>

        <a href="<c:url value='/admin/videos'/>" class="btn btn-outline-info mb-4">
            <i class="bi bi-list-ul me-2"></i>Danh sách đầy đủ
        </a>

        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Video ID</th>
                        <th scope="col">Tiêu đề</th>
                        <th scope="col">Mô tả</th>
                        <th scope="col">Poster</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Danh mục</th>
                        <th scope="col">Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listvideo}" var="video" varStatus="STT">
                        <tr>
                            <td>${STT.index+1}</td>
                            <td>${video.videoId}</td>
                            <td>${video.title}</td>
                            <td>${video.description}</td>
                            <td>
                                <img src="${video.poster}" class="video-poster" alt="${video.title} poster"/>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${video.active == 1}">
                                        <span class="badge bg-success">Hoạt động</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Không hoạt động</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${video.category.categoryname}</td>
                            <td>
                                <a href="<c:url value='/admin/video/edit'>
                                            <c:param name='id' value='${video.videoId}'/>
                                         </c:url>" class="btn btn-warning btn-sm me-2">
                                    <i class="bi bi-pencil-square"></i>
                                </a>
                                <a href="<c:url value='/admin/video/delete'>
                                            <c:param name='id' value='${video.videoId}'/>
                                         </c:url>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa video này không?');">
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