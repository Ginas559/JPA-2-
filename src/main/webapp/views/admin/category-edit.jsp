<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
    <!-- Sửa chỗ này: categoryid -> categoryId -->
    <input type="text" id="categoryid" name="categoryid" hidden="hidden" value="${cate.categoryId}">
    
    <label for="cname">Category name:</label><br>
    <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}"><br>

    <label for="lname">Images:</label><br>
    <c:if test="${cate.images.substring(0, 5) == 'https'}">
        <c:url value="${cate.images}" var="imgUrl"/>
    </c:if>
    <c:if test="${cate.images.substring(0, 5) != 'https'}">
        <c:url value="/image?fname=${cate.images}" var="imgUrl"/>
    </c:if>
    <img src="<c:url value='/images/${cate.images}'/>" width="150"/>

    <input type="file" onchange="chooseFile(this)" id="images" name="images" value="${cate.images}"><br>

    <p>Status:</p>
    <input type="radio" id="ston" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}>
    <label for="ston">Đang hoạt động</label><br>
    
    <input type="radio" id="stoff" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}>
    <label for="stoff">Khóa</label><br>

    <input type="submit" value="Update">
</form>
