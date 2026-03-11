<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Logic kiểm tra ảnh đại diện --%>
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

<div class="col-lg-3">
    <div class="sidebar-card p-4 text-center sticky-top" style="top: 100px;">
        <div class="sidebar-avatar-wrapper mb-3">
            <img src="${avatarSrc}" alt="User" class="w-100 h-100 rounded-circle" style="object-fit: cover;">
            <div class="status-indicator"></div>
        </div>
        
        <h5 class="fw-bold mb-1">${sessionScope.acc.lastName} ${sessionScope.acc.firstName}</h5>
        <p class="text-muted small mb-4">Thành viên MotoFix</p>
        
        <nav class="sidebar-menu-list">
            <a href="${pageContext.request.contextPath}/customer/profile.jsp" 
               class="sidebar-link ${activePage == 'profile' ? 'active' : ''}">
                <i class="bi bi-person-circle"></i>
                <span>Thông tin cá nhân</span>
            </a>

            <a href="${pageContext.request.contextPath}/customer/history.jsp" 
               class="sidebar-link ${activePage == 'history' ? 'active' : ''}">
                <i class="bi bi-clock-history"></i>
                <span>Lịch sử thuê xe</span>
            </a>

            <a href="${pageContext.request.contextPath}/customer/changepassword.jsp" 
               class="sidebar-link ${activePage == 'password' ? 'active' : ''}">
                <i class="bi bi-shield-lock"></i>
                <span>Đổi mật khẩu</span>
            </a>

            <hr class="my-2 opacity-50">

            <a href="${pageContext.request.contextPath}/logout" class="sidebar-link text-danger">
                <i class="bi bi-box-arrow-right"></i>
                <span>Đăng xuất</span>
            </a>
        </nav>
    </div>
</div>