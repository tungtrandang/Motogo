<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 1. Xử lý logic ảnh đại diện tại đây --%>
<c:set var="avatarSrc">
    <c:choose>
        <c:when test="${not empty sessionScope.acc.avatarUrl}">
            ${pageContext.request.contextPath}/${sessionScope.acc.avatarUrl}
        </c:when>
        <c:otherwise>
            ${pageContext.request.contextPath}/assets/img/avatar/avatar3.jpg
        </c:otherwise>
    </c:choose>
</c:set>

<%-- 2. Giao diện Sidebar duy nhất --%>
<div class="col-lg-3">
    <div class="card border-0 shadow-sm p-4 text-center sticky-top" style="top: 100px; border-radius: 20px;">
        
        <div class="profile-avatar-container mb-3 mx-auto">
            <img src="${avatarSrc}" alt="User Avatar" class="rounded-circle shadow-sm" 
                 style="width: 100px; height: 100px; object-fit: cover; border: 3px solid #f8f9fa;">
        </div>
        
        <h5 class="fw-bold mb-1">${sessionScope.acc.lastName} ${sessionScope.acc.firstName}</h5>
        <p class="text-muted small">Thành viên MotoGo</p>
        
        <div class="nav flex-column nav-pills mt-4 profile-menu">
            <a href="profile" class="nav-link ${activePage == 'profile' ? 'active shadow-sm' : ''} mb-2 text-start p-3" 
               style="border-radius: 12px; transition: 0.3s;">
                <i class="bi bi-person me-2"></i> Thông tin cá nhân
            </a>

            <a href="history" class="nav-link ${activePage == 'history' ? 'active shadow-sm' : ''} mb-2 text-start p-3" 
               style="border-radius: 12px; transition: 0.3s;">
                <i class="bi bi-clock-history me-2"></i> Lịch sử thuê xe
            </a>

            <a href="changepassword" class="nav-link ${activePage == 'password' ? 'active shadow-sm' : ''} mb-2 text-start p-3" 
               style="border-radius: 12px; transition: 0.3s;">
                <i class="bi bi-key me-2"></i> Đổi mật khẩu
            </a>

            <hr class="my-3">
            
            <a href="logout" class="nav-link text-danger text-start p-3" style="border-radius: 12px;">
                <i class="bi bi-box-arrow-right me-2"></i> Đăng xuất
            </a>
        </div>
    </div>
</div>